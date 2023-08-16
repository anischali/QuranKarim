import QtQuick 6.2
import QtQuick.Controls 6.2
import QuranKarim
import QtQuick.Layouts

Item {


    Rectangle {
        id: rectangle
        anchors.fill: parent

        ColumnLayout {
            id: columnLayout
            anchors.fill: parent

            QuranToolBar {
                id: quranToolBar
                anchors.top: parent.top
                Layout.fillWidth: true

            }

        }
    }


}
