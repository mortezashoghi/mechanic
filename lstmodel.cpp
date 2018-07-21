#include "lstmodel.h"

lstmodel::lstmodel(int id,QString title,QString solution,QObject *parent) : QObject(parent)
{

    setId(id);
    setTitle(title);
    setSolve(solution);
}

int lstmodel::id(){
    return f_id;

}
void lstmodel::setId(int id){
    f_id=id;
    emit idChanged();
}

QString lstmodel::title(){
    return f_title;
}
void lstmodel::setTitle(QString title){

    f_title=title;
    emit titleChanged();
}

QString lstmodel::solve(){
    return f_solve;
}
void lstmodel::setSolve(QString solve){
    f_solve=solve;
    emit solveChanged();
}


