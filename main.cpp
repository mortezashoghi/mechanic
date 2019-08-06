#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtCore/QSortFilterProxyModel>
#include <QDebug>
#include "errlist.h"
#include "databasesqlite.h"
#include <QList>
#include "filter.h"
#include "abstractmodel.h"
#include <iostream>
#include <QSettings>
#include <QQuickStyle>
#include "credential.h"


int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("Mechanic");
    QGuiApplication::setOrganizationName("Mechanic");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    //----------------
/*
    QStringList dataList;
        dataList.append("Item 1");
        dataList.append("Item 2");
        dataList.append("Item 3");
        dataList.append("Item 4");
*/


Credential crd;
crd.createconfigfile();

crd.checkconfiguration();

//database *dbs=new database();

database datadb;
//QList<QObject*> data;
QVector<QStringList> data;
//data=datadb.searchitems("");
QString strw="the";
data=datadb.getalllist();
//----------------

// abstract model list

abstractmodel abs;

//abs.addData(abdata(0,"x","y"));
//abs.addData(abdata(1,"x1","y1"));
//abs.addData(abdata(2,"x2","y2"));

foreach (const QStringList &var, data) {
    //qWarning() << var[0];
    int pid=var[0].toInt();
    abs.addData(abdata(pid,var[1],var[2]));
    qWarning() << var[1];
}
filter flt;
flt.setSourceModel(&abs);
flt.setFilterRole(title);
//flt.setSortRole(title);




QSettings settings;
QString style = QQuickStyle::name();
if (!style.isEmpty())
    settings.setValue("style", style);
else{
    QQuickStyle::setStyle(settings.value("style").toString());
}
//qml register type

             qmlRegisterType<Credential>("auth",1,0,"Credential");
//end qml register type
    QQmlApplicationEngine engine;
    errlist errors;
    QQmlContext * ctnx=engine.rootContext();
   // ctnx->setContextProperty("datadb",&datadb);
    // ctnx->setContextProperty("myModel", &dataab);
    //  ctnx->setContextProperty("myModel",QVariant::fromValue(data));
     ctnx->setContextProperty("myModel",&flt);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    //qDebug() << engine.offlineStoragePath();

    return app.exec();
}
