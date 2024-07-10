#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQmlContext>
#include <DBclass.h>

int Test(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    DBclass database;
    database.connectToDatabase();
    const QUrl url(QStringLiteral("qrc:/Test.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    // Обеспечиваем доступ к модели и классу для работы с базой данных из QML
    engine.rootContext()->setContextProperty("database",&database);

    engine.load(url);

    return app.exec();
}
