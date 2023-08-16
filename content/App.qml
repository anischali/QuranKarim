import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import QtQuick.Controls.Universal
import QtQuick.Controls.Material
import QuranKarim


Window {
    id: window
    width: 412
    height: 914

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
            anchors.bottom: parent.bottom
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



            RowLayout {
                id: rowLayout
                y: 0
                width: 100
                height: 60
                anchors.left: parent.left
                anchors.right: parent.right

                ToolButton {
                    id: quranBtn
                    width: 0
                    height: 60
                    icon.source: "resources/Icons/quran.png"
                    Layout.fillWidth: true
                    activeFocusOnTab: false
                    antialiasing: true
                    flat: true
                    onClicked: mainStack.currentIndex = 0
                }

                ToolButton {
                    id: translationBtn
                    width: 0
                    height: 60
                    Layout.fillWidth: true
                    activeFocusOnTab: false
                    antialiasing: true
                    flat: true
                    icon.source: "resources/Icons/translate.png"
                    onClicked: mainStack.currentIndex = 1
                }

                ToolButton {
                    id: khatmatsBtn
                    width: 0
                    height: 60
                    Layout.fillWidth: true
                    antialiasing: true
                    activeFocusOnTab: false
                    flat: true
                    icon.source: "resources/Icons/seals.png"
                    onClicked: mainStack.currentIndex = 2
                }

                ToolButton {
                    id: settingsBtn
                    width: 0
                    height: 60
                    Layout.fillWidth: true
                    activeFocusOnTab: false
                    antialiasing: true
                    icon.source: "resources/Icons/setting.png"
                    onClicked: mainStack.currentIndex = 3
                }
            }
        }

        StackLayout {
            id: mainStack
            anchors.fill: parent
            Layout.fillHeight: true
            Layout.fillWidth: true
            anchors.bottomMargin: 60
            currentIndex: 0

            MainPage {}

            Rectangle {
                id: rectangle1
                width: 200
                height: 200
                color: "#401708"
            }

            Rectangle {
                id: rectangle2
                width: 200
                height: 200
                color: "#8ed380"
            }

            Rectangle {
                id: rectangle3
                width: 200
                height: 200
                color: "#8e0080"
            }
        }
    }


}




