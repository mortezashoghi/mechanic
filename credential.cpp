#include "credential.h"
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonValue>
#include <QJsonArray>
#include <QVariant>
#include <QtDebug>
#include <QFile>

Credential::Credential(QObject *parent) : QObject(parent),f_act_code("1234"),f_email("morteza@@@@@@shoghiiiii")
{


    connect(this,&Credential::getacdata,this,&Credential::checkconfiguration);

}
QString Credential::email()
{
    return this->f_email;
}

QString Credential::active_code()
{
    return this->f_act_code;
}

void Credential::setEmail(QString email)
{
    f_email=email;
    emit emailChanged();
}

void Credential::setactive_code(QString actcode)
{
    f_act_code=actcode;
    emit active_codeChanged();
}

void Credential::checkconfiguration()
{
    QString vals;
    QFile ch_config("./config.json");
    ch_config.open(QIODevice::ReadWrite);
    vals=ch_config.readAll();
    QJsonDocument document = QJsonDocument::fromJson(vals.toUtf8());
    QJsonObject root = document.object();
   // qWarning()<<root;
    //qWarning() << root.value("email").toString();
    QString qstr=root.value("email").toString();
    qWarning()<<"morteza shoghi ha  email "<<qstr << f_act_code << f_email;
    //emit checkauth(qstr);
    // return qstr;
}


void Credential::createconfigfile()
{

    QFile config("./config.json");
    if(config.exists()){
        // return 1;
    }else
    {
        config.open(QIODevice::ReadWrite);
        QTextStream stream(&config);
        QJsonObject recordObject;
        recordObject.insert("email", QJsonValue::fromVariant("morteza.shoghi@gmail.com"));
        recordObject.insert("activecode", QJsonValue::fromVariant("45346546565"));
        recordObject.insert("state", QJsonValue::fromVariant(43));
      //  QJsonArray recordsArray;
      //recordsArray.push_back(recordObject);
        QJsonDocument doc(recordObject);
        // qDebug() << doc.toJson();
        stream <<doc.toJson()<< endl;
    }
}
