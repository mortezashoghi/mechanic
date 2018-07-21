#ifndef LSTMODEL_H
#define LSTMODEL_H
#include <QObject>

class lstmodel : public QObject
{
    Q_OBJECT
public:
    explicit lstmodel(int id,QString title,QString solution, QObject *parent = 0);
    Q_PROPERTY(int id READ id WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QString solve READ solve WRITE setSolve NOTIFY solveChanged)



signals:
    void idChanged();
    void titleChanged();
    void solveChanged();


private:
    int f_id;
    QString f_title;
    QString f_solve;

public slots:

    int id();
    void setId(int id);

    QString title();
    void setTitle(QString title);

    QString solve();
    void setSolve(QString solve);

};

#endif // LSTMODEL_H
