import QtQuick
import QtQuick.Window

import "js/scaling-ratio.js" as ScalingRatio
import net.maxiprogram.scalingratiowrapper

Window {
    id: mainWindow
    width: 405
    height: 900
    visible: true
    title: qsTr("Hello World")
    color: "black"

    ScalingRatioWrapper {
        id: wrapper
        author: "Init qml"
        refWidth: 720
        refHeight: 1600
        Component.onCompleted: {
            console.debug("ScalingRatioWrapper.onCompleted author="+author);
            wrapper.calculateRatio();
            console.debug("ScalingRatioWrapper.onCompleted ratio="+ratio);
        }
    }


//    ScalingRatioWrapper {
//        author: "Amelie"
//        creationDate: new Date()
//    }

    Cell {
        id: cell
        Component.onCompleted: {
            console.debug(ScalingRatio.test());
            console.debug(ScalingRatio.refWidth);
            //ScalingRatio.calculate(Screen.width, Screen.height, Screen.pixelDensity);
            ScalingRatio.calculate(405, 900, Screen.pixelDensity);

//            mainWindow.width = 720 * ScalingRatio.m_ratio;
//            mainWindow.height = 1600 * ScalingRatio.m_ratio;
//            console.debug(mainWindow.width);
//            console.debug(mainWindow.height);

            cell.width = 120 * ScalingRatio.m_ratio;
            cell.height = 120 * ScalingRatio.m_ratio;
            console.debug(cell.width);
            console.debug(cell.height);
        }
    }


    Text {
        text: "Width: " + mainWindow.width + " Height: " + mainWindow.height
        color: "red"
    }

}
