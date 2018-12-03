#ifndef APPMAIN_H
#define APPMAIN_H
#include <QQuickView>
#include <QQuickItem>
#include <QQmlContext>
#include <QObject>
#include <QDateTime>

enum ADD_TIME {
    START = 0,
    END
};

class AppMain : public QObject
{    
    Q_OBJECT
private:
    QQuickView view;
    bool isStarted;
public:
    explicit AppMain(QObject *parent = nullptr);
    ~AppMain();
    Q_INVOKABLE void startTimer();
    Q_INVOKABLE void stopTimer(QString time);
private:
    void addTime(ADD_TIME add_time_type);
};

#endif // APPMAIN_H
