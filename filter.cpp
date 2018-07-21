#include "filter.h"

filter::filter(QObject *parent): QSortFilterProxyModel(parent)
{
    setSortOrder(false);
}

filter::~filter(){

}

void filter::setFilterString(QString string)
{
    this->setFilterCaseSensitivity(Qt::CaseInsensitive);
    this->setFilterFixedString(string);

}

void filter::setSortOrder(bool checked)
{
    if(checked){

        this->sort(0,Qt::DescendingOrder);
    }else
    {
        this->sort(0,Qt::AscendingOrder);
    }

}

