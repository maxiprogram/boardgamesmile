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

    Text {
        anchors.centerIn: parent
        text: "THIS IS MAIN MENU "+item.width+" "+item.height
        color: "green"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            //Logic.changeStatus(Logic.statusEnum.Game);
            loader.state = "Start->Game";
        }
    }
}
