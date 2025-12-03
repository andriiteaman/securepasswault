#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QInputDialog>
#include <QMessageBox>
#include <QListWidgetItem>
#include <QClipboard>
#include <QTimer>
#include <QFileDialog>
#include <QStatusBar>
#include <QRandomGenerator>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    vaultManager = new VaultBackend(this);

    setWindowTitle("Secure VaultPass (SVP)");

    if (vaultManager->isSystemBoundDatabase() && !vaultManager->checkSystemBound()) {
        QMessageBox::critical(this, "Помилка безпеки", "База даних прив'язана до іншої системи, або порушена її цілісність. Доступ заборонено!");
        this->close();
        return;
    }

    promptForMasterKey(true);

    ui->siteInput->setPlaceholderText("Website / Service");

    ui->loginInput->setPlaceholderText("Username / Nickname");
    ui->passwordOutput->setPlaceholderText("Password / Key");
    ui->searchInput->setPlaceholderText("Search Records...");

    connect(ui->vaultList, &QListWidget::itemDoubleClicked, this, &MainWindow::on_viewDetailsButton_clicked);
    connect(ui->searchInput, &QLineEdit::textChanged, this, &MainWindow::filterVaultList);
    connect(ui->deleteButton, &QPushButton::clicked, this, &MainWindow::on_deleteButton_clicked);
    m_statusLabel = new QLabel(this);
    statusBar()->addWidget(m_statusLabel);
    m_statusLabel->setText("Готовий. Налаштуйте генерацію.");
}

MainWindow::~MainWindow()
{
    delete ui;
    delete vaultManager;
}

void MainWindow::promptForMasterKey(bool initialSetup) {
    if (masterKey.isEmpty() && initialSetup || !initialSetup) {
        QString title = initialSetup ? "Налаштування / Розблокування" : "Розблокування Сховища";
        bool ok;
        QString text = QInputDialog::getText(this, title,
                                             "Введіть або створіть Майстер-код:",
                                             QLineEdit::Password, "", &ok);

        if (ok && !text.isEmpty()) {
            if (vaultManager->loadDatabase(text)) {
                masterKey = text;
                if(initialSetup) {
                    QMessageBox::information(this, "Успіх", "Сховище розблоковано. База прив'язана до цієї системи.");
                }
                updateVaultList();
            } else {
                QMessageBox::critical(this, "Помилка", "Невірний код, порушення цілісності або прив'язка до іншої системи.");
                masterKey.clear();
            }
        }
    }
}


void MainWindow::updateVaultList() {
    ui->vaultList->clear();
    QVariantList entries = vaultManager->vaultEntries();
    for (const QVariant &entry : entries) {
        ui->vaultList->addItem(entry.toMap()["site"].toString());
    }
}

void MainWindow::filterVaultList(const QString &searchText) {
    for (int i = 0; i < ui->vaultList->count(); ++i) {
        QListWidgetItem *item = ui->vaultList->item(i);
        bool match = item->text().contains(searchText, Qt::CaseInsensitive);
        item->setHidden(!match);
    }
}

void MainWindow::clearClipboard() {
    QApplication::clipboard()->clear();
    m_statusLabel->setText("Буфер обміну очищено заради безпеки.");
}

void MainWindow::on_generateButton_clicked() {
    QString pwd = vaultManager->generateSecureString(
        ui->lengthSpin->value(), ui->cbUpper->isChecked(), ui->cbLower->isChecked(),
        ui->cbDigits->isChecked(), ui->cbSymbols->isChecked()
        );
    ui->passwordOutput->setText(pwd);

    int strength = vaultManager->calculatePasswordStrength(pwd);
    QString statusColor = (strength > 75) ? "green" : (strength > 40) ? "orange" : "red";
    QString statusIcon = (statusColor == "green") ? "✅" : (statusColor == "orange") ? "⚠️" : "❌";

    QString htmlMessage = QString(
                              "<span style='color: %1; font-weight: bold;'>%2 Стійкість Паролю: </span>"
                              "<span style='color: #DDDDDD;'>%3/100</span>")
                              .arg(statusColor)
                              .arg(statusIcon)
                              .arg(strength);

    m_statusLabel->setText(htmlMessage);
}

void MainWindow::on_generateNickButton_clicked() {
    bool useMushup = ui->cb_useMushup->isChecked();
    bool useInjection = ui->cb_useInjection->isChecked();

    if (!useMushup && !useInjection) {
        m_statusLabel->setText("Будь ласка, оберіть хоча б одну стратегію (Mushup або Injection).");
        return;
    }

    QString nick = vaultManager->generateNickname(30, useMushup, useInjection);

    ui->loginInput->setText(nick);

    QString statusMsg = "Нік згенеровано. Cтратегії: ";
    if (useMushup) statusMsg += "Mushup (Комбінація слів)";
    if (useMushup && useInjection) statusMsg += " та ";
    if (useInjection) statusMsg += "Injection (Символи та числа)";

    m_statusLabel->setText(statusMsg);
}

void MainWindow::on_saveButton_clicked() {
    if (masterKey.isEmpty()) promptForMasterKey(false);
    if (masterKey.isEmpty()) return;

    QString res = vaultManager->saveEntry(ui->siteInput->text(), ui->loginInput->text(), ui->passwordOutput->text(), masterKey);
    QMessageBox::information(this, "Збереження", res);
    updateVaultList();

    ui->siteInput->clear();
    ui->loginInput->clear();
    ui->passwordOutput->clear();
}

void MainWindow::showPasswordDetails(int index) {
    QVariantMap entry = vaultManager->getEntryDetails(index);

    QMessageBox msgBox;
    msgBox.setWindowTitle("Деталі запису");

    QString detailsText = QString("Сайт: %1\nЛогін: %2\nПароль: %3\nСтійкість: %4/100\nДата: %5")
                              .arg(entry["site"].toString())
                              .arg(entry["login"].toString())
                              .arg(entry["password"].toString())
                              .arg(entry["strength"].toInt())
                              .arg(entry["date"].toString());

    msgBox.setText(detailsText);

    QPushButton *copyBtn = msgBox.addButton("Копіювати Пароль", QMessageBox::ActionRole);
    QPushButton *updateBtn = msgBox.addButton("Перегенерувати", QMessageBox::ActionRole);
    msgBox.addButton(QMessageBox::Close);

    msgBox.exec();

    if (msgBox.clickedButton() == copyBtn) {
        QString pwd = vaultManager->getPassword(index, masterKey);
        QApplication::clipboard()->setText(pwd);
        QMessageBox::information(this, "Буфер", "Пароль скопійовано! Буфер буде очищено через 20 с.");

        QTimer::singleShot(20000, this, &MainWindow::clearClipboard);
    }
    else if (msgBox.clickedButton() == updateBtn) {
        QString newPwd = vaultManager->generateSecureString(ui->lengthSpin->value(), true, true, true, true);
        QString res = vaultManager->updateEntry(index, entry["site"].toString(), entry["login"].toString(), newPwd, masterKey);
        QMessageBox::information(this, "Оновлення", "Новий пароль: " + newPwd + "\n" + res);
        updateVaultList();
    }
}

void MainWindow::on_viewDetailsButton_clicked() {
    QListWidgetItem *item = ui->vaultList->currentItem();
    if (!item) return;

    bool ok;
    QString currentKey = QInputDialog::getText(this, "Повторна Автентифікація",
                                               "Введіть Майстер-код для перегляду:",
                                               QLineEdit::Password, "", &ok);

    if (!ok || currentKey.isEmpty() || currentKey != masterKey) {
        QMessageBox::warning(this, "Доступ", "Невірний Майстер-код.");
        return;
    }

    int idx = ui->vaultList->row(item);
    showPasswordDetails(idx);
}

void MainWindow::on_exportButton_clicked() {
    QString path = QFileDialog::getSaveFileName(this, "Експорт бази", "", "Vault Files (*.dat)");
    if (!path.isEmpty()) {
        QMessageBox::information(this, "Експорт", vaultManager->exportDatabase(path));
    }
}

void MainWindow::on_importButton_clicked() {
    QString path = QFileDialog::getOpenFileName(this, "Імпорт бази", "", "Vault Files (*.dat)");
    if (!path.isEmpty()) {
        QString key = QInputDialog::getText(this, "Імпорт", "Введіть Майстер-код для файлу:", QLineEdit::Password);
        if (!key.isEmpty()) {
            QMessageBox::information(this, "Імпорт", vaultManager->importDatabase(path, key));
            updateVaultList();
        }
    }
}

void MainWindow::on_deleteButton_clicked() {
    QListWidgetItem *item = ui->vaultList->currentItem();
    if (!item) {
        QMessageBox::warning(this, "Помилка", "Будь ласка, оберіть запис для видалення.");
        return;
    }

    bool ok;
    QString currentKey = QInputDialog::getText(this, "Повторна Автентифікація",
                                               "Введіть Майстер-код для підтвердження видалення:",
                                               QLineEdit::Password, "", &ok);

    if (!ok || currentKey.isEmpty() || currentKey != masterKey) {
        QMessageBox::warning(this, "Доступ Заборонено", "Невірний Майстер-код. Видалення скасовано.");
        return;
    }

    QMessageBox::StandardButton reply;
    reply = QMessageBox::question(this, "Підтвердження Видалення",
                                  "Ви впевнені, що хочете видалити запис: " + item->text() + "?\nЦю дію не можна скасувати!",
                                  QMessageBox::Yes|QMessageBox::No);

    if (reply == QMessageBox::Yes) {
        int idx = ui->vaultList->row(item);

        QString result = vaultManager->deleteEntry(idx);
        QMessageBox::information(this, "Видалення", result);
        updateVaultList();
    }
}
