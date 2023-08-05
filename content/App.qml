import QtQuick 6.2
import QtQuick.Controls 6.2
import QuranKarim

Window {
    id: window
    width: 412
    height: 914


    visible: true

    Column {
        id: column
        anchors.fill: parent

        ToolBar {

            id: toolBar
            width: 360
            height: 60
            position: ToolBar.Footer
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            hoverEnabled: false

            ToolButton {
                id: menuBtn
                width: 60
                height: 60
                text: qsTr("Menu")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                flat: true

                onClicked: ()=>
                {
                    console.debug(screen.pixelDensity)
                }
            }

            ToolButton {
                id: settingsBtn
                x: 173
                y: 0
                width: 60
                text: qsTr("Settings")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                flat: true
            }

            ToolButton {
                id: playerBtn
                x: 60
                width: 60
                text: qsTr("Play")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                flat: true
            }
        }


    }


}
