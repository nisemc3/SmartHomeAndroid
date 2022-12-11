#include "Headers/mainwindow.h"
#include <QQmlEngine>

#include <QApplication>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    MainWindow view;
    //Backend view = new Backend();
    view.connect(view.engine(), &QQmlEngine::quit, &app, &QCoreApplication::quit);
    view.show();

    return app.exec();
}
