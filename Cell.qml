import QtQuick

//Rectangle {
//    color: "red"
//    width: 120
//    height: 120
//}

Image {
    id: cell
    width: 120
    height: 120
    source: "images/cell1.png"
    property string textCell

    RotationAnimator {
        target: cell;
        from: 0;
        to: 360;
        duration: 1000
        running: true
    }

    Text {
        //font: fontCell.font
        anchors.horizontalCenter: parent.horizontalCenter
        //font.family: fontCell.font.family
        //font.weight: fontCell.font.weight
        font.pixelSize: 16
        font.bold: true
        color: "#7c0680"
        text: textCell
    }
}
