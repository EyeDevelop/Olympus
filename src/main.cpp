#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QQmlContext>

using namespace Qt::StringLiterals;

int main(int argc, char** argv) {
    QGuiApplication app{argc, argv};
    QGuiApplication::setApplicationName("Olympus");

    QQmlApplicationEngine engine;

    const QString qmlPath = QString("qrc:/qt/qml/OlympusLauncher/qml/view/Main.qml");
    engine.load(QUrl(qmlPath));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
