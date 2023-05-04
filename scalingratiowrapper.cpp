#include "scalingratiowrapper.h"

ScalingRatioWrapper::ScalingRatioWrapper(QObject *parent)
    : QObject{parent}
{
    qDebug()<<"ScalingRatioWrapper::ScalingRatioWrapper author:"<<m_author;
    ratio = 1;
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

qreal ScalingRatioWrapper::getRefWidth()
{
    return refWidth;
}

qreal ScalingRatioWrapper::getRefHeight()
{
    return refHeight;
}


void ScalingRatioWrapper::calculateRatio()
{
    qDebug()<<"ScalingRatioWrapper::calculateRatio()";

    QRect rect = QGuiApplication::primaryScreen()->geometry();
    qreal height = qMax(rect.width(), rect.height());
    qreal width = qMin(rect.width(), rect.height());
    //qreal dpi = QGuiApplication::primaryScreen()->logicalDotsPerInch();
    ratio = qMin(height/refHeight, width/refWidth);
    //m_ratioFont = qMin(height*refDpi/(dpi*refHeight), width*refDpi/(dpi*refWidth));

    qDebug()<<"ratio="<<ratio;
}
