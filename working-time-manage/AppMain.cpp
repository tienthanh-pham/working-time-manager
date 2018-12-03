#include "AppMain.h"

AppMain::AppMain(QObject *parent)
    : isStarted(false)
{
    view.setSource(QUrl("qrc:/main.qml"));
    view.rootContext()->setContextProperty("AppMain", this);
    view.show();
}

AppMain::~AppMain()
{
    if (isStarted) addTime(ADD_TIME::END);
}

void AppMain::startTimer()
{
    qDebug() << "StatTimer Called";
    addTime(ADD_TIME::START);
    isStarted = true;
}

void AppMain::stopTimer(QString time)
{
    qDebug() << "StopTimer Called" << time;
    addTime(ADD_TIME::END);
    isStarted = false;
}

void AppMain::addTime(ADD_TIME add_time_type)
{
    QFile log("working-time-log.txt");
    if (!log.open(QIODevice::Append | QIODevice::Text)) {
        return;
    }
    QTextStream out(&log);

    if (add_time_type == ADD_TIME::START) {
        QDate date;
        out << date.currentDate().day() << "/" << date.currentDate().month() << "\t";
    }

    QTime time;
    out << time.currentTime().toString();

    if (add_time_type == ADD_TIME::START) {
        out << "\t";
    } else {
        out << "\n";
    }
    log.close();
}
