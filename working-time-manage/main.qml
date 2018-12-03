import QtQuick 2.9

Item {
    // Property
    width: 300
    height: 400
    property int hh: 0
    property int mm: 0
    property int ss: 0
    // Fuction
    function updateTime()
    {
        if (ss++ == 60) {
            ss = 0
            if(mm++ == 60) {
                mm = 0
                hh++;
            }
        }
    }
    // Component
    ButtonText {
        y: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: timerId.running ? "PAUSE" : "START"
        onBtnClicked: {
            if (ss == 0 && hh == 0 && mm == 0)
            {
                AppMain.startTimer()
            }
            if (timerId.running) {
                timerId.stop()
            }
            else {
                timerId.start()
            }
        }
    }
    ButtonText {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "STOP"
        onBtnClicked: {
            timerId.stop()
            var timeVal = hh.toString()+":"+mm.toString()
            AppMain.stopTimer(timeVal)
            console.log(timeVal)
            hh = 0
            mm = 0
            ss = 0
        }
    }
    Text {
        id: timeText
        text: hh + " : " + mm + " <font size='1'>" + ss + "</font>"
        font.pixelSize: 60
        anchors.centerIn: parent

    }
    Timer {
        id: timerId
        interval: 1000
        repeat: true
        onTriggered: {
            updateTime()
        }
    }
}
