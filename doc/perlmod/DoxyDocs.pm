$doxydocs=
{
  classes => [
    {
      name => 'MainWindow',
      kind => 'class',
      base => [
        {
          name => 'QMainWindow',
          virtualness => 'non-virtual',
          protection => 'public'
        }
      ],
      inner => [
      ],
      includes => {
        local => 'yes',
        name => 'mainwindow.h'
      },
      all_members => [
        {
          name => 'clearClipboard',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'filterVaultList',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'm_statusLabel',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'MainWindow',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'MainWindow'
        },
        {
          name => 'masterKey',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'on_deleteButton_clicked',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'on_exportButton_clicked',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'on_generateButton_clicked',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'on_generateNickButton_clicked',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'on_importButton_clicked',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'on_saveButton_clicked',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'on_viewDetailsButton_clicked',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'promptForMasterKey',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'showPasswordDetails',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'ui',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'updateVaultList',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => 'vaultManager',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'MainWindow'
        },
        {
          name => '~MainWindow',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'MainWindow'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'MainWindow',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'parent',
                type => 'QWidget *',
                default_value => 'nullptr'
              }
            ]
          },
          {
            kind => 'function',
            name => '~MainWindow',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          }
        ]
      },
      private_methods => {
        members => [
          {
            kind => 'function',
            name => 'promptForMasterKey',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'initialSetup',
                type => 'bool'
              }
            ]
          },
          {
            kind => 'function',
            name => 'updateVaultList',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          }
        ]
      },
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'ui',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'Ui::MainWindow *'
          },
          {
            kind => 'variable',
            name => 'vaultManager',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'VaultBackend *'
          },
          {
            kind => 'variable',
            name => 'masterKey',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString'
          },
          {
            kind => 'variable',
            name => 'm_statusLabel',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QLabel *'
          }
        ]
      },
      private_slots => {
        members => [
          {
            kind => 'slot',
            name => 'on_generateButton_clicked',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'slot',
            name => 'on_generateNickButton_clicked',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'slot',
            name => 'on_saveButton_clicked',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'slot',
            name => 'on_viewDetailsButton_clicked',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'slot',
            name => 'showPasswordDetails',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'index',
                type => 'int'
              }
            ]
          },
          {
            kind => 'slot',
            name => 'on_deleteButton_clicked',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'slot',
            name => 'on_exportButton_clicked',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'slot',
            name => 'on_importButton_clicked',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'slot',
            name => 'filterVaultList',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'searchText',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'slot',
            name => 'clearClipboard',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'QMainWindow',
      kind => 'class',
      derived => [
        {
          name => 'MainWindow',
          virtualness => 'non-virtual',
          protection => 'public'
        }
      ],
      inner => [
      ],
      all_members => [
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'QObject',
      kind => 'class',
      derived => [
        {
          name => 'VaultBackend',
          virtualness => 'non-virtual',
          protection => 'public'
        }
      ],
      inner => [
      ],
      all_members => [
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'VaultBackend',
      kind => 'class',
      base => [
        {
          name => 'QObject',
          virtualness => 'non-virtual',
          protection => 'public'
        }
      ],
      inner => [
      ],
      includes => {
        local => 'yes',
        name => 'vaultbackend.h'
      },
      all_members => [
        {
          name => 'calculatePasswordStrength',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'checkIntegrity',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'checkSystemBound',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'decryptData',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'deleteEntry',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'deriveKey',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'encryptData',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'exportDatabase',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'generateNickname',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'generateSecureString',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'generateSystemHash',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'getAvailableThemes',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'getEntryDetails',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'getPassword',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'importDatabase',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'isDatabaseLoaded',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'isSystemBoundDatabase',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'loadDatabase',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'loadNicknameWords',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'm_iv',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'm_masterKey',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'm_salt',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'm_systemIDHash',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'm_themeWords',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'm_vaultEntries',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'saveDatabaseToFile',
          virtualness => 'non-virtual',
          protection => 'private',
          scope => 'VaultBackend'
        },
        {
          name => 'saveEntry',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'updateEntry',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'VaultBackend',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        },
        {
          name => 'vaultEntries',
          virtualness => 'non-virtual',
          protection => 'public',
          scope => 'VaultBackend'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'VaultBackend',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'parent',
                type => 'QObject *',
                default_value => 'nullptr'
              }
            ]
          },
          {
            kind => 'function',
            name => 'generateSecureString',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'length',
                type => 'int'
              },
              {
                declaration_name => 'useUpper',
                type => 'bool'
              },
              {
                declaration_name => 'useLower',
                type => 'bool'
              },
              {
                declaration_name => 'useDigits',
                type => 'bool'
              },
              {
                declaration_name => 'useSymbols',
                type => 'bool'
              }
            ]
          },
          {
            kind => 'function',
            name => 'calculatePasswordStrength',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'password',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'generateNickname',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'maxLength',
                type => 'int'
              },
              {
                declaration_name => 'useMushup',
                type => 'bool'
              },
              {
                declaration_name => 'useInjection',
                type => 'bool'
              }
            ]
          },
          {
            kind => 'function',
            name => 'getAvailableThemes',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QStringList',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'saveEntry',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'site',
                type => 'const QString &'
              },
              {
                declaration_name => 'login',
                type => 'const QString &'
              },
              {
                declaration_name => 'password',
                type => 'const QString &'
              },
              {
                declaration_name => 'masterKey',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'updateEntry',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'index',
                type => 'int'
              },
              {
                declaration_name => 'site',
                type => 'const QString &'
              },
              {
                declaration_name => 'login',
                type => 'const QString &'
              },
              {
                declaration_name => 'password',
                type => 'const QString &'
              },
              {
                declaration_name => 'masterKey',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'deleteEntry',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'index',
                type => 'int'
              }
            ]
          },
          {
            kind => 'function',
            name => 'getEntryDetails',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QVariantMap',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'index',
                type => 'int'
              }
            ]
          },
          {
            kind => 'function',
            name => 'getPassword',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'index',
                type => 'int'
              },
              {
                declaration_name => 'masterKey',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'loadDatabase',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'bool',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'masterKey',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'checkSystemBound',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'bool',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'isSystemBoundDatabase',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'bool',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'exportDatabase',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'filePath',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'importDatabase',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'filePath',
                type => 'const QString &'
              },
              {
                declaration_name => 'masterKey',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'vaultEntries',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QVariantList',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'isDatabaseLoaded',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'bool',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          }
        ]
      },
      private_methods => {
        members => [
          {
            kind => 'function',
            name => 'loadNicknameWords',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'filePath',
                type => 'const QString &',
                default_value => '"data/theme_data.txt"'
              }
            ]
          },
          {
            kind => 'function',
            name => 'deriveKey',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QByteArray',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'password',
                type => 'const QString &'
              },
              {
                declaration_name => 'salt',
                type => 'const QByteArray &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'encryptData',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QByteArray',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'data',
                type => 'const QByteArray &'
              },
              {
                declaration_name => 'masterKey',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'decryptData',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QByteArray',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'encryptedData',
                type => 'const QByteArray &'
              },
              {
                declaration_name => 'masterKey',
                type => 'const QString &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'saveDatabaseToFile',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'generateSystemHash',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QByteArray',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'checkIntegrity',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'bool',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'fileData',
                type => 'const QByteArray &'
              },
              {
                declaration_name => 'key',
                type => 'const QByteArray &'
              }
            ]
          }
        ]
      },
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'm_vaultEntries',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QVariantList'
          },
          {
            kind => 'variable',
            name => 'm_masterKey',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString'
          },
          {
            kind => 'variable',
            name => 'm_salt',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QByteArray'
          },
          {
            kind => 'variable',
            name => 'm_iv',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QByteArray'
          },
          {
            kind => 'variable',
            name => 'm_systemIDHash',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QByteArray'
          },
          {
            kind => 'variable',
            name => 'm_themeWords',
            virtualness => 'non-virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QMap< QString, QStringList >'
          }
        ]
      },
      brief => {},
      detailed => {}
    }
  ],
  concepts => [
  ],
  modules => [
  ],
  namespaces => [
    {
      name => 'Ui',
      brief => {},
      detailed => {}
    }
  ],
  files => [
    {
      name => 'main.cpp',
      includes => [
        {
          name => 'mainwindow.h',
          ref => 'mainwindow_8h'
        },
        {
          name => 'QApplication'
        }
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'main',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'argc',
                type => 'int'
              },
              {
                declaration_name => 'argv',
                type => 'char *',
                array => '[]'
              }
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'mainwindow.cpp',
      includes => [
        {
          name => 'mainwindow.h',
          ref => 'mainwindow_8h'
        },
        {
          name => 'ui_mainwindow.h'
        },
        {
          name => 'QInputDialog'
        },
        {
          name => 'QMessageBox'
        },
        {
          name => 'QListWidgetItem'
        },
        {
          name => 'QClipboard'
        },
        {
          name => 'QTimer'
        },
        {
          name => 'QFileDialog'
        },
        {
          name => 'QStatusBar'
        },
        {
          name => 'QRandomGenerator'
        }
      ],
      included_by => [
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'mainwindow.h',
      includes => [
        {
          name => 'QMainWindow'
        },
        {
          name => 'vaultbackend.h',
          ref => 'vaultbackend_8h'
        },
        {
          name => 'QListWidget'
        },
        {
          name => 'QLabel'
        }
      ],
      included_by => [
        {
          name => 'main.cpp',
          ref => 'main_8cpp'
        },
        {
          name => 'mainwindow.cpp',
          ref => 'mainwindow_8cpp'
        }
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'README.md',
      includes => [
      ],
      included_by => [
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'vaultbackend.cpp',
      includes => [
        {
          name => 'vaultbackend.h',
          ref => 'vaultbackend_8h'
        },
        {
          name => 'QDir'
        },
        {
          name => 'QFile'
        },
        {
          name => 'QStandardPaths'
        },
        {
          name => 'QJsonDocument'
        },
        {
          name => 'QJsonObject'
        },
        {
          name => 'QJsonArray'
        },
        {
          name => 'QDateTime'
        },
        {
          name => 'QDebug'
        },
        {
          name => 'QCryptographicHash'
        },
        {
          name => 'QRandomGenerator'
        },
        {
          name => 'cmath'
        },
        {
          name => 'cstring'
        },
        {
          name => 'QtGlobal'
        },
        {
          name => 'QSysInfo'
        },
        {
          name => 'QTextStream'
        }
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'getDatabasePath',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QString',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'get8RandomBytes',
            virtualness => 'non-virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'QByteArray',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'vaultbackend.h',
      includes => [
        {
          name => 'QObject'
        },
        {
          name => 'QVariantList'
        },
        {
          name => 'QVariantMap'
        },
        {
          name => 'QMap'
        },
        {
          name => 'QStandardPaths'
        }
      ],
      included_by => [
        {
          name => 'mainwindow.h',
          ref => 'mainwindow_8h'
        },
        {
          name => 'vaultbackend.cpp',
          ref => 'vaultbackend_8cpp'
        }
      ],
      brief => {},
      detailed => {}
    }
  ],
  groups => [
  ],
  pages => [
    {
      name => 'md__r_e_a_d_m_e',
      title4 => 'Secure PassVault (SPV)',
      detailed => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'anchor',
            id => 'md__r_e_a_d_m_e_1autotoc_md0'
          },
          {
            type => 'parbreak'
          },
          {
            type => 'style',
            style => 'bold',
            enable => 'yes'
          },
          {
            type => 'text',
            content => 'Cross-Platform System for Advanced Cryptographic Key Management and Semantic Identity Generation'
          },
          {
            type => 'style',
            style => 'bold',
            enable => 'no'
          },
          {
            type => 'parbreak'
          },
          {
            type => 'hruler'
          },
          {
            type => 'sect1',
            {
              type => 'title',
              content => [
                {
                  type => 'text',
                  content => '1. Project Overview and Architecture'
                }
              ]
            },
            content => [
              {
                type => 'text',
                content => 'Secure PassVault (SPV) is a robust, local-only password and identity management application developed in '
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'C++'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'no'
              },
              {
                type => 'text',
                content => ' using the '
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'Qt Widgets Framework'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'no'
              },
              {
                type => 'text',
                content => '. The core design adheres to the '
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'Model-View-Controller (MVC)'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'no'
              },
              {
                type => 'text',
                content => ' architectural pattern, ensuring a clean separation between the user interface ('
              },
              {
                type => 'style',
                style => 'typewriter',
                enable => 'yes'
              },
              {
                type => 'url',
                link => 'class_main_window',
                content => 'MainWindow'
              },
              {
                type => 'style',
                style => 'typewriter',
                enable => 'no'
              },
              {
                type => 'text',
                content => ') and the cryptographic business logic ('
              },
              {
                type => 'style',
                style => 'typewriter',
                enable => 'yes'
              },
              {
                type => 'url',
                link => 'class_vault_backend',
                content => 'VaultBackend'
              },
              {
                type => 'style',
                style => 'typewriter',
                enable => 'no'
              },
              {
                type => 'text',
                content => ').'
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'The primary objective is to eliminate common security vulnerabilities by integrating advanced '
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'System Programming'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'no'
              },
              {
                type => 'text',
                content => ' concepts directly into the data handling and persistence layers.'
              }
            ]
          },
          {
            type => 'sect1',
            {
              type => 'title',
              content => [
                {
                  type => 'text',
                  content => '2. Security and Cryptographic Architecture'
                }
              ]
            },
            content => [
              {
                type => 'text',
                content => 'The integrity and confidentiality of the database ('
              },
              {
                type => 'style',
                style => 'typewriter',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'vault.dat'
              },
              {
                type => 'style',
                style => 'typewriter',
                enable => 'no'
              },
              {
                type => 'text',
                content => ') rely on a multi-layered cryptographic container approach.'
              },
              {
                type => 'sect2',
                {
                  type => 'title',
                  content => [
                    {
                      type => 'text',
                      content => '2.1. Key Derivation and Anti-Brute Force Mechanism'
                    }
                  ]
                },
                content => [
                  {
                    type => 'text',
                    content => 'The user\'s Master Key is transformed into a cryptographically strong encryption key using an iterative function designed to resist modern GPU-accelerated Brute Force attacks.'
                  },
                  {
                    type => 'parbreak'
                  },
                  {
                    type => 'list',
                    style => 'itemized',
                    content => [
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Mechanism:'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' PBKDF2-like process (Password-Based Key Derivation Function 2 structure).'
                        }
                      ],
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Key Strength:'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' Uses a 256-bit derived key ($DK$).'
                        }
                      ],
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Cost Parameter:'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' The process involves '
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => '10,000+ sequential SHA-256 iterations'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' applied to the Master Key concatenated with a unique, cryptographically random '
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Salt'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => '. This computational delay ensures that attempted dictionary attacks are economically infeasible.'
                        }
                      ]
                    ]
                  }
                ]
              },
              {
                type => 'sect2',
                {
                  type => 'title',
                  content => [
                    {
                      type => 'text',
                      content => '2.2. Data Integrity and Authentication'
                    }
                  ]
                },
                content => [
                  {
                    type => 'text',
                    content => 'The '
                  },
                  {
                    type => 'style',
                    style => 'typewriter',
                    enable => 'yes'
                  },
                  {
                    type => 'text',
                    content => 'vault.dat'
                  },
                  {
                    type => 'style',
                    style => 'typewriter',
                    enable => 'no'
                  },
                  {
                    type => 'text',
                    content => ' container integrates two levels of critical verification:'
                  },
                  {
                    type => 'parbreak'
                  },
                  {
                    type => 'list',
                    style => 'ordered',
                    content => [
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Integrity Control (HMAC):'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' Every save operation appends a '
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'HMAC-SHA256'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' tag to the data. During loading, the system recalculates the HMAC using the derived key. Any mismatch indicates file corruption or external modification, leading to immediate access denial.'
                        }
                      ],
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'System-Bound 2FA:'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' A unique '
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'System ID Hash'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' (derived from the host machine\'s hardware/OS identifiers) is stored in the file header. Access is blocked if the file is opened on an unauthorized machine, acting as a two-factor authentication layer tied to the system itself.'
                        }
                      ]
                    ]
                  }
                ]
              },
              {
                type => 'sect2',
                {
                  type => 'title',
                  content => [
                    {
                      type => 'text',
                      content => '2.3. Data Persistence Reliability'
                    }
                  ]
                },
                content => [
                  {
                    type => 'text',
                    content => 'To guarantee the stability and persistence of data across different operating environments (Dev vs. Release mode, different OSes), the application utilizes the '
                  },
                  {
                    type => 'style',
                    style => 'bold',
                    enable => 'yes'
                  },
                  {
                    type => 'text',
                    content => 'QStandardPaths'
                  },
                  {
                    type => 'style',
                    style => 'bold',
                    enable => 'no'
                  },
                  {
                    type => 'text',
                    content => ' class.'
                  },
                  {
                    type => 'parbreak'
                  },
                  {
                    type => 'list',
                    style => 'itemized',
                    content => [
                      [
                        {
                          type => 'text',
                          content => 'The system dynamically determines the absolute, writable location for application data (e.g., '
                        },
                        {
                          type => 'style',
                          style => 'typewriter',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => '~/Library/Application Support/SPV/'
                        },
                        {
                          type => 'style',
                          style => 'typewriter',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' on macOS).'
                        }
                      ],
                      [
                        {
                          type => 'text',
                          content => 'This approach is essential to avoid failures associated with using unreliable relative paths, which are often blocked by OS security permissions in deployment environments.'
                        }
                      ]
                    ]
                  }
                ]
              }
            ]
          },
          {
            type => 'sect1',
            {
              type => 'title',
              content => [
                {
                  type => 'text',
                  content => '3. Advanced Generation Models'
                }
              ]
            },
            content => [
              {
                type => 'text',
                content => 'SPV implements two distinct, specialized models for creating credentials:'
              },
              {
                type => 'sect2',
                {
                  type => 'title',
                  content => [
                    {
                      type => 'text',
                      content => '3.1. Cryptographic Generation (Passwords)'
                    }
                  ]
                },
                content => [
                  {
                    type => 'list',
                    style => 'itemized',
                    content => [
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Entropy Source:'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' Uses a '
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Cryptographically Secure Pseudorandom Number Generator (CSPRNG)'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' ('
                        },
                        {
                          type => 'style',
                          style => 'typewriter',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'QRandomGenerator::system()'
                        },
                        {
                          type => 'style',
                          style => 'typewriter',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ').'
                        }
                      ],
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Strength Analysis:'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' The generated output is analyzed in real-time using the '
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Shannon Entropy Formula'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' ($E$) to provide an objective score (0–100) of password resistance: $$E = L \\times \\log_2(R)$$ Where $L$ is the length and $R$ is the size of the available character pool.'
                        }
                      ]
                    ]
                  }
                ]
              },
              {
                type => 'sect2',
                {
                  type => 'title',
                  content => [
                    {
                      type => 'text',
                      content => '3.2. Semantic Generation (Nicknames/Logins)'
                    }
                  ]
                },
                content => [
                  {
                    type => 'text',
                    content => 'This module generates unique identifiers that are both memorable and complex:'
                  },
                  {
                    type => 'parbreak'
                  },
                  {
                    type => 'list',
                    style => 'itemized',
                    content => [
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Data Volume:'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' The model utilizes a proprietary base of '
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => '116 thematic dictionaries'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' (over 21,000 words) loaded via Qt Resource System (QRC).'
                        }
                      ],
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Mushup Strategy:'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' Combines parts of two words from two randomly selected thematic categories (e.g., '
                        },
                        {
                          type => 'style',
                          style => 'typewriter',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'word1[start]'
                        },
                        {
                          type => 'style',
                          style => 'typewriter',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' + '
                        },
                        {
                          type => 'style',
                          style => 'typewriter',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'word2[end]'
                        },
                        {
                          type => 'style',
                          style => 'typewriter',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ') to create a unique semantic core.'
                        }
                      ],
                      [
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'Symbol Injection:'
                        },
                        {
                          type => 'style',
                          style => 'bold',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => ' Random symbols and numbers are inserted and appended to the semantic core, adding an extra layer of randomness and ensuring high uniqueness across services.'
                        }
                      ]
                    ]
                  }
                ]
              }
            ]
          },
          {
            type => 'sect1',
            {
              type => 'title',
              content => [
                {
                  type => 'text',
                  content => '4. Technical Stack and Deployment'
                }
              ]
            },
            content => [
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'Component  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'Detail  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'Language'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'no'
              },
              {
                type => 'text',
                content => '  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'C++17  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'Framework'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'no'
              },
              {
                type => 'text',
                content => '  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'Qt 6 (Qt Widgets)  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'Encryption Primitives'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'no'
              },
              {
                type => 'text',
                content => '  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'SHA-256, XOR (PBKDF2, HMAC)  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'UI/UX'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'no'
              },
              {
                type => 'text',
                content => '  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'Split View Layout, QStyleSheets Dark Theme  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'yes'
              },
              {
                type => 'text',
                content => 'Data Format'
              },
              {
                type => 'style',
                style => 'bold',
                enable => 'no'
              },
              {
                type => 'text',
                content => '  '
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'Encrypted JSON  '
              },
              {
                type => 'sect2',
                {
                  type => 'title',
                  content => [
                    {
                      type => 'text',
                      content => 'Deployment (macOS Example)'
                    }
                  ]
                },
                content => [
                  {
                    type => 'text',
                    content => 'To create a standalone application bundle ('
                  },
                  {
                    type => 'style',
                    style => 'typewriter',
                    enable => 'yes'
                  },
                  {
                    type => 'text',
                    content => '.app'
                  },
                  {
                    type => 'style',
                    style => 'typewriter',
                    enable => 'no'
                  },
                  {
                    type => 'text',
                    content => '), the project must be compiled in '
                  },
                  {
                    type => 'style',
                    style => 'bold',
                    enable => 'yes'
                  },
                  {
                    type => 'text',
                    content => 'Release mode'
                  },
                  {
                    type => 'style',
                    style => 'bold',
                    enable => 'no'
                  },
                  {
                    type => 'text',
                    content => ' and processed by the Qt deployment tool:'
                  },
                  {
                    type => 'parbreak'
                  },
                  {
                    type => 'text',
                    content => '```bash '
                  }
                ]
              }
            ]
          },
          {
            type => 'sect1',
            {
              type => 'title',
              content => [
                {
                  type => 'text',
                  content => 'Example Deployment Command'
                }
              ]
            },
            content => [
              {
                type => 'text',
                content => '/path/to/Qt/6.x.x/macos/bin/macdeployqt /path/to/build/keyvaulttfk.app '
              }
            ]
          }
        ]
      }
    }
  ]
};
1;
