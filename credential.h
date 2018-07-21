#ifndef CREDENTIAL_H
#define CREDENTIAL_H

#include <QObject>

class Credential : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged);
    Q_PROPERTY(QString active_code READ active_code WRITE setactive_code NOTIFY active_codeChanged);
public:
    explicit Credential(QObject *parent = 0);

signals:
    void getacdata();
    void emailChanged();
    void active_codeChanged();

public slots:
    void createconfigfile();
    void checkconfiguration();

    QString email();
    QString active_code();
    void setEmail(QString email);
    void setactive_code(QString actcode);


   private :
    QString f_email;
    QString f_act_code;
};

#endif // CREDENTIAL_H
