#include "Headers/mainwindow.h"


MainWindow::MainWindow()
{
    //Включаем наш QML
    this->setSource(QUrl("qrc:/Qmls/main.qml"));
    this->setResizeMode(QQuickView::SizeRootObjectToView);
    engine_.load(QUrl("qrc:/Qmls/main.qml"));

    root_ = this->rootObject();
    this->rootContext()->setContextProperty("mainWindow", this);

    mainWindow_ = engine_.rootObjects().value(0);
    lvList_ = mainWindow_->findChild<QObject*>("lvList");
    btnRequest_ = mainWindow_->findChild<QObject*>("btnRequest");

    engine()->rootContext()->setContextProperty("backend", this);

    namRequest_ = new QNetworkAccessManager(this);
    connect(namRequest_, SIGNAL(finished(QNetworkReply*)), this, SLOT(slotRequestFinished(QNetworkReply*)));
}

MainWindow::~MainWindow()
{

}

void MainWindow::makeRequest(int id) {
    btnRequest_->setProperty("enabled", "false");
    // btnRequest->property("enabled");

    QString prepareRequest("http://192.168.1.45:45823/qt_api/test");

    // HttpGet
    //prepareRequest.append("?id=");
    //prepareRequest.append(QString::number(id));
    qDebug() << "request to:" << prepareRequest.toUtf8();
    QNetworkRequest request((QUrl(prepareRequest)));
    namRequest_->get(request);

    // HttpPost
    /*QNetworkRequest request(QUrl(prepareRequest.toUtf8()));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QString params("id=");
    params.append(QString::number(id));
    qDebug(params.toUtf8());
    namRequest->post(request, QByteArray(params.toUtf8()));*/
}

void MainWindow::slotRequestFinished(QNetworkReply* reply)
{
    if (reply->error() != QNetworkReply::NoError)
    {
        qDebug() <<"error:" << reply->errorString().toUtf8();
    }
    else
    {
        QByteArray reply_qbyte = reply->readAll();
        QJsonDocument jsonDoc = QJsonDocument::fromJson(reply_qbyte);
        QJsonObject jsonObj;
        QJsonValue jsonVal;
        QJsonArray jsonArr;

        jsonObj = jsonDoc.object();
        jsonVal = jsonObj.value("done");
        if (!jsonVal.isNull() && jsonVal.isObject())
        {
            jsonObj = jsonVal.toObject();
            jsonVal = jsonObj.value("number");
            if (!jsonVal.isNull() && jsonVal.isDouble())
            {
                qDebug() << QString::number(jsonVal.toDouble(), 'f', 3).toUtf8();
            }
        }

        if (jsonDoc.object().value("done").toObject().value("boolean").toBool())
        {
            qDebug("json true");
        }
        else
        {
            qDebug("json false");
            qDebug() << QString(reply_qbyte);
        }

        jsonArr = jsonDoc.object().value("done").toObject().value("list").toArray();
        QMetaObject::invokeMethod(lvList_, "clear");
        for (int i=0; i<jsonArr.size(); i++)
        {
            QVariantMap map;
            map.insert("name", jsonArr.at(i).toString());
            QMetaObject::invokeMethod(lvList_, "append", Q_ARG(QVariant, QVariant::fromValue(map)));
        }
    }

    btnRequest_->setProperty("enabled", "true");

    reply->deleteLater();
}
