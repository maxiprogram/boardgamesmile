let cell;
let objectCell;

function createCell(name) {
    let cell = Qt.createComponent(name);
    if (cell.status === Component.Ready) {
        finishCreateComponent();
    } else {
        cell.statusChanged.connect(finishCreateComponent);
    }
}

function finishCreateComponent() {
    if (cell.status === Component.Ready) {
        objectCell = cell.createObject(itemGame, {x: 100, y: 100});
        if (objectCell === null) {
            console.error("Error creating object Cell.qml");
        } else {
            console.debug("Created object Cell.qml");
        }
    } else if (cell.status === Component.Error) {
        console.error("Error loading Cell.qml:", cell.errorString());
    }
}
