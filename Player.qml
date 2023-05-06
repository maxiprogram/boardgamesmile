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
        duration: 3000
        onFinished: {
            console.debug("End animRight");
            player.state = "";
            if(player.listMove.length) {
                player.state = player.listMove.pop();
            }
        }
    }

    NumberAnimation {
        id: animRight
        target: player
        property: "x"
        from: x
        to: x + (120 *  wrapper.ratio)
        duration: 3000
        onFinished: {
            console.debug("End animRight");
            player.state = "";
            if(player.listMove.length) {
                player.state = player.listMove.pop();
            }
        }
    }

    NumberAnimation {
        id: animUp
        target: player
        property: "y"
        from: y
        to: y - (120 *  wrapper.ratio)
        duration: 3000
        onFinished: {
            console.debug("End animUp");
            player.state = "";
            if(player.listMove.length) {
                player.state = player.listMove.pop();
            }
        }
    }


    function move(randNumber) {
        console.debug("move()");
        console.debug("Before currentPosCell: "+player.currentPosCell+" previousPosCell: "+player.previousPosCell);



        let currCol = player.currentPosCell % 5;
        let currRow = Math.trunc(player.currentPosCell / 5);
        console.debug("Current row: "+currRow+" col: "+currCol);

        let newPosCell = player.currentPosCell + randNumber;
        let newCol = newPosCell % 5;
        let newRow = Math.trunc(newPosCell / 5);
        console.debug("Current row: "+currRow+" col: "+currCol);

        let prevCol = player.previousPosCell % 5;
        let prevRow = Math.trunc(player.previousPosCell / 5);
        console.debug("previous row: "+prevRow+" col: "+prevCol);

        if(newRow !== currRow) {
            let countStep = 5 - newCol;
            if(countStep > 0) {
                let countNewRowStep = 5 - countStep
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
            countStep--;
            if(isMoveRight) {
                for(let i=0; i<countStep; i++) {
                    player.listMove.push("animRight");
                }
            } else {
                for(let i=0; i<countStep; i++) {
                    player.listMove.push("animLeft");
                }
            }
            isMoveRight = !isMoveRight;
        } else {
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
        player.currentPosCell += randNumber;
        console.debug("After currentPosCell: "+player.currentPosCell+" previousPosCell: "+player.previousPosCell);

        player.state = player.listMove.pop();
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            listMove.push("animUp");
            listMove.push("animUp");
            listMove.push("animLeft");
            listMove.push("animUp");
            listMove.push("animRight");
            listMove.push("animUp");
            listMove.push("animUp");
            console.debug(listMove);
            console.debug(listMove.length);
            //player.state = listMove.pop();
        }
    }
}
