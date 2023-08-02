import QtQuick 6.2
import QtQuick.Controls
import QtQuick.Layouts
import QuranKarim

Page {



    MouseArea {
        id: allArea
        anchors.fill: parent

        onClicked: ()=>{
            if (!menu_btn.btn_pressed)
                return
            menu_btn.btn_pressed = !menu_btn.btn_pressed
            sideMenu.visible = !sideMenu.visible
            sourateId.visible = !sourateId.visible
        }
    }

    header: Rectangle {
        id: headerMenu
        width: parent.width
        height: 100
        color: "grey"

        RowLayout {

            ToolButton {
                font.pixelSize: implicitHeight * 1.5
                id: menu_btn
                text: "☰"
                property bool btn_pressed: false
                onClicked: ()=> {
                    btn_pressed = !btn_pressed
                    sideMenu.visible = !sideMenu.visible
                    sourateId.visible = !sourateId.visible
                }
            }

            ToolButton {
                font.pixelSize: implicitHeight * 1.5
                id: play_btn
                text: "▶"
            }
        }

        Label {
            id: sourateId
            anchors.centerIn: parent
            text: "Sourate"
            font.pixelSize: implicitHeight * 1.5

        }
    }

    Rectangle {
        id: sideMenu
        width: parent.width / 5 * 4
        height: parent.height

        color: "grey"
        visible: false

        MouseArea {
            anchors.fill: parent
            onClicked: ()=> {}
        }

        ColumnLayout {
            ToolButton {
                font.pixelSize: implicitHeight * 1.5
                id: language_btn
                text: "🌐"
            }

            ToolButton {
                font.pixelSize: implicitHeight * 1.5
                id: admin_btn
                text: "🛡️"
            }


        }

    }
}
