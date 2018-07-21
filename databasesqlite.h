#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlDriver>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>
#include "abstractmodel.h"




class database : public QObject
{
    Q_OBJECT
public:
    explicit database(QObject *parent = 0);
     QList<QObject*> datalist;



signals:
    void findsignal(QString str);
    void getlst(QString s);
    void getjsn(QString s);
private:

      QSqlDatabase mysqldb;

public slots:

    void geterrorone(QString s);


    bool opendb(){
        mysqldb =QSqlDatabase::addDatabase("QSQLITE");
        mysqldb.setDatabaseName("/home/morteza/qtsamples/Mrt-Ui/pop.db");
        if(mysqldb.open()){
          // qWarning()<<"connected to dbb ";
            return true;
        }else{
             qWarning()<<"connot connect to sqlite db ";
            return false;

        }

    }
    //----------------
    QString showall();
    //QString find(int id);

    QList<QObject*> getall();
    QVector<QStringList> getalllist();

    QList<QObject*> searchitems(QString tofind);


    void connectdb();
void closdb(){
        mysqldb.close();
    }

};

#endif // DATABASE_H
