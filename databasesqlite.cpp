#include "databasesqlite.h"
#include<QDebug>
#include<QSqlQuery>
#include<QSqlQueryModel>
#include<QJsonArray>
#include<QJsonDocument>
#include<QSqlRecord>
#include<QJsonObject>
#include<QList>
#include "lstmodel.h"
#include "abstractmodel.h"
#include "filter.h"

database::database(QObject *parent) : QObject(parent)
{

}
void database::connectdb(){

    if(opendb()){

       // qWarning()<<"connected.....";

    }else{
        qWarning()<<"Not connected.....";
    }

}


void database::geterrorone(QString s){
    datalist.clear();
    emit getlst(s);
}

QString database::showall(){

    //    QSqlQueryModel* model;
    connectdb();
    QSqlQuery query;
    QJsonDocument  json;
    QJsonArray     recordsArray;


    //query="select * from peron";

    if(query.exec("select * from person")){
        QJsonObject recordObject;
        while(query.next()) {
            for(int x=0; x < query.record().count(); x++) {

                recordObject.insert( query.record().fieldName(x),QJsonValue::fromVariant(query.value(x)) );
            }
            recordsArray.push_back(recordObject);
        }
        json.setArray(recordsArray);
    }
    qWarning()<< json.toJson();
    closdb();
    emit getjsn(json.toJson());
    return json.toJson();
    //emit getlst(s);
}

 QList<QObject*> database::getall(){
    connectdb();
    QSqlQuery query;
   // lstmodel *datamod;
    if(query.exec("select id,title,solution from solves")){
        while (query.next()) {

            datalist.append(new lstmodel(query.value(0).toInt(),query.value(1).toString(),query.value(2).toString()));
           // qWarning()<<query.value(2).toString();
        }
    }

//qWarning()<<datalist.size();
//emit searchitem();
    return datalist;

 }

 // find
  QList<QObject*>  database::searchitems(QString tofind){
      connectdb();
      QSqlQuery query;
     // lstmodel *datamod;
      datalist.clear();
      QString sqlq="select * from solves where title LIKE '%"+tofind+"%'";
      if(query.exec(sqlq)){
          while (query.next()) {

              datalist.append(new lstmodel(query.value(0).toInt(),query.value(1).toString(),query.value(2).toString()));
             // qWarning()<<query.value(2).toString();
          }
      }
     //qWarning()<<datalist;
      return  datalist;

 }



  QVector<QStringList> database::getalllist(){
     connectdb();
     QSqlQuery query;
     QVector<QStringList> lst;

     if(query.exec("select id,title,solution from solves")){
         while (query.next()) {

             QSqlRecord record = query.record();
             QStringList tmp;
             for(int i=0; i < record.count(); i++)
             {
                 tmp << record.value(i).toString();
             }
             lst.append(tmp);

           //  datalist.append(new lstmodel(query.value(0).toInt(),query.value(1).toString(),query.value(2).toString()));
            // qWarning()<<query.value(2).toString();
         }
     }

 //emit searchitem();
     return lst;

  }






