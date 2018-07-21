#include "abstractmodel.h"


abdata::abdata(const int sid,const QString &titr, const QString &solution)
    :f_sid(sid),f_titr(titr),f_solution(solution)
{

}

int abdata::sid() const{
    return f_sid;
}
QString abdata::titr() const
{
    return f_titr;
}

QString abdata::solution() const
{
    return f_solution;
}

abstractmodel::abstractmodel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void abstractmodel::addData(const abdata &data)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());

    datalst<<data;

    endInsertRows();

}


int abstractmodel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);

   // return pr_title.count();
    return datalst.count();
}

QVariant abstractmodel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= datalst.count())
        return QVariant();

    const abdata &adata = datalst[index.row()];
    if (role == title)
        return adata.titr();
    else if (role == solve)
        return adata.solution();
    else if (role==sid)
        return adata.sid();

    return QVariant();

}



QHash<int, QByteArray> abstractmodel::roleNames() const
{
 QHash<int, QByteArray> roles;
 roles[sid]="sid";
 roles[title] = "titr";
 roles[solve]="solution";
 return roles;
}

