import QtQuick 6.2
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
        RowLayout {
            id: rowLayout
            anchors.left: parent.left
            anchors.right: parent.right


            ToolButton {
                id: searchBtn
                icon.source: "resources/Icons/search.png"
                Layout.fillWidth: true
            }

            ToolButton {
                id: toolButton1
                text: qsTr("Tool Button")
                Layout.fillWidth: true
            }

            ToolButton {
                id: toolButton2
                text: qsTr("Tool Button")
                Layout.fillWidth: true
            }

            ToolButton {
                id: toolButton3
                text: qsTr("Tool Button")
                Layout.fillWidth: true
            }

            ToolButton {
                id: toolButton4
                text: qsTr("Tool Button")
                Layout.fillWidth: true
            }
        }

}
