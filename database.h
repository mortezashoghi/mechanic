#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlDriver>
#include <QSqlError>
#include <QSqlQuery>



class database : public QObject
{
    Q_OBJECT
public:
    explicit database(QObject *parent = 0);

signals:

public slots:
    //void insertdata(QString data[]);
    //void editdata(QString data[],ind id);
    //void removetdata(int id);


};

#endif // DATABASE_H
