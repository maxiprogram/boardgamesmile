import QtQuick


import "js/logic.js" as Logic

Item {
    id: itemGame
    property variant playerObject
    property variant playerObjectAI
    property string statusGame: "game"

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
                if(itemGame.state === "AwaitStep") {
                    runStepPlayer();
                }
            }
        }
    }

    Component.onCompleted: {
        createGrid();
        createPlayer();
        createPlayerAI();
        itemGame.state = "AwaitStep";
    }

    function createGrid() {
        for(let i=0; i<50; i++) {
            let width = 120 * wrapper.ratio;
            let height = 120 * wrapper.ratio;
            let col = i % 5;
            let x = ((col * 120) + 0) * wrapper.ratio;
            let row = Math.trunc(i / 5);
            let y = ((row * 120) + 0) * wrapper.ratio;

            let textCell = "";
            if(row%2 === 0) {
                textCell = 50-i;
            } else {
                textCell = 50-i-(5-col)+1+col;
            }

            let cell = Qt.createComponent("Cell.qml");
            let imgCell = "images/cell" + i % 2 + ".png"
            let cellObject = cell.createObject(itemGrid, {x: x, y: y, width: width, height: height, textCell: textCell, source: imgCell});
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
        let playerObject = player.createObject(itemGame, {x: x, y: y, width: width, height: height, name: "Player"});
        if (playerObject === null) {
            // Error Handling
            console.error("Error creating object Player.qml");
        }
        itemGame.playerObject = playerObject;
    }

    function createPlayerAI() {
        let width = 95 * wrapper.ratio;
        let height = 146 * wrapper.ratio;
        let x = 73 * wrapper.ratio;
        let y = 1117 * wrapper.ratio;

        let playerAI = Qt.createComponent("Player.qml");
        let playerObjectAI = playerAI.createObject(itemGame, {x: x, y: y, width: width, height: height, name: "PlayerAI"});
        if (playerObjectAI === null) {
            // Error Handling
            console.error("Error creating object Player.qml");
        }
        itemGame.playerObjectAI = playerObjectAI;
    }

    function runStepPlayer() {
        if(itemGame.statusGame === "game") {
            itemGame.statusGame = "animation"
            let randNumber = Math.floor(Math.random() * 6 + 1);
            textRandom.text = randNumber;
            itemGame.playerObject.move(randNumber);
        }
    }

    function runStepPlayerAI() {
        if(itemGame.statusGame === "game") {
            itemGame.statusGame = "animation"
            let randNumber = Math.floor(Math.random() * 6 + 1);
            textRandom.text = randNumber;
            itemGame.playerObjectAI.move(randNumber);
        }
    }

    MouseArea {
        width: 50
        height: 50
        onClicked: {
            loader.state = "Game->Start";
        }
    }

    states: [
        State {
            name: "AwaitStep"
        },
        State {
            name: "EndStepPlayer"
            StateChangeScript {
                script: runStepPlayerAI()
            }
        }
    ]

//    Test {

//    }

    Text {
        id: textDebug
        anchors.centerIn: parent
        //text: "THIS IS GAME LEVEL "+item.width+" "+item.height
        color: "red"
    }
}
