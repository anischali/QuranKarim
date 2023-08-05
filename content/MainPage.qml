import QtQuick 6.2
import QtQuick.Controls 6.2
import QuranApp

SwipeView {
    id: swipeView
    width: 200
    height: 200
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.topMargin: 60

    Rectangle {
        id: rectangle
        width: 200
        height: 200
        color: "#8c1010"
    }
}
