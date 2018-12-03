import QtQuick 2.0

Rectangle {
    // Property
    width: 250
    height: 80
    property alias text: textId.text
    color: "lightblue"
    border.width: 1
    // Signal
    signal btnClicked()
    // Component
    Text {
        id: textId
        anchors.centerIn: parent
        font.pixelSize: 20
        text: "START"
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            textId.font.bold = true
            parent.color = "blue"
        }
        onReleased: {
            textId.font.bold = false
            parent.color = "lightblue"
        }
        onCanceled: {
            textId.font.bold = false
            parent.color = "lightblue"
        }
        onClicked: btnClicked()
    }
}
