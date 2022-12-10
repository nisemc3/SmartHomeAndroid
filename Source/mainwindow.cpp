#include "Headers/mainwindow.h"

MainWindow::MainWindow()
{
    //Включаем наш QML
    this->setSource(QUrl("qrc:/Qmls/main.qml"));
    this->setResizeMode(QQuickView::SizeRootObjectToView);

    root_ = this->rootObject();
    this->rootContext()->setContextProperty("mainWindow", this);
}

MainWindow::~MainWindow()
{

}

void MainWindow::functionC()
{
    //Найдем строку ввода
    QObject* textinput = root_->findChild<QObject*>("textinput");

    //Найдем поле вывода
    QObject* memo = root_->findChild<QObject*>("memo");

    QString str;//Создадим новую строковую переменную

    //Считаем информацию со строки ввода через свойство text
    str=(textinput->property("text")).toString();

    int a;
    a=str.toInt();//Переведем строку в число
    a++;//Добавим к числу 1

    QString str2;//Создадим еще одну строковую переменную
    str2=QString::number(a);//Переведем число в строку

    //Ну и наконец выведем в поле вывода нашу информацию
    memo->setProperty("text", str+"+1="+str2);
}
