#ifndef VAULTBACKEND_H
#define VAULTBACKEND_H

#include <QObject>
#include <QVariantList>
#include <QVariantMap>
#include <QMap>
#include <QStandardPaths>

class VaultBackend : public QObject {
    Q_OBJECT

public:
    explicit VaultBackend(QObject *parent = nullptr);

    QString generateSecureString(int length, bool useUpper, bool useLower, bool useDigits, bool useSymbols);
    int calculatePasswordStrength(const QString &password);

    QString generateNickname(int maxLength, bool useMushup, bool useInjection);
    QStringList getAvailableThemes() const;

    QString saveEntry(const QString &site, const QString &login, const QString &password, const QString &masterKey);
    QString updateEntry(int index, const QString &site, const QString &login, const QString &password, const QString &masterKey);
    QString deleteEntry(int index);

    QVariantMap getEntryDetails(int index) const;
    QString getPassword(int index, const QString &masterKey);

    bool loadDatabase(const QString &masterKey);
    bool checkSystemBound() const;
    bool isSystemBoundDatabase() const { return !m_systemIDHash.isEmpty(); }

    QString exportDatabase(const QString &filePath);
    QString importDatabase(const QString &filePath, const QString &masterKey);
    QVariantList vaultEntries() const { return m_vaultEntries; }
    bool isDatabaseLoaded() const { return !m_masterKey.isEmpty(); }

private:
    QVariantList m_vaultEntries;
    QString m_masterKey;

    QByteArray m_salt;
    QByteArray m_iv;
    QByteArray m_systemIDHash;

    QMap<QString, QStringList> m_themeWords;
    void loadNicknameWords(const QString &filePath = "data/theme_data.txt");

    QByteArray deriveKey(const QString &password, const QByteArray &salt);
    QByteArray encryptData(const QByteArray &data, const QString &masterKey);
    QByteArray decryptData(const QByteArray &encryptedData, const QString &masterKey);
    void saveDatabaseToFile();

    QByteArray generateSystemHash() const;
    bool checkIntegrity(const QByteArray &fileData, const QByteArray &key) const;
};

#endif
