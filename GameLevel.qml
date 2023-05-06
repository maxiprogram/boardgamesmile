import QtQuick


import "js/logic.js" as Logic

Item {
    id: itemGame
    property variant playerObject

    Item {
        id: itemGrid
        x: 60 * wrapper.ratio
        y: 80 * wrapper.ratio
        width: 600 * wrapper.ratio
        height: 1200 * wrapper.ratio
    }

    Rectangle {
        id: itemPanel
        x: 60 * wrapper.ratio
        y: 1320 * wrapper.ratio
        width: 600 * wrapper.ratio
        height: 246 * wrapper.ratio

        Text {
            id: textRandom
            anchors.centerIn: itemPanel
            text: "Click to Random"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                let randNumber = Math.floor(Math.random() * 7);
                textRandom.text = randNumber;
                itemGame.playerObject.move(randNumber);
            }
        }
    }

    Component.onCompleted: {
        createGrid();
        createPlayer();
    }

    function createGrid() {
        for(let i=0; i<50; i++) {
            let width = 120 * wrapper.ratio;
            let height = 120 * wrapper.ratio;
            let col = i % 5;
            let x = ((col * 120) + 0) * wrapper.ratio;
            let row = Math.trunc(i / 5);
            let y = ((row * 120) + 0) * wrapper.ratio;

            let cell = Qt.createComponent("Cell.qml");
            let cellObject = cell.createObject(itemGrid, {x: x, y: y, width: width, height: height, textCell: i});
            if (cellObject === null) {
                // Error Handling
                console.error("Error creating object Cell.qml");
            }
        }
    }

    function createPlayer() {
        let width = 95 * wrapper.ratio;
        let height = 146 * wrapper.ratio;
        let x = 73 * wrapper.ratio;
        let y = 1117 * wrapper.ratio;

        let player = Qt.createComponent("Player.qml");
        let playerObject = player.createObject(itemGame, {x: x, y: y, width: width, height: height});
        if (playerObject === null) {
            // Error Handling
            console.error("Error creating object Player.qml");
        }
        itemGame.playerObject = playerObject;
    }

    MouseArea {
        width: 50
        height: 50
        onClicked: {
            //Logic.changeStatus(Logic.statusEnum.Game);
            loader.state = "Game->Start";
        }
    }

//    Test {

//    }

    Text {
        anchors.centerIn: parent
        text: "THIS IS GAME LEVEL "+item.width+" "+item.height
        color: "green"
    }
}
