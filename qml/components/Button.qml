import QtQuick
import QtQuick.Controls.Basic as BasicControls

Item {
    BasicControls.Button {
        id: root
        default property alias btn: root.data
    }
}
