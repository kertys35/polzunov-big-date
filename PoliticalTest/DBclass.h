#ifndef DBCLASS_H
#define DBCLASS_H

#include <QObject>
#include <QFile>
#include <QDate>
#include <QDebug>

#include <QByteArray>
#include <QString>
#include <QScrollArea>
#include <QStringList>
#include <QNetworkAccessManager>
#include <QNetworkProxy>
#include <QNetworkReply>
#include <QJsonValueRef>
#include <QJsonArray>
#include <QTimer>
#include <QMap>
#include <QJsonObject>
#include <QJsonDocument>
#include <networkmanager.h>
#include <QMultiMap>
#include <QListWidget>
#include <qqml.h>


class DBclass : public QObject
{
    Q_OBJECT
public:
    explicit DBclass(QObject *parent = nullptr);

private slots:
    void on_newDataReceived(const QJsonArray &jsonArray);
    void onHttpFinished(QNetworkReply *reply);
public slots:
    void insertIntoTable(const QVariantList &data, const int id);                                                                             //Вставить значения тестов в БД
    void insertIntoTable(const QString &FirstResult, const QString &SecondResult, const QString &ThirdResult,                   //Подготовить массив данных для вставки в БД
                         const QString &FourthResult, const QString &FifthResult, const int id);
    void updateTable(const QVariantList &data, const int id);                                                                  //Изменить значения тестов в БД
    void updateTable(const QString &FirstResult, const QString &SecondResult, const QString &ThirdResult,                     //Подготовить массив данных, которые будут использоваться в БД
                     const QString &FourthResult, const QString &FifthResult, int id);
    bool checkID();                                                                                                    //Проверить, что существует запись с ID пользователя
    void get_results(int id);
    int get_results1();                                                                                                //Получить результат первого фактора теста
    int get_results2();                                                                                                //Получить результат второго фактора теста
    int get_results3();                                                                                                //Получить результат третьего фактора теста
    int get_results4();                                                                                                //Получить результат четвёртого фактора теста
    int get_results5();                                                                                                //Получить результат пятого фактора теста
signals:

private:
    NetworkManager *networkManager;
    int tempScore[5];
    int flagUserID=0;
};

#endif // DBCLASS_H
