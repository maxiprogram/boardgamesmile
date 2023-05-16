import QtQuick


import "js/logic.js" as Logic

Item {
    id: itemGame
    property variant playerObject
    property variant playerObjectAI
    property string statusGame: "game"

    FontLoader {
        id: fontCell
        source: "fonts/SpeedRush-JRKVB.ttf"
    }

    Item {
        id: itemGrid
        //x: 60 * wrapper.ratio
        anchors.horizontalCenter: parent.horizontalCenter
        y: 80 * wrapper.ratio
        width: 600 * wrapper.ratio
        height: 1200 * wrapper.ratio
    }

    Rectangle {
        id: itemPanel
        //x: 60 * wrapper.ratio
        anchors.horizontalCenter: parent.horizontalCenter
        y: 1320 * wrapper.ratio
        width: 600 * wrapper.ratio
        height: 246 * wrapper.ratio
        color: "#00000000"


        Rectangle {
            anchors.centerIn: itemPanel
            width: 200 * wrapper.ratio
            height: 200 * wrapper.ratio
            color: "#FFFF0000"
            //border.color: "blue"
            //border.width: 5
            radius: 10

            AnimatedImage {
                id: animCube
                anchors.centerIn: parent
                width: 130 * wrapper.ratio
                height: 130 * wrapper.ratio
                source: "images/cube.gif"
                currentFrame: 0
                playing: false
            }

            Timer {
                id: timerCube
                property int randomFrame: 0
                property string playerName: ""
                interval: 3000;
                running: false;
                repeat: false
                onTriggered: {
                    animCube.playing = false;
                    animCube.currentFrame = timerCube.randomFrame;
                    if(timerCube.playerName === "Player") {
                        itemGame.playerObject.move(randomFrame+1);
                    } else if(timerCube.playerName === "PlayerAI") {
                        itemGame.playerObjectAI.move(randomFrame+1);
                    }
                }
            }
        }

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
        createPlayerAI();
        createPlayer();
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

            let imgCell = "images/cell" + i % 2 + ".png"
            if((col === 0 && row%2 === 0) && (i!=0 && i!=45)) {
                imgCell = "images/cell2.png"
            } else if((col === 0 && row%2 !== 0) && (i!=0 && i!=45)) {
                imgCell = "images/cell3.png"
            } else if((col === 4 && row%2 !== 0) && (i!=0 && i!=45)) {
                imgCell = "images/cell2.png"
            } else if((col === 4 && row%2 === 0) && (i!=0 && i!=45)) {
                imgCell = "images/cell3.png"
            }

            let cell = Qt.createComponent("Cell.qml");
            let cellObject = cell.createObject(itemGrid, {x: x, y: y, width: width, height: height, textCell: textCell, source: imgCell});
            if (cellObject === null) {
                // Error Handling
                console.error("Error creating object Cell.qml");
            }
        }
    }

    function createPlayer() {
        let width = 78 * wrapper.ratio;
        let height = 121 * wrapper.ratio; //origin 146
        //let x = 60 * wrapper.ratio;
        let x = 1 * wrapper.ratio;
        //let y = 1149 * wrapper.ratio;
        let y = 1075 * wrapper.ratio;

        let player = Qt.createComponent("Player.qml");
        let playerObject = player.createObject(itemGrid, {x: x, y: y, width: width, height: height, name: "Player"});
        if (playerObject === null) {
            // Error Handling
            console.error("Error creating object Player.qml");
        }
        itemGame.playerObject = playerObject;
    }

    function createPlayerAI() {
        let width = 78 * wrapper.ratio;
        let height = 121 * wrapper.ratio; //origin 146
        //let x = 106 * wrapper.ratio;
        let x = 46 * wrapper.ratio;
        //let y = 1149 * wrapper.ratio;
        let y = 1075 * wrapper.ratio;

        let playerAI = Qt.createComponent("Player.qml");
        let playerObjectAI = playerAI.createObject(itemGrid, {x: x, y: y, width: width, height: height, name: "PlayerAI", source: "images/playerAI.png"});
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

            animCube.playing = true;
            timerCube.randomFrame = randNumber-1;
            timerCube.playerName = "Player";
            timerCube.start();

            //itemGame.playerObject.move(randNumber);
        }
    }

    function runStepPlayerAI() {
        if(itemGame.statusGame === "game") {
            itemGame.statusGame = "animation"
            let randNumber = Math.floor(Math.random() * 6 + 1);
            textRandom.text = randNumber;

            animCube.playing = true;
            timerCube.randomFrame = randNumber-1;
            timerCube.playerName = "PlayerAI";
            timerCube.start();

            //itemGame.playerObjectAI.move(randNumber);
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
