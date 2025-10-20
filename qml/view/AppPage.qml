import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Item {
    id: root
    anchors.fill: parent

    property string title
    property bool backVisible: true
    default property alias content: children.data

    ColumnLayout {
        anchors.fill: parent;
        anchors.margins: 38

        spacing: 52

        Row {
            spacing: 16

            Button {
                visible: root.backVisible
                text: "Back"
                onClicked: app.loadPage("Home.qml")
            }

            Text {
                text: root.title
                font.pixelSize: 32
                font.bold: true
                color: "#f0f0f0"
            }
        }

        Rectangle {
            id: children
            color: "transparent"

            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
