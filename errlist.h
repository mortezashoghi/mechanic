#ifndef ERRLIST_H
#define ERRLIST_H
#include <QObject>
#include <QDebug>

class errlist : public QObject
{
    Q_OBJECT
public:
    explicit errlist(QObject *parent = 0);

signals:
    void getlist(QString s);

public slots:

    void reterrors(QString s);
};

#endif // ERRLIST_H
