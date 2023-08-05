import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import QtQuick.Controls.Universal
import QtQuick.Controls.Material
import QuranKarim


Window {
    id: window
    width: screen.width //412
    height: screen.height //914

    property var builtInStyles

    visible: true

    ColumnLayout {
        id: columnLayout
        x: 85
        y: 506
        width: 100
        height: 100
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        antialiasing: true

        ToolBar {

            id: toolBar
            width: 360
            height: 60
            position: ToolBar.Footer
            antialiasing: true
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.minimumHeight: 60
            Layout.minimumWidth: 60
            Layout.preferredWidth: 60
            Layout.preferredHeight: 60
            Layout.rowSpan: 0
            hoverEnabled: false

            ToolButton {
                id: menuBtn
                width: 60
                height: 60
                text: qsTr("Menu")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                activeFocusOnTab: false
                antialiasing: true
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
                activeFocusOnTab: false
                antialiasing: true
                flat: true

                onClicked: swipeView.set_page(2)
            }

            ToolButton {
                id: playerBtn
                x: 60
                width: 60
                text: qsTr("Play")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                antialiasing: true
                activeFocusOnTab: false
                flat: true

            }

            ToolButton {
                id: khatmatsBtn
                x: 120
                y: 866
                width: 60
                text: qsTr("Tool Button")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                activeFocusOnTab: false
                antialiasing: true

                onClicked: swipeView.set_page(1)
            }
        }

        SwipeView {
            id: swipeView
            Layout.fillHeight: true
            Layout.fillWidth: true
            anchors.topMargin: 60
            antialiasing: true



            function set_page(index) {

                switch(index) {
                case 0:
                    break
                case 1:
                    khatmatsBtn.text = "Home"


                    break
                case 2:
                    settingsBtn.text = "Home"
                    break
                }
                swipeView.currentIndex = index
            }

            currentIndex: 1

                 Item {
                     id: firstPage
                     Text {
                         id: one
                         text: qsTr("one")
                     }
                 }
                 Item {
                     id: secondPage
                     Text {
                         id: two
                         text: qsTr("two")
                     }
                 }
                 Item {
                     id: thirdPage
                     Text {
                         id: three
                         text: qsTr("three")
                     }
                 }
        }
    }


}


