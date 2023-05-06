import QtQuick


Image {
    id: player
    x: 73
    y: 1117
    width: 95
    height: 146
    source: "images/player.png"
    property int currentPosCell: 0
    property int previousPosCell: 0
    property bool isMoveRight: true
    property list<string> listMove: []
    property string name: "player"

    states: [
        State {
            name: "animLeft"
            PropertyChanges {
                target: animLeft
                running: true
            }
        },
        State {
            name: "animRight"
            PropertyChanges {
                target: animRight
                running: true
            }
        },
        State {
            name: "animUp"
            PropertyChanges {
                target: animUp
                running: true
            }
        },
        State {
            name: "animIdle"
            PropertyChanges {
                target: player
            }
        }
    ]

    NumberAnimation {
        id: animLeft
        target: player
        property: "x"
        from: x
        to: x - (120 *  wrapper.ratio)
        duration: 500
        onFinished: {
            player.state = "";
            if(player.listMove.length) {
                console.debug("End animRight");
                player.state = player.listMove.pop();
            } else {
                if(itemGame.statusGame !== "win") {
                    itemGame.statusGame = "game"
                    console.debug("Try change state: "+"EndStep"+player.name);
                    if(player.name === "PlayerAI") {
                        itemGame.state = "AwaitStep";
                    } else {
                        itemGame.state = "EndStep"+player.name;
                    }
                    console.debug("Changed state");
                } else if(itemGame.statusGame === "win") {
                    textDebug.text = "YOU WIN "+player.name;
                }
            }
        }
    }

    NumberAnimation {
        id: animRight
        target: player
        property: "x"
        from: x
        to: x + (120 *  wrapper.ratio)
        duration: 500
        onFinished: {
            player.state = "";
            if(player.listMove.length) {
                console.debug("End animRight");
                player.state = player.listMove.pop();
            } else {
                if(itemGame.statusGame !== "win") {
                    itemGame.statusGame = "game"
                    console.debug("Try change state: "+"EndStep"+player.name);
                    if(player.name === "PlayerAI") {
                        itemGame.state = "AwaitStep";
                    } else {
                        itemGame.state = "EndStep"+player.name;
                    }
                    console.debug("Changed state");
                } else if(itemGame.statusGame === "win") {
                    textDebug.text = "YOU WIN "+player.name;
                }
            }
        }
    }

    NumberAnimation {
        id: animUp
        target: player
        property: "y"
        from: y
        to: y - (120 *  wrapper.ratio)
        duration: 500
        onFinished: {
            player.state = "";
            if(player.listMove.length) {
                console.debug("End animUp");
                player.state = player.listMove.pop();
            } else {
                if(itemGame.statusGame !== "win") {
                    itemGame.statusGame = "game"
                    console.debug("Try change state: "+"EndStep"+player.name);
                    if(player.name === "PlayerAI") {
                        itemGame.state = "AwaitStep";
                    } else {
                        itemGame.state = "EndStep"+player.name;
                    }
                    console.debug("Changed state");
                } else if(itemGame.statusGame === "win") {
                    textDebug.text = "YOU WIN "+player.name;
                }
            }
        }
    }


    function move(randNumber) {
        console.debug("move()");
        console.debug("Before currentPosCell: "+player.currentPosCell+" previousPosCell: "+player.previousPosCell);

        //TEST
//        currentPosCell = 19;
//        randNumber = 6;
//        player.x = player.x + (120 *  wrapper.ratio) * 4;
//        player.y = player.y - (120 *  wrapper.ratio) * 3;
//        isMoveRight = false;


        let currCol = player.currentPosCell % 5;
        //currCol++;
        let currRow = Math.trunc(player.currentPosCell / 5);
        //currRow++;
        console.debug("Current row: "+currRow+" col: "+currCol);

        let newPosCell = player.currentPosCell + randNumber;
        if(newPosCell >= 49) { //Если больше некуда ходить, конец игры
            newPosCell = 49;
            randNumber = newPosCell-player.currentPosCell;
            itemGame.statusGame = "win";
        }
        let newCol = newPosCell % 5;
        //newCol++;
        let newRow = Math.trunc(newPosCell / 5);
        //newRow++;
        console.debug("New row: "+newRow+" col: "+newCol);

        let prevCol = player.previousPosCell % 5;
        let prevRow = Math.trunc(player.previousPosCell / 5);
        console.debug("Previous row: "+prevRow+" col: "+prevCol);

        if(newRow > currRow) { //Если сложный путь, придется проходить несколько новых строк
            let countRow = newRow - currRow;
            if(countRow === 1) { //Если придется пройти 1 новую строку
                let countNewRowStep = 5 - newCol;
                if(countNewRowStep > 0) {
                    countNewRowStep = 5 - countNewRowStep
                    if(isMoveRight) {
                        for(let i=0; i<countNewRowStep; i++) {
                            player.listMove.push("animLeft");
                        }
                    } else {
                        for(let i=0; i<countNewRowStep; i++) {
                            player.listMove.push("animRight");
                        }
                    }
                }
                player.listMove.push("animUp");
                let countOldRowStep = randNumber - countNewRowStep - 1;
                if(isMoveRight) {
                    for(let i=0; i<countOldRowStep; i++) {
                        player.listMove.push("animRight");
                    }
                } else {
                    for(let i=0; i<countOldRowStep; i++) {
                        player.listMove.push("animLeft");
                    }
                }
                isMoveRight = !isMoveRight;
            } else if(countRow === 2) { //Если придется пройти 2 новых строки
                player.listMove.push("animUp");
                let countStep = randNumber - countRow;
                if(isMoveRight) {
                    for(let i=0; i<countStep; i++) {
                        player.listMove.push("animLeft");
                    }
                } else {
                    for(let i=0; i<countStep; i++) {
                        player.listMove.push("animRight");
                    }
                }
                player.listMove.push("animUp");
            }
        } else { //Если простой путь, придется ходить по текущей строке
            if(isMoveRight) {
                for(let i=0; i<randNumber; i++) {
                    player.listMove.push("animRight");
                }
            } else {
                for(let i=0; i<randNumber; i++) {
                    player.listMove.push("animLeft");
                }
            }
        }

        player.previousPosCell = player.currentPosCell;
        player.currentPosCell = newPosCell;
        console.debug("After currentPosCell: "+player.currentPosCell+" previousPosCell: "+player.previousPosCell);

        player.state = player.listMove.pop();
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.debug(name);
            //player.state = listMove.pop();
        }
    }
}
