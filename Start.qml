import QtQuick

Item {
    id: item
    //anchors.fill: parent

//    x: 200
//    y: 200
//    width: 200
//    height: 200
//    color: "red"
//    border.color: "white"
//    border.width: 5
//    radius: 10

    FontLoader {
        id: fontStart
        source: "fonts/MinecraftEvenings-RBao.ttf"
    }

    Image {
        id: imageBackground
        anchors.fill: parent
        fillMode: Image.Tile
        source: "images/background_menu.png"
    }

    Image {
        id: imageButtonStart
        anchors.horizontalCenter: parent.horizontalCenter
        y: 261 * wrapper.ratio
        width: 610 * wrapper.ratio
        height: 272 * wrapper.ratio
        source: "images/button_menu.png"

        Text {
            font.family: fontStart.font.family
            font.weight: fontStart.font.weight
            font.pixelSize: 110 * Math.min(item.height/1600, item.width/720) //64
            //font.pointSize: 50
            color: "red"
            anchors.centerIn: parent
            text: "PLAY"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                wrapper.gameplayStartJS();
                loader.state = "Start->Game";
            }
        }
    }

    Image {
        id: imageButtonOption
        anchors.horizontalCenter: parent.horizontalCenter
        y: 578 * wrapper.ratio
        width: 610 * wrapper.ratio
        height: 272 * wrapper.ratio
        source: "images/button_menu.png"

        Text {
            font.family: fontStart.font.family
            font.weight: fontStart.font.weight
            font.pixelSize: 110 * Math.min(item.height/1600, item.width/720) //64
            //font.pointSize: 50
            color: "red"
            anchors.centerIn: parent
            text: "OPTION"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.state = "Start->Option";
            }
        }
    }

    Image {
        id: imageButtonExit
        anchors.horizontalCenter: parent.horizontalCenter
        y: 916 * wrapper.ratio
        width: 610 * wrapper.ratio
        height: 272 * wrapper.ratio
        source: "images/button_menu.png"

        Text {
            font.family: fontStart.font.family
            font.weight: fontStart.font.weight
            font.pixelSize: 110 * Math.min(item.height/1600, item.width/720) //64
            //font.pointSize: 50
            color: "red"
            anchors.centerIn: parent
            text: "EXIT"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit();
            }
        }
    }

    Component.onCompleted: {
        //console.debug("QML ratio: " + Math.min(item.height/1600, item.width/720));
    }

//    Text {
//        anchors.centerIn: parent
//        text: "THIS IS MAIN MENU "+item.width+" "+item.height
//        color: "green"
//    }
}
