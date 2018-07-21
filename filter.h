#ifndef FILTER_H
#define FILTER_H
#include <QSortFilterProxyModel>


class filter: public QSortFilterProxyModel
{
 Q_OBJECT
public:
    filter(QObject* parent = 0);
    ~filter();


    Q_INVOKABLE void setFilterString(QString string);

    Q_INVOKABLE void setSortOrder(bool checked);

};

#endif // FILTER_H
