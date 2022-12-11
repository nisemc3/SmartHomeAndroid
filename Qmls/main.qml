import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Imagine 2.15

Rectangle
{
    id: mainWindow
    objectName: "mainWindow"
    visible: true
    width: 640
    height: 480
    anchors.fill: parent

    Button {
        function hello() {
                    if (textField.text != "") {
                        text.text = "Привет, <b>" + textField.text.toUpperCase() + "</b>!"
                    }
                }

            id: test
            width: mainWindow.width / 2.5
            height: mainWindow.height / 10
            x: 0
            y: mainWindow.height - height
            text: qsTr("Тест")
            onClicked: hello()

            contentItem: Text
            {
                text: test.text
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pixelSize: (mainWindow.width>mainWindow.height) ? parent.height/1.75 : parent.height / 2.5
                color: "#005050"
             }

             background: Rectangle
             {
                 anchors.fill: parent
                 anchors.margins: 4
                 border.width: 2
                 border.color: "#FFFFFF"
                 radius: height / 4
                 gradient: Gradient {
                     GradientStop { position: 0; color: test.pressed ? "#00AAAA" : "#AAFFFF" }
                     GradientStop { position: 1; color: "#00CCCC" }
                 }
             }

        }

    TextField {
            id: textField
            width: parent.width
            height: parent.height / 10
            horizontalAlignment: Text.AlignHCenter
            placeholderText: "Ваше имя"
            validator: RegularExpressionValidator { regularExpression: /[а-яА-Яa-zA-Z]{16}/ }

            background: Rectangle {color: "white"}
            placeholderTextColor: "#00EEEE"
            font: {
                font.capitalization = Font.Capitalize
                font.bold = true
                font.pixelSize = mainWindow.height / 25}

            Keys.onPressed: {
                if (event.key === Qt.Key_Enter || event.key === Qt.Key_Return)
                {
                    Qt.inputMethod.hide()
                    event.accepted = true
                }
            }
        }

    Text {
            id: text
            y: textField.height
            width: parent.width
            height: parent.height / 10
            font.pixelSize: height / 2
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
    }

    ListView {
        function clear() {
            lvList.model.clear()
        }
        function append(newElement) {
            lvList.model.append(newElement)
        }
            id: lvList
            objectName: "lvList"
            y: text.y + text.height
            width: parent.width
            height: parent.height * 0.3
            clip: true
            spacing: 8
            model: ListModel {
                //ListElement { name: "Элемент 0" }
                //ListElement { name: "Элемент 1" }
                //ListElement { name: "Элемент 2" }
            }
            delegate: Rectangle {
                width: lvList.width
                height: lvList.height / 3
                color: "#00AAAA"
                Text {
                    text: name
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("ListView el#" + index + " clicked!")
                }
            }
        }


    Button {
            id: but_loader
            width: mainWindow.width / 4.5
            height: mainWindow.height / 10
            x: mainWindow.width / 2
            y: mainWindow.height - height
            text: qsTr("Loader")
            background: Rectangle
            {
                anchors.fill: parent
                anchors.margins: 4
                border.width: 2
                border.color: "#FFFFFF"
                radius: height / 4
                gradient: Gradient {
                    GradientStop { position: 0; color: but_loader.pressed ? "#00AAAA" : "#AAFFFF" }
                    GradientStop { position: 1; color: "#00CCCC" }
                }
            }
            contentItem: Text
            {
                text: but_loader.text
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pixelSize: (mainWindow.width>mainWindow.height) ? parent.height/1.75 : parent.height / 2.5
                color: "#005050"
             }
            onClicked: loader.setSource("qrc:/Qmls/Loader2.qml")
    }

    Loader {
            id: loader
            y: lvPager.y + lvPager.height
            width: parent.width
            height: parent.height * 0.2
            focus: true
            source: "qrc:/QMLs/Loader1.qml"
    }

    Button {
                id: but_request
                objectName: "btnRequest"
                property int _id: 3
                width: mainWindow.width / 4.5
                height: mainWindow.height / 10
                x: mainWindow.width - width
                y: mainWindow.height - height
                text: qsTr("Request")
                background: Rectangle
                {
                    anchors.fill: parent
                    anchors.margins: 4
                    border.width: 2
                    border.color: "#FFFFFF"
                    radius: height / 4
                    gradient: Gradient {
                        GradientStop { position: 0; color: but_request.pressed ? "#00AAAA" : "#AAFFFF" }
                        GradientStop { position: 1; color: "#00CCCC" }
                    }
                }
                contentItem: Text
                {
                    text: but_request.text
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pixelSize: (mainWindow.width>mainWindow.height) ? parent.height/1.75 : parent.height / 2.5
                    color: "#005050"
                 }
                onClicked: backend.makeRequest(_id)
    }

}


