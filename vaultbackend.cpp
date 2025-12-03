#include "vaultbackend.h"
#include <QDir>
#include <QFile>
#include <QStandardPaths>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDateTime>
#include <QDebug>
#include <QCryptographicHash>
#include <QRandomGenerator>
#include <cmath>
#include <cstring>
#include <QtGlobal>
#include <QSysInfo>
#include <QTextStream>

QString getDatabasePath() {
    QString path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);

    QDir dir;
    if (!dir.mkpath(path)) {
        qCritical() << "CRITICAL: Cannot create application data path:" << path;
        return "vault.dat";
    }

    return path + QDir::separator() + "vault.dat";
}

QByteArray get8RandomBytes() {
    quint64 randomValue = QRandomGenerator::system()->generate64();
    QByteArray array(8, Qt::Uninitialized);
    memcpy(array.data(), &randomValue, 8);
    return array;
}

QByteArray VaultBackend::generateSystemHash() const {
    QString systemInfo = qEnvironmentVariable("USER") + QSysInfo::machineHostName() + QSysInfo::kernelType();
    return QCryptographicHash::hash(systemInfo.toUtf8(), QCryptographicHash::Sha256);
}

bool VaultBackend::checkIntegrity(const QByteArray &fileData, const QByteArray &key) const {
    if (fileData.size() < 72) return false;

    QByteArray receivedHMAC = fileData.right(32);
    QByteArray dataToCheck = fileData.left(fileData.size() - 32);
    QByteArray expectedHMAC = QCryptographicHash::hash(key + dataToCheck, QCryptographicHash::Sha256);

    return expectedHMAC == receivedHMAC;
}

bool VaultBackend::checkSystemBound() const {
    return m_systemIDHash == generateSystemHash();
}

VaultBackend::VaultBackend(QObject *parent) : QObject(parent) {
    loadNicknameWords();
}


QByteArray VaultBackend::deriveKey(const QString &password, const QByteArray &salt) {
    QByteArray key = password.toUtf8();
    for(int i = 0; i < 10000; ++i) {
        QByteArray dataToHash = salt + key;
        key = QCryptographicHash::hash(dataToHash, QCryptographicHash::Sha256);
    }
    return key;
}

QByteArray VaultBackend::encryptData(const QByteArray &data, const QString &masterKey) {
    if (m_salt.isEmpty()) m_salt = get8RandomBytes();
    QByteArray iv = get8RandomBytes();
    QByteArray key = deriveKey(masterKey, m_salt);

    QByteArray result;
    QByteArray blockKey = key;
    for (int i = 0; i < data.size(); ++i) {
        if (i > 0 && i % 32 == 0) blockKey = QCryptographicHash::hash(blockKey + iv, QCryptographicHash::Sha256);
        result.append(data[i] ^ blockKey[i % 32]);
    }

    QByteArray systemBoundHash = generateSystemHash();

    QByteArray output;
    output.append(systemBoundHash);
    output.append(m_salt);
    output.append(iv);
    output.append(result);

    QByteArray hmac = QCryptographicHash::hash(key + output, QCryptographicHash::Sha256);
    output.append(hmac);

    return output;
}

QByteArray VaultBackend::decryptData(const QByteArray &fileData, const QString &masterKey) {
    if (fileData.size() < 72) return QByteArray();

    QByteArray integrityKey = deriveKey(masterKey, fileData.mid(32, 8));
    if (!checkIntegrity(fileData, integrityKey)) return QByteArray();

    QByteArray systemID = fileData.mid(0, 32);
    if (systemID != generateSystemHash()) return QByteArray();

    QByteArray salt = fileData.mid(32, 8);
    QByteArray iv = fileData.mid(40, 8);
    QByteArray encryptedContent = fileData.mid(48, fileData.size() - 48 - 32);

    QByteArray key = deriveKey(masterKey, salt);
    QByteArray result;
    QByteArray blockKey = key;

    for (int i = 0; i < encryptedContent.size(); ++i) {
        if (i > 0 && i % 32 == 0) blockKey = QCryptographicHash::hash(blockKey + iv, QCryptographicHash::Sha256);
        result.append(encryptedContent[i] ^ blockKey[i % 32]);
    }

    m_salt = salt;
    m_systemIDHash = systemID;
    return result;
}

void VaultBackend::loadNicknameWords(const QString &filePath) {
    QFile file(":/data/theme_data.txt");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        m_themeWords.insert("default", QStringList() << "Crypto" << "Wizard" << "Cyber" << "Root" << "Matrix");
        qWarning() << "Theme data resource not found (:/data/theme_data.txt). Using default list.";
        return;
    }

    QTextStream in(&file);
    QString currentTheme = "default";
    m_themeWords.insert(currentTheme, QStringList());

    while (!in.atEnd()) {
        QString line = in.readLine().trimmed();
        if (line.isEmpty()) continue;

        if (line.startsWith("[Theme:") && line.endsWith("]")) {
            currentTheme = line.mid(7, line.length() - 8).trimmed();
            m_themeWords.insert(currentTheme, QStringList());
        } else {
            m_themeWords[currentTheme].append(line);
        }
    }
    file.close();
    qDebug() << "Loaded" << m_themeWords.keys().size() << "themes.";
}

QStringList VaultBackend::getAvailableThemes() const {
    return m_themeWords.keys();
}

QString VaultBackend::generateNickname(int maxLength, bool useMushup, bool useInjection) {
    if (m_themeWords.isEmpty() || m_themeWords.keys().isEmpty()) {
        return "ERROR_NO_THEMES";
    }

    QStringList allThemes = m_themeWords.keys();
    QString theme1 = allThemes.at(QRandomGenerator::system()->bounded(allThemes.size()));
    QString theme2 = allThemes.at(QRandomGenerator::system()->bounded(allThemes.size()));

    QStringList words1 = m_themeWords.value(theme1);
    QStringList words2 = m_themeWords.value(theme2);

    QString baseNickname = "";

    if (useMushup && words1.size() > 0 && words2.size() > 0) {
        QString word1 = words1.at(QRandomGenerator::system()->bounded(words1.size()));
        QString word2 = words2.at(QRandomGenerator::system()->bounded(words2.size()));

        int split1 = QRandomGenerator::system()->bounded(word1.length() > 1 ? word1.length() : 1);

        baseNickname = word1.left(split1) + word2.right(word2.length() - split1);
        baseNickname = baseNickname.toLower();

    } else if (words1.size() > 0) {
        baseNickname = words1.at(QRandomGenerator::system()->bounded(words1.size()));
        baseNickname = baseNickname.toLower();
    } else {
        return "nick_error";
    }

    QString finalNickname = baseNickname;

    if (useInjection) {
        const QString symbols = "!@#$%^&";
        int numSymbols = QRandomGenerator::system()->bounded(1, 4);

        for (int i = 0; i < numSymbols; ++i) {
            int pos = QRandomGenerator::system()->bounded(finalNickname.length() + 1);
            finalNickname.insert(pos, symbols.at(QRandomGenerator::system()->bounded(symbols.length())));
        }

        finalNickname += QString::number(QRandomGenerator::system()->bounded(100, 999));
    }

    finalNickname.replace(' ', '_');

    if (finalNickname.length() > maxLength) {
        finalNickname = finalNickname.left(maxLength);
    }

    return finalNickname;
}


int VaultBackend::calculatePasswordStrength(const QString &password) {
    if (password.isEmpty()) return 0;

    bool hasUpper = false, hasLower = false, hasDigit = false, hasSymbol = false;
    for (QChar c : password) {
        if (c.isUpper()) hasUpper = true;
        else if (c.isLower()) hasLower = true;
        else if (c.isDigit()) hasDigit = true;
        else hasSymbol = true;
    }

    int poolSize = 0;
    if (hasLower) poolSize += 26;
    if (hasUpper) poolSize += 26;
    if (hasDigit) poolSize += 10;
    if (hasSymbol) poolSize += 32;

    // Ентропія E = L * log2(R)
    double entropy = password.length() * std::log2(poolSize > 0 ? poolSize : 1);

    int score = (int)entropy;
    if (score > 100) score = 100;
    return score;
}


QString VaultBackend::generateSecureString(int length, bool useUpper, bool useLower, bool useDigits, bool useSymbols) {
    const QString upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const QString lower = "abcdefghijklmnopqrstuvwxyz";
    const QString digits = "0123456789";
    const QString symbols = "!@#$%^&*()-_=+[]{}<>?";

    QString charSet;
    if (useUpper) charSet += upper;
    if (useLower) charSet += lower;
    if (useDigits) charSet += digits;
    if (useSymbols) charSet += symbols;

    if (charSet.isEmpty() || length <= 0) return "";

    QString result;
    QRandomGenerator *rng = QRandomGenerator::system();

    for (int i = 0; i < length; ++i) {
        quint32 index = rng->bounded((quint32)charSet.length());
        result.append(charSet.at(index));
    }
    return result;
}


void VaultBackend::saveDatabaseToFile() {
    if (m_masterKey.isEmpty()) return;

    QJsonDocument doc(QJsonArray::fromVariantList(m_vaultEntries));
    QByteArray rawData = doc.toJson(QJsonDocument::Compact);

    QByteArray encryptedData = encryptData(rawData, m_masterKey);

    QDir dir;
    if (!dir.exists("data")) {
        dir.mkpath("data");
    }

    QFile file(getDatabasePath());
    if (file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        file.write(encryptedData);
        file.close();
        qDebug() << "Database saved successfully to:" << getDatabasePath();
    } else {
        qCritical() << "Error opening file for writing:" << file.errorString();
    }
}

QString VaultBackend::saveEntry(const QString &site, const QString &login, const QString &password, const QString &masterKey) {
    if (m_masterKey.isEmpty()) m_masterKey = masterKey;
    else if (m_masterKey != masterKey) return "Помилка: Невірний ключ.";

    QVariantMap entry;
    entry["site"] = site;
    entry["login"] = login;
    entry["password"] = password;
    entry["date"] = QDateTime::currentDateTime().toString();
    entry["strength"] = calculatePasswordStrength(password);

    m_vaultEntries.append(entry);
    saveDatabaseToFile();
    return "Запис успішно додано!";
}

QString VaultBackend::updateEntry(int index, const QString &site, const QString &login, const QString &password, const QString &masterKey) {
    if (index < 0 || index >= m_vaultEntries.size()) return "Помилка індексу";
    if (m_masterKey != masterKey) return "Помилка доступу";

    QVariantMap entry;
    entry["site"] = site;
    entry["login"] = login;
    entry["password"] = password;
    entry["date"] = QDateTime::currentDateTime().toString();
    entry["strength"] = calculatePasswordStrength(password);

    m_vaultEntries[index] = entry;
    saveDatabaseToFile();
    return "Запис оновлено!";
}

QString VaultBackend::deleteEntry(int index) {
    if (index < 0 || index >= m_vaultEntries.size()) return "Помилка індексу.";

    m_vaultEntries.removeAt(index);
    saveDatabaseToFile();
    return "Запис успішно видалено!";
}

QVariantMap VaultBackend::getEntryDetails(int index) const {
    if (index < 0 || index >= m_vaultEntries.size()) return QVariantMap();
    return m_vaultEntries.at(index).toMap();
}

QString VaultBackend::getPassword(int index, const QString &masterKey) {
    if (m_masterKey != masterKey) return "";
    return m_vaultEntries.at(index).toMap()["password"].toString();
}

bool VaultBackend::loadDatabase(const QString &masterKey) {
    QFile file(getDatabasePath());
    if (!file.exists()) {
        m_masterKey = masterKey;
        m_salt = get8RandomBytes();
        m_systemIDHash = generateSystemHash();
        return true;
    }

    if (file.open(QIODevice::ReadOnly)) {
        QByteArray encryptedData = file.readAll();
        file.close();

        QByteArray decryptedData = decryptData(encryptedData, masterKey);

        if (decryptedData.isEmpty()) return false;

        QJsonDocument doc = QJsonDocument::fromJson(decryptedData);
        if (doc.isNull() || !doc.isArray()) return false;

        m_vaultEntries = doc.array().toVariantList();
        m_masterKey = masterKey;
        return true;
    }
    return false;
}

QString VaultBackend::exportDatabase(const QString &filePath) {
    if (m_masterKey.isEmpty()) return "Сховище заблоковано.";
    QFile src(getDatabasePath());
    if (src.copy(filePath)) return "Базу успішно експортовано.";
    return "Помилка експорту: " + src.errorString();
}

QString VaultBackend::importDatabase(const QString &filePath, const QString &masterKey) {
    QFile src(filePath);
    if (!src.open(QIODevice::ReadOnly)) return "Не вдалося відкрити файл імпорту.";

    QByteArray data = src.readAll();
    src.close();

    QByteArray decrypted = decryptData(data, masterKey);

    if (decrypted.isEmpty()) return "Помилка: Невірний ключ, цілісність порушена або інша система.";

    QJsonDocument doc = QJsonDocument::fromJson(decrypted);

    if (doc.isNull() || !doc.isArray()) return "Помилка: Невірний формат файлу.";

    m_vaultEntries = doc.array().toVariantList();
    m_masterKey = masterKey;
    saveDatabaseToFile();
    return "Базу успішно імпортовано!";
}
