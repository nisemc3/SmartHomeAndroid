import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15

Rectangle
{
    id: mainWindow
    objectName: "mainWindow"
    visible: true
    width: 640
    height: 480
    anchors.fill: parent

    Button {
            id: test
            width: mainWindow.width / 2.5
            height: mainWindow.height / 10
            x: 0
            y: mainWindow.height - height
            text: qsTr("Тест")
            onClicked: console.log("Button 'Тест' clicked")

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


}


