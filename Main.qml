import QtQuick
import QtQuick.Window
import QtMultimedia
import Qt.labs.settings

import "js/scaling-ratio.js" as ScalingRatio
import net.maxiprogram.scalingratiowrapper

Window {
    id: mainWindow
    width: 405
    height: 900
    //visibility: "FullScreen"
    visible: true
    title: qsTr("Board Game Smile")
    color: "black"

    ScalingRatioWrapper {
        id: wrapper
        anchors.fill: parent
        refWidth: 720
        refHeight: 1600
        Component.onCompleted: {
            console.debug("QML ScalingRatioWrapper.onCompleted");
            wrapper.calculateRatio();
            //wrapper.calculateRatioRef(720, 1600);
            //wrapper.calculateRatioRefTo(720, 1600, 1920, 1080);
            wrapper.calculateRatioRefTo(720, 1600, mainWindow.width, mainWindow.height);
            //wrapper.updateScaleChildrens();
            console.debug("QML ScalingRatioWrapper.onCompleted ratio="+ratio);
            console.debug("QML realWidth="+Screen.width+" realHeight="+Screen.height);

            loader.state = "Game->Start";
        }

        Loader {
            id: loader
            anchors.fill: parent
            states: [
                State {
                    name: "Start->Game"
                    PropertyChanges {
                        target: loader;
                        source: "GameLevel.qml"
                    }
                },
                State {
                    name: "Game->Start"
                    PropertyChanges {
                        target: loader;
                        source: "Start.qml"
                    }
                },
                State {
                    name: "Start->Option"
                    PropertyChanges {
                        target: loader;
                        source: "Option.qml"
                    }
                },
                State {
                    name: "Option->Start"
                    PropertyChanges {
                        target: loader;
                        source: "Start.qml"
                    }
                }
            ]
        }
    }

    SoundEffect {
        id: soundBackground
        source: "sounds/background.wav"
        loops: SoundEffect.Infinite
    }

    Component.onCompleted: {
        if(settings.sound) {
            soundBackground.play();
        }
    }

    Settings {
        id: settings
        property string username: "Player"
        property bool sound: true
    }


//    Cell {
//        id: cell
//        Component.onCompleted: {
//            console.debug(ScalingRatio.test());
//            console.debug(ScalingRatio.refWidth);
//            //ScalingRatio.calculate(Screen.width, Screen.height, Screen.pixelDensity);
//            ScalingRatio.calculate(405, 900, Screen.pixelDensity);

////            mainWindow.width = 720 * ScalingRatio.m_ratio;
////            mainWindow.height = 1600 * ScalingRatio.m_ratio;
////            console.debug(mainWindow.width);
////            console.debug(mainWindow.height);

//            cell.width = 120 * ScalingRatio.m_ratio;
//            cell.height = 120 * ScalingRatio.m_ratio;
//            console.debug(cell.width);
//            console.debug(cell.height);
//        }
//    }


//    Text {
//        text: "Width: " + mainWindow.width + " Height: " + mainWindow.height
//        color: "red"
//    }

//    FpsItem {
//        anchors.centerIn: parent
//    }

}
