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
    source: "images/cell.png"
    property string textCell

    RotationAnimator {
        target: cell;
        from: 0;
        to: 360;
        duration: 1000
        running: true
    }

    Text {
        text: textCell
    }
}
