import QtQuick
import QtQuick.Controls

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
        source: "images/background_menu.png"
    }

//    TextInput {
//        anchors.horizontalCenter: parent.horizontalCenter
//        text: "Player"
//        font.pixelSize: 32
//    }


    Image {
        id: imageTextInput
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: 252 * wrapper.ratio
        source: "images/button_menu.png"
    }

    TextInput {
        id: textInput
        anchors.centerIn: parent
        width: parent.width * 0.6
        text: "Player"
        font.pixelSize: 34
        font.bold: true
        color: "red"
        maximumLength: 12
        //inputMask: "AAAAAAAAAAAA;_"
    }

    Text {
        anchors.bottom: imageTextInput.top
        anchors.left: textInput.left
        text: "Name:"
        font.pixelSize: 32
    }

    Image {
        id: imageSoundBackground
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: imageTextInput.bottom
        width: parent.width * 0.8
        height: 252 * wrapper.ratio
        source: "images/button_menu.png"

        Text {
            id: textSoundBackground
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 35
            text: "Music"
            font.pixelSize: 34
            font.bold: true
            color: "red"
        }
    }

    Image {
        anchors.top: imageSoundBackground.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 146 * wrapper.ratio
        height: 154 * wrapper.ratio
        source: "images/sound_on.png"
    }



    Image {
        id: imageButtonBack
        width: 146 * wrapper.ratio
        height: 154 * wrapper.ratio
        source: "images/button_back.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.state = "Option->Start";
            }
        }
    }

//    Text {
//        anchors.centerIn: parent
//        text: "THIS IS OPTION "+item.width+" "+item.height
//        color: "green"
//    }
}
