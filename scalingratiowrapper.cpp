#include "scalingratiowrapper.h"

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

    QRect rect = QGuiApplication::primaryScreen()->geometry();
    qreal height = qMax(rect.width(), rect.height());
    qreal width = qMin(rect.width(), rect.height());
    //qreal dpi = QGuiApplication::primaryScreen()->logicalDotsPerInch();
    resultRatio = qMin(height/refHeight, width/refWidth);
    //m_ratioFont = qMin(height*refDpi/(dpi*refHeight), width*refDpi/(dpi*refWidth));

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

    qDebug()<<"ratio="<<resultRatio;
}

void ScalingRatioWrapper::calculateRatioRefTo(qreal refWidth, qreal refHeight, qreal realWidth, qreal realHeight)
{
    qDebug()<<"ScalingRatioWrapper::calculateRatioRefTo()";

    //qreal dpi = QGuiApplication::primaryScreen()->logicalDotsPerInch();
    resultRatio = qMin(realHeight/refHeight, realWidth/refWidth);
    //m_ratioFont = qMin(height*refDpi/(dpi*refHeight), width*refDpi/(dpi*refWidth));

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
