import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Basic as Basic

import "../components"

AppPage {
    id: home
    title: "Home"
    backVisible: false

    ColumnLayout {
        anchors.fill: parent
        spacing: 32

        ListView {
            id: appTiles
            orientation: ListView.Horizontal
            snapMode: ListView.SnapToItem
            highlightFollowsCurrentItem: false
            boundsBehavior: Flickable.StopAtBounds
            spacing: 40
            model: 8
            clip: true

            property int selectedIndex: 0

            Layout.fillWidth: true
            Layout.fillHeight: true

            delegate: AppTile {
                name: `Item ${index}`
                imagePath: ""
                selected: appTiles.selectedIndex === index
                onHover: () => {
                    if (appTiles.selectedIndex === index) {
                        return
                    }

                    appTiles.selectedIndex = index
                }
            }

            Keys.onRightPressed: (event) => {
                if (selectedIndex < appTiles.count - 1) {
                    selectedIndex++
                    positionViewAtIndex(selectedIndex, ListView.Left)
                }
            }

            Keys.onLeftPressed: (event) => {
                if (selectedIndex > 0) {
                    selectedIndex--
                    positionViewAtIndex(selectedIndex, ListView.Left)
                }

                event.accepted = true;
            }
        }

        RowLayout {
            Basic.Button {
                text: "Pair Controller(s)"
                onClicked: app.loadPage("ControllerConfig.qml")
            }
        }
    }
}
