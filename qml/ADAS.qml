import QtQuick 2.0
import QtMultimedia 5.12

Item {
    //id: adas
    height: parent.height * 0.3
    width: parent.width * 0.4
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: parent.height * -0.05
    //visible: valueSource.adas

    Rectangle{
        id: adas_background
        width: parent.height * 2.2
        height: parent.height * 0.8
        anchors.centerIn: parent
        color: "black"
        visible: false
    }
    /*Image {
        id: adas_background_static
        source: "qrc:/images/adas/adas_background_static.png"
        width: parent.height * 2.2
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        //anchors.verticalCenterOffset: parent.height * 0
    }
    Image {
        id:adas_background_dynamic
        source: "qrc:/images/adas/adas_background_dynamic.png"
        width: adas_background_static.width * 1.1
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * 0.01 * valueSource.ego_veh_hori_offset
        anchors.bottom: adas_background_static.bottom

    }*/
    Image {
        id: lines_white
        source: "qrc:/images/adas/lines_white.png"
        visible: true//valueSource.drive_mode === 0?true:false
        width: parent.height * 1.8
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * 0.01 * valueSource.ego_veh_hori_offset
        anchors.top: parent.top
        //anchors.topMargin: parent.height * 0.08
    }
    Image {
        id: lines_green
        source: "qrc:/images/adas/lines_green.png"
        visible: valueSource.lka_on//valueSource.acc_far||valueSource.acc_mid||valueSource.acc_short
        width: parent.height * 1.8
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * 0.01 * valueSource.ego_veh_hori_offset
        anchors.top: parent.top
        //anchors.topMargin: parent.height * 0.08
    }
    Image {
        id: ldw_left
        opacity: 0
        source: "qrc:/images/adas/LDW_left.png"
        visible: valueSource.ego_veh_hori_offset > 10
        width: parent.height * 1.8
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * 0.01 * valueSource.ego_veh_hori_offset
        anchors.top: parent.top
        onVisibleChanged: {
            if(ldw_left.visible)alertLDW.play();
            else alertLDW.stop();
        }

        SequentialAnimation{
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                target: ldw_left
                property: "opacity"
                to: 1
                duration: 200
            }
            NumberAnimation {
                target: ldw_left
                property: "opacity"
                to: 0
                duration: 200
            }
        }
    }
    Image {
        id: ldw_right
        opacity: 0
        source: "qrc:/images/adas/LDW_right.png"
        visible: valueSource.ego_veh_hori_offset < -10
        width: parent.height * 1.8
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * 0.01 * valueSource.ego_veh_hori_offset
        anchors.top: parent.top
        onVisibleChanged: {
            if(ldw_right.visible)alertLDW.play();
            else alertLDW.stop();
        }
        SequentialAnimation{
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                target: ldw_right
                property: "opacity"
                to: 1
                duration: 200
            }
            NumberAnimation {
                target: ldw_right
                property: "opacity"
                to: 0
                duration: 200
            }
        }
    }
    SoundEffect{
        id:alertLDW
        loops: Animation.Infinite
        source: "qrc:/sounds/alert.wav"
    }

    Item {
        id: arrays
        visible: true
        height: parent.height
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * 0.01 * valueSource.ego_veh_hori_offset
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height * 0.01
        Timer {
            id: arrayTimer
            interval: 600
            running: true
            repeat: true
            onTriggered: {
                array0.visible = !array0.visible
                array1Timer.running = true
                array2Timer.running = true
            }
        }
        Timer{
            id: array1Timer
            interval: 50
            running: false
            repeat: false
            onTriggered: array1.visible = !array1.visible
        }
        Timer{
            id: array2Timer
            interval: 100
            running: false
            repeat: false
            onTriggered: array2.visible = !array2.visible
        }
        Item {
            id: array0
            visible: false
            height: parent.height
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Image {
                source: "qrc:/images/adas/array0.png"
                visible: valueSource.acc_far||valueSource.acc_mid||valueSource.acc_short
                width: parent.height * 0.6
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.52
            }
        }

        Item {
            id: array1
            visible: false
            height: parent.height
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Image {
                source: "qrc:/images/adas/array1.png"
                visible: valueSource.acc_far||valueSource.acc_mid
                width: parent.height * 0.43
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.43
            }
        }

        Item {
            id: array2
            visible: false
            height: parent.height
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Image {
                source: "qrc:/images/adas/array2.png"
                visible: valueSource.acc_far
                width: parent.height * 0.3
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.36
            }
        }
    }
    Image {
        id: target_far
        source: "qrc:/images/adas/target_white.png"
        visible: valueSource.acc_far && (valueSource.acc_state>>1)
        width: parent.height * 0.28
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * 0.01 * valueSource.ego_veh_hori_offset
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.18
    }
    Image {
        id: target_mid
        source: "qrc:/images/adas/target_white.png"
        visible: valueSource.acc_mid && (valueSource.acc_state>>1)
        width: parent.height * 0.36
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * 0.01 * valueSource.ego_veh_hori_offset
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.21
    }
    Image {
        id: target_short
        source: "qrc:/images/adas/target_white.png"
        visible: valueSource.acc_short && (valueSource.acc_state>>1)
        width: parent.height * 0.47
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * 0.01 * valueSource.ego_veh_hori_offset
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.24
    } 
    Image {
        id: target_aeb
        source: "qrc:/images/adas/target_white.png"
        visible: valueSource.aeb_active
        width: parent.height * 1.4
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.4
    }
    /*Image {
        id: fog
        source: "qrc:/images/adas/fog.png"
        width: adas_background_static.width
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
    }*/
//    Image {
//        id: ego_vehicle
//        source: "qrc:/images/adas/ego_vehicle.png"
//        width: lines_white.width//adas_background_static.width
//        fillMode: Image.PreserveAspectFit
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.top: parent.top
//        anchors.topMargin: parent.height * 0.5
//    }
   /* Image {
        id: steering_whl
        source: "qrc:/images/adas/steering_whl.png"
        width: parent.height * 0.66
        height: width
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.61
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.height * -0.52
        rotation: valueSource.str_whl_ang

    }*/
    Item {
        id: aeb
        visible: false
        height: parent.height
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Timer {
            id: aebTimer
            interval: 200
            running: valueSource.aeb_active
            repeat: true
            onTriggered: {
                parent.visible = !parent.visible
            }
        }
        Timer {
            interval: 200
            running: valueSource.aeb_active==1
            repeat: true
            onTriggered: {
                valueSource.beepSound = !valueSource.beepSound
                if(valueSource.beepSound)beep.play()
                else beep.stop()
            }
        }
        Timer {
            interval: 100
            running: valueSource.aeb_active==2
            repeat: true
            onTriggered: {
                valueSource.beepSound = !valueSource.beepSound
                if(valueSource.beepSound)beep.play()
                else beep.stop()
            }
        }
        Timer {
            interval: 50
            running: valueSource.aeb_active==3||valueSource.aeb_active==4
            repeat: true
            onTriggered: {
                valueSource.beepSound = !valueSource.beepSound
                if(valueSource.beepSound)beep.play()
                else beep.stop()
            }
        }
        Timer {
            interval: 25
            running: false//valueSource.aeb_active==4
            repeat: true
            onTriggered: {
                valueSource.beepSound = !valueSource.beepSound
                if(valueSource.beepSound)beep.play()
                else beep.stop()
            }
        }
        Image {
            id: aebimage
            source: "qrc:/images/adas/alertAEB.png"
            visible: valueSource.aeb_active
            width: parent.height
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.5
        }
        SoundEffect{
            id:beep
            source: "qrc:/sounds/beep.wav"
        }
    }
}

