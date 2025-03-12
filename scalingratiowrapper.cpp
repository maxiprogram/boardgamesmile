#include "scalingratiowrapper.h"

#ifdef Q_OS_WASM
#include <emscripten/val.h>
#include <emscripten.h>
#endif

ScalingRatioWrapper::ScalingRatioWrapper(QQuickItem *parent)
    : QQuickItem{parent}
{
    qDebug()<<"ScalingRatioWrapper::ScalingRatioWrapper()";
    resultRatio = 1;
}

void ScalingRatioWrapper::setRefWidth(qreal value)
{
    refWidth = value;
    emit refWidthChanged();
}

void ScalingRatioWrapper::setRefHeight(qreal value)
{
    refHeight = value;
    emit refHeightChanged();
}

void ScalingRatioWrapper::setRatio(qreal value)
{
    resultRatio = value;
    emit ratioChanged();
}

qreal ScalingRatioWrapper::getRefWidth()
{
    return refWidth;
}

qreal ScalingRatioWrapper::getRefHeight()
{
    return refHeight;
}

qreal ScalingRatioWrapper::getRatio()
{
    return resultRatio;
}


void ScalingRatioWrapper::calculateRatio()
{
    qDebug()<<"ScalingRatioWrapper::calculateRatio()";

    qreal realPixelRatio = QGuiApplication::primaryScreen()->devicePixelRatio();
    QRect rect = QGuiApplication::primaryScreen()->geometry();
    qreal height = qMax(rect.width(), rect.height());
    qreal width = qMin(rect.width(), rect.height());
    //qreal dpi = QGuiApplication::primaryScreen()->logicalDotsPerInch();
    resultRatio = qMin(height/refHeight, width/refWidth);
    //m_ratioFont = qMin(height*refDpi/(dpi*refHeight), width*refDpi/(dpi*refWidth));

    qDebug()<<"realWidth="<<width<<" realHeight="<<height;
    qDebug()<<"refWidth="<<refWidth<<" refHeight="<<refHeight;
    qDebug()<<"devicePixelRatio="<<QGuiApplication::primaryScreen()->devicePixelRatio();
    qDebug()<<"ratio="<<resultRatio;
}

void ScalingRatioWrapper::calculateRatioRef(qreal refWidth, qreal refHeight)
{
    qDebug()<<"ScalingRatioWrapper::calculateRatioRef()";

    QRect rect = QGuiApplication::primaryScreen()->geometry();
    qreal height = qMax(rect.width(), rect.height());
    qreal width = qMin(rect.width(), rect.height());
    //qreal dpi = QGuiApplication::primaryScreen()->logicalDotsPerInch();
    resultRatio = qMin(height/refHeight, width/refWidth);
    //m_ratioFont = qMin(height*refDpi/(dpi*refHeight), width*refDpi/(dpi*refWidth));

    qDebug()<<"realWidth="<<width<<" realHeight="<<height;
    qDebug()<<"refWidth="<<refWidth<<" refHeight="<<refHeight;
    qDebug()<<"devicePixelRatio="<<QGuiApplication::primaryScreen()->devicePixelRatio();
    qDebug()<<"ratio="<<resultRatio;
}

void ScalingRatioWrapper::calculateRatioRefTo(qreal refWidth, qreal refHeight, qreal realWidth, qreal realHeight)
{
    qDebug()<<"ScalingRatioWrapper::calculateRatioRefTo()";

    //qreal dpi = QGuiApplication::primaryScreen()->logicalDotsPerInch();
    resultRatio = qMin(realHeight/refHeight, realWidth/refWidth);
    //m_ratioFont = qMin(height*refDpi/(dpi*refHeight), width*refDpi/(dpi*refWidth));

    qDebug()<<"realWidth="<<realWidth<<" realHeight="<<realHeight;
    qDebug()<<"refWidth="<<refWidth<<" refHeight="<<refHeight;
    qDebug()<<"devicePixelRatio="<<QGuiApplication::primaryScreen()->devicePixelRatio();
    qDebug()<<"ratio="<<resultRatio;
}

void ScalingRatioWrapper::updateScaleChildrens()
{
    qDebug()<<"ScalingRatioWrapper::updateScaleChildrens()";

    QObjectList childrens = this->children();

    QObjectList listItem;
    foreach (auto children, childrens) {
        //children->setProperty("x", children->property("x").toReal()*resultRatio);
        qDebug()<<children;
        qDebug()<<children->property("x");
    }
}

void ScalingRatioWrapper::gameplayStartJS()
{
#ifdef Q_OS_WASM
    /*emscripten::val location = emscripten::val::global("location");
    auto host = location["hostname"].as<std::string>();
    auto port = location["port"].as<std::string>();
    qDebug()<<"host:"<<host<<" port:"<<port;

    emscripten_run_script("alert('hi')");*/

    emscripten_run_script("window.CrazyGames.SDK.game.gameplayStart();");
#endif
}

void ScalingRatioWrapper::gameplayStopJS()
{
#ifdef Q_OS_WASM
    emscripten_run_script("window.CrazyGames.SDK.game.gameplayStop();");
#endif
}

void ScalingRatioWrapper::startVideoAdsJS()
{
#ifdef Q_OS_WASM
    emscripten_run_script("window.CrazyGames.SDK.ad.requestAd('midgame', callbacksVideoAds);");
#endif
}
