import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
    id: app
    width: 1280
    height: 720
    visible: true
    visibility: Window.FullScreen
    title: "Olympus"
    color: "#FF404040"

    property string currentPage: "Home.qml"
    property bool inAnimation: false

    Loader {
        id: mainLoader
        anchors.fill: parent
        source: app.currentPage
    }

    function loadPage(page) {
        if (inAnimation || currentPage === page) {
            return false;
        }

        inAnimation = true;
        currentPage = page;
        inAnimation = false;

        return true;
    }
}
