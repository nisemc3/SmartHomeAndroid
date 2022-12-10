#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QQuickView>
#include <QGraphicsObject>
#include <QtGui>
#include <QQmlContext>
#include <QQuickItem>

namespace Ui {
    class MainWindow;
}

class MainWindow : public QQuickView
{
    Q_OBJECT

    QObject* root_;   //корневой элемент QML модели
public:
    explicit MainWindow();
    ~MainWindow();

    Q_INVOKABLE void functionC();   //Функция C++ вызываемая из QML
};


#endif // MAINWINDOW_H
