#ifndef ABSTRACTMODEL_H
#define ABSTRACTMODEL_H
#include <QAbstractListModel>
#include "lstmodel.h"


class abdata{

public:
    abdata(const int sid,const QString &titr,const QString &solution);

    int sid() const;
    QString titr() const;
    QString solution() const;

private:

    int f_sid;
    QString f_titr;
    QString f_solution;

};

enum Roles{

    sid=Qt::UserRole+1,
    title,
    solve,
};


class abstractmodel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit abstractmodel(QObject *parent = 0);
    //void addData(const QString &title_err);
    void addData(const abdata &data);
    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

protected:
 QHash<int, QByteArray> roleNames() const;


private:

 // QStringList pr_title;
 //QList<QString> pr_title;
 QList<abdata> datalst;
};

#endif // ABSTRACTMODEL_H
