import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Studio.Components
import QtQuick.Controls 6.2

Item {
    id: item1
    width: 419
    height: 912
    ColumnLayout {
        id: columnLayout
        anchors.fill: parent


        Switch {
            id: switch1
            x: 47
            y: 8
            text: qsTr("Night mode")
            anchors.left: parent.left
            anchors.right: parent.right
            Layout.fillHeight: false
            Layout.fillWidth: true
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            antialiasing: true
        }
    }
}
