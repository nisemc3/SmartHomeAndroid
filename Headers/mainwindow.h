#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QtQuick>
#include <QNetworkAccessManager>
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
    QQmlApplicationEngine engine_;
    QObject* mainWindow_;
    QObject* lvList_;
    QObject* btnRequest_;
    QNetworkAccessManager* namRequest_;

public:
    explicit MainWindow();
    ~MainWindow();

    Q_INVOKABLE void makeRequest(int id);

signals:

private slots:
    void slotRequestFinished(QNetworkReply*);
};


#endif // MAINWINDOW_H
