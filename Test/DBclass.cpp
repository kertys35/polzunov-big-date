#include "DBclass.h"

DBclass::DBclass(QObject *parent): QObject{parent}
{

}
//
void DBclass::connectToDatabase()
{
    if(!QFile("C:/Users/Papa/Desktop/Pracatice/polzunov-big-date/" DATABASE_NAME).exists()){
        this->restoreDataBase();
    } else {
        this->openDataBase();
    }
}
//
bool DBclass::openDataBase()
{
    db=QSqlDatabase::addDatabase("QPSQL");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName("C:/Users/Papa/Desktop/Pracatice/polzunov-big-date/" DATABASE_NAME); //Путь до БД
    if(db.open())
        return true;
    else
        return false;
}
//Методы восстановления базы данных
bool DBclass::restoreDataBase()
{
    // Если база данных открылась ...
    if(this->openDataBase()){
        // Производим восстановление базы данных
        return (this->createTable()) ? true : false;
    } else {
        qDebug() << "Не удалось восстановить базу данных";
        return false;
    }
    return false;
}
//
void DBclass::closeDataBase()
{
    db.close();
}
//
bool DBclass::insertIntoTable(const QVariantList &data)
{
    QSqlQuery query;

    //Формируем вставку в таблицу
    query.prepare("insert into" TABLE " ( " TABLE_FIRST_SCORE ", "
                                            TABLE_SECOND_SCORE ", "
                                            TABLE_THIRD_SCORE ", "
                                            TABLE_FOURTH_SCORE ", "
                                            TABLE_FIFTH_SCORE " ) "
                  "values (FIRST_SCORE, SECOND_SCORE, THIRD_SCORE, FOURTH_SCORE, FIFTH_SCORE");
    //Привязываем значения, которые мы пытаемся вставить
    query.bindValue("FIRST_SCORE", data[0]);
    query.bindValue("SECOND_SCORE", data[1]);
    query.bindValue("THIRD_SCORE", data[2]);
    query.bindValue("FOURTH_SCORE", data[3]);
    query.bindValue("FIFTH_SCORE", data[4]);
    //Выполняется вставка методом exec()
    if(!query.exec())
    {
        return false;
    }
    else
    {
        return true;
    }
}
//
bool DBclass::insertIntoTable(const QString &FirstResult, const QString &SecondResult, const QString &ThirdResult,
                              const QString &FourthResult, const QString &FifthResult)
{
    QVariantList data;
    data.append(FirstResult);
    data.append(SecondResult);
    data.append(ThirdResult);
    data.append(FourthResult);
    data.append(FifthResult);
    if(insertIntoTable(data))
        return true;
    else
        return false;
}
//
bool DBclass::updateTable(const QVariantList &data, const int id)
{
    QSqlQuery query;

    //Формируем вставку в таблицу
    query.prepare("Update" TABLE " Set ( " TABLE_FIRST_SCORE ", "
                  TABLE_SECOND_SCORE ", "
                  TABLE_THIRD_SCORE ", "
                  TABLE_FOURTH_SCORE ", "
                  TABLE_FIFTH_SCORE " ) "
                  "values (FIRST_SCORE, SECOND_SCORE, THIRD_SCORE, FOURTH_SCORE, FIFTH_SCORE"
                  "Where User_id= :ID;");
    //Привязываем значения, которые мы пытаемся вставить
    query.bindValue("FIRST_SCORE", data[0]);
    query.bindValue("SECOND_SCORE", data[1]);
    query.bindValue("THIRD_SCORE", data[2]);
    query.bindValue("FOURTH_SCORE", data[3]);
    query.bindValue("FIFTH_SCORE", data[4]);
    query.bindValue(":ID", id);
    //Выполняется вставка методом exec()
    if(!query.exec())
    {
        return false;
    }
    else
    {
        return true;
    }
}
//
bool DBclass::updateTable(const QString &FirstResult, const QString &SecondResult, const QString &ThirdResult,
                          const QString &FourthResult, const QString &FifthResult, int id)
{
    QVariantList data;
    data.append(FirstResult);
    data.append(SecondResult);
    data.append(ThirdResult);
    data.append(FourthResult);
    data.append(FifthResult);
    if(updateTable(data,id))
        return true;
    else
        return false;
}
//
bool DBclass::removeRecord(const int id)
{
    QSqlQuery query;
    query.prepare("Delete from" TABLE "Where id=:ID;");
    query.bindValue(":ID", id);
    if(!query.exec())
        return false;
    else
        return true;
    return false;
}
//
bool DBclass::createTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE " TABLE " ("
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "FIRST_SCORE      VARCHAR(255)    NOT NULL,"
                    "SECOND_SCORE     VARCHAR(255)    NOT NULL,"
                    "THIRD_SCORE      VARCHAR(255)    NOT NULL,"
                    "FOURTH_SCORE     VARCHAR(255)    NOT NULL,"
                    "FIFTH_SCORE      VARCHAR(255)    NOT NULL"
                    " )"
                    ))
    {
        qDebug() << "DataBase: error of create " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
