#ifndef DBCLASS_H
#define DBCLASS_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>

#define DATABASE_HOSTNAME               "NameTable"         //Название БД
#define DATABASE_NAME                   "NameTable.db"      //Называние БД

#define TABLE                           "NameTable"         //Название таблицы БД
#define TABLE_USERNAME                  "UserName"          //Колонка с именем пользователя
#define TABLE_FIRST_SCORE               "FirstResult"       //Колонка с результатами по Эксраверсии – Интроверсии
#define TABLE_SECOND_SCORE              "SecondResult"      //Колонка с результатами по Привязанности – Обособленности
#define TABLE_THIRD_SCORE               "ThirdResult"       //Колонка с результатами по Самоконтролю – Импульсивности
#define TABLE_FOURTH_SCORE              "FourthResult"      //Колонка с результатами по Эмоциональной устойчивости – эмоциональной неустойчивости
#define TABLE_FIFTH_SCORE               "FifthResult"       //Колонка с результатами по Экспрессивности – Практичности

class DBclass : public QObject
{
    Q_OBJECT
public:
    explicit DBclass(QObject *parent = nullptr);
    void connectToDatabase();
private:
    bool openDataBase();        //Открытие БД
    void closeDataBase();       //Закрытие БД
    bool restoreDataBase();     // Восстановление БД
    bool createTable();         // Создание таблицы в БД
public slots:
    bool insertIntoTable(const QVariantList &data);
    bool insertIntoTable(const QString &FirstResult, const QString &SecondResult, const QString &ThirdResult,
                         const QString &FourthResult, const QString &FifthResult);
    bool updateTable(const QVariantList &data, const int id);
    bool updateTable(const QString &FirstResult, const QString &SecondResult, const QString &ThirdResult,
                     const QString &FourthResult, const QString &FifthResult, int id);
    bool removeRecord(const int id);
signals:

private:
    QSqlDatabase db;
};

#endif // DBCLASS_H
