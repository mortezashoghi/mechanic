#include "errlist.h"
#include "database.h"


errlist::errlist(QObject *parent) : QObject(parent)
{

}

void errlist::reterrors(QString s){

    qWarning()<<"salam shoghi kefuuuuun : "<<s;
    emit getlist(s);
}
