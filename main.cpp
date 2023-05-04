#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <scalingratiowrapper.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<ScalingRatioWrapper>("net.maxiprogram.scalingratiowrapper", 1, 0, "ScalingRatioWrapper");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/BoardGame/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
