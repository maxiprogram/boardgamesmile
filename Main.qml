import QtQuick
import QtQuick.Window

Window {
    id: mainWindow
    width: 405
    height: 900
    visible: true
    title: qsTr("Hello World")



    Text {
        text: "Width: " + mainWindow.width + " Height: " + mainWindow.height
    }

}
