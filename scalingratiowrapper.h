#ifndef SCALINGRATIOWRAPPER_H
#define SCALINGRATIOWRAPPER_H

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <QGuiApplication>
#include <QScreen>

#include <QDebug>

class ScalingRatioWrapper : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
//    Q_PROPERTY(QDateTime creationDate READ creationDate WRITE setCreationDate NOTIFY creationDateChanged)

    Q_PROPERTY(qreal refWidth READ getRefWidth WRITE setRefWidth NOTIFY refWidthChanged)
    Q_PROPERTY(qreal refHeight READ getRefHeight WRITE setRefHeight NOTIFY refHeightChanged)
    QML_ELEMENT
public:
    explicit ScalingRatioWrapper(QObject *parent = nullptr);

    void calculateRatio();
    void calculateRatio(qreal refWidth, qreal refHeight);
    void calculateRatio(qreal refWidth, qreal refHeight, qreal realWidth, qreal realHeight);

    void setRefWidth(qreal value);
    void setRefHeight(qreal value);

    qreal getRefWidth();
    qreal getRefHeight();


    void setAuthor(const QString &a) {
        qDebug()<<"setAuthor() a="<<a;
        if (a != m_author) {
            m_author = a;
            emit authorChanged();
        }
    }

    QString author() const {
        qDebug()<<"getAuthor() a="<<m_author;
        return m_author;
    }
private:
    QString m_author;

    qreal refWidth;
    qreal refHeight;

    qreal ratio;

signals:
    void authorChanged();

    void refWidthChanged();
    void refHeightChanged();

};

#endif // SCALINGRATIOWRAPPER_H
