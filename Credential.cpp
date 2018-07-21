#include "credential.h"
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonValue>
#include <QJsonArray>
#include <QVariant>
#include <QtDebug>
#include <QFile>

credential::credential(QObject *parent) : QObject(parent)
{

}

QString credential::checkconfiguration()
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
    emit checkauth(qstr);
    return qstr;
}

void credential::createconfigfile()
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
