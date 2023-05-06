#ifndef SCALINGRATIOWRAPPER_H
#define SCALINGRATIOWRAPPER_H

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <QGuiApplication>
#include <QScreen>
#include <QQuickItem>

#include <QDebug>

class ScalingRatioWrapper : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(qreal refWidth READ getRefWidth WRITE setRefWidth NOTIFY refWidthChanged)
    Q_PROPERTY(qreal refHeight READ getRefHeight WRITE setRefHeight NOTIFY refHeightChanged)
    Q_PROPERTY(qreal ratio READ getRatio WRITE setRatio NOTIFY ratioChanged)
    QML_ELEMENT
public:
    explicit ScalingRatioWrapper(QQuickItem *parent = nullptr);

    Q_INVOKABLE void calculateRatio();
    Q_INVOKABLE void calculateRatioRef(qreal refWidth, qreal refHeight);
    Q_INVOKABLE void calculateRatioRefTo(qreal refWidth, qreal refHeight, qreal realWidth, qreal realHeight);
    Q_INVOKABLE void updateScaleChildrens();

    void setRefWidth(qreal value);
    void setRefHeight(qreal value);
    void setRatio(qreal value);

    qreal getRefWidth();
    qreal getRefHeight();
    qreal getRatio();

private:
    qreal refWidth;
    qreal refHeight;

    qreal resultRatio;

signals:
    void refWidthChanged();
    void refHeightChanged();
    void ratioChanged();

};

#endif // SCALINGRATIOWRAPPER_H
