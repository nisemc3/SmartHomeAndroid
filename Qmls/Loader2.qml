import QtQuick 2.15

Rectangle {
    id: rect
    anchors.fill: parent
    focus: true
    color: "blue"
    opacity: 0.2
    SequentialAnimation {
        running: true
        loops: SequentialAnimation.Infinite
        PropertyAnimation { target: rect; property: "opacity"; to: 0; duration: 500 }
        PropertyAnimation { target: rect; property: "opacity"; to: 0.2; duration: 500 }
    }
    Keys.onPressed: {
        if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape) {
            loader.source = "qrc:/QMLs/Loader1.qml"
            event.accepted = true
        }
    }
}
