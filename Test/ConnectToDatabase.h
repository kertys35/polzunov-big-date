#ifndef CONNECTTODATABASE_H
#define CONNECTTODATABASE_H

#include <QObject>

class ConnectToDatabase : public QObject
{
    Q_OBJECT
public:
    explicit ConnectToDatabase(QObject *parent = nullptr);
public slots:

signals:

};

#endif // CONNECTTODATABASE_H
