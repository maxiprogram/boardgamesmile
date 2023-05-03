.pragma library


//let refDpi = 216.;
let refWidth = 720;
let refHeight = 1600;
//let width = Screen.

//QRect rect = QGuiApplication::primaryScreen()->geometry();
//qreal height = qMax(rect.width(), rect.height());
//qreal width = qMin(rect.width(), rect.height());
//qreal dpi = QGuiApplication::primaryScreen()->logicalDotsPerInch();
//m_ratio = qMin(height/refHeight, width/refWidth);
//m_ratioFont = qMin(height*refDpi/(dpi*refHeight), width*refDpi/(dpi*refWidth));

let m_ratio = 0.45;

function test() {
    return "test";
}

function calculate(realWidth, realHeight, realDpi) {
    console.debug(realWidth);
    console.debug(realHeight);
    console.debug(realDpi);
    let width = Math.min(realWidth, realHeight);
    let height = Math.max(realWidth, realHeight);
    console.debug(width);
    console.debug(height);
    let ratio = Math.min(height/refHeight, width/refWidth);
    console.debug(ratio);
    m_ratio = ratio;
    return "test";
}
