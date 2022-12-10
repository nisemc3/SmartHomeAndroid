import QtQuick 2.15

Rectangle {
    anchors.fill: parent
    anchors.margins: 4
    border.width: 2
    border.color: "#FFFFFF"
    radius: height / 4
    gradient: Gradient {
        GradientStop { position: 0; color: control.pressed ? "#00AAAA" : "#AAFFFF" }
        GradientStop { position: 1; color: "#00CCCC" }
    }
}
