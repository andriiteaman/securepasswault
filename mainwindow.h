#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "vaultbackend.h"
#include <QListWidget>
#include <QLabel>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_generateButton_clicked();
    void on_generateNickButton_clicked();
    void on_saveButton_clicked();

    void on_viewDetailsButton_clicked();
    void showPasswordDetails(int index);
    void on_deleteButton_clicked();

    void on_exportButton_clicked();
    void on_importButton_clicked();

    void filterVaultList(const QString &searchText);
    void clearClipboard();

private:
    Ui::MainWindow *ui;
    VaultBackend *vaultManager;
    QString masterKey;
    QLabel *m_statusLabel;

    void promptForMasterKey(bool initialSetup);
    void updateVaultList();
};

#endif
