import QtQuick
import QtQuick.Layouts

ColumnLayout {
    id: root
    width: 512
    spacing: 10

    property string name
    property string imagePath
    property bool selected: false

    signal hover()

    Rectangle {
        color: "#707070"
        Layout.preferredWidth: parent.width
        Layout.preferredHeight: 512

        border.width: 5
        border.color: root.selected ? "blue" : "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                root.hover()
            }
        }
    }

    Text {
        text: root.name
        font.pixelSize: 16
        color: "#f0f0f0"
    }
}
