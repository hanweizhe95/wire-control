import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

Window {
    id: root
    visible: true
    width: Screen.width//1150
    height: Screen.height//600

    color: "#161616"
    title: "Volkswagen Wire Control Test"

    ValueSource {
        id: valueSource
    }

    property var oldPos:0
    //property var zoom: valueSource.zoom
    property var hori_offset: valueSource.zoom?-60:0
    property var vert_offset: valueSource.zoom?500:0
    Image {
        id: background_blur
        source: "qrc:/images/background_blur.png"
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }
    Image {
        id: background
        source: "qrc:/images/control/background.png"
        height: Math.min(root.width, root.height)*(2*valueSource.zoom+1)
        width: height * 1.317
        anchors.centerIn: parent
        anchors.verticalCenterOffset: vert_offset
        anchors.horizontalCenterOffset: hori_offset
        //fillMode: Image.PreserveAspectFit

        Button {
            id: engine_start_stop
            height: parent.height * 0.08
            width: height
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.44
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 0.88

            style: ButtonStyle{
                background: Image {
                    source: valueSource.engine_start == false?"qrc:/images/control/engine_stop.png":"qrc:/images/control/engine_start.png"
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                }
            }
            onClicked: {
                valueSource.engine_start = !valueSource.engine_start
            }
        }

        Button {
            id: epb
            height: parent.height * 0.09
            width: height
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.91
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 1.2

            style: ButtonStyle{
                        background: Image {
                            source: valueSource.epb_on?"qrc:/images/control/epb_on.png":"qrc:/images/control/epb_off.png"
                            anchors.centerIn: parent
                            fillMode: Image.PreserveAspectFit
                        }
            }
            onClicked: {
                valueSource.epb_on = !valueSource.epb_on
            }
        }

        Image {
            id: dashboard
            source: "qrc:/images/control/dashboard.png"
            width: steer_wheel.width * 0.7
            height: width * 0.3
            anchors.horizontalCenter: steer_wheel.horizontalCenter
            anchors.verticalCenter: steer_wheel.verticalCenter
            anchors.verticalCenterOffset: steer_wheel.height * -0.22
        }
        Dashboard{

            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.21
            anchors.horizontalCenter: steer_wheel.horizontalCenter
        }
        Image {
            id:light_ctl_bar
            source: "qrc:/images/control/light_switch.png"
            height: parent.height * 0.65
            width: height
            anchors.horizontalCenter: steer_wheel.horizontalCenter
            anchors.verticalCenter: steer_wheel.verticalCenter
            rotation: 15 * valueSource.turn_Indicator
        }
        Image {
            id: light_ctl_bar_hold
            source: "qrc:/images/control/light_switch_hold.png"
            height: light_ctl_bar.height
            width: light_ctl_bar.width
            anchors.horizontalCenter: steer_wheel.horizontalCenter
            anchors.verticalCenter: steer_wheel.verticalCenter
            rotation: light_ctl_bar.rotation
            visible: valueSource.add_Indicator!=0
        }

        Image {
            id: brake_img
            source: "qrc:/images/control/brake_unpressed.png"
            height: parent.height * (0.06 + valueSource.deceleration/200)
            width: parent.height * 0.08
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.65
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 0.65
            MouseArea{
                width: parent.width
                height: width
                anchors.top: parent.top
                anchors.left: parent.left

                property var pos1
                onPressed: {
                    //brake_img.source = "qrc:/images/control/brake_pressed.png"
                    pos1 = mouseY
                    mouse.accepted = true
                }
                onMouseYChanged: {
                    if(valueSource.deceleration>0){
                        valueSource.deceleration = 0
                    }
                    else if(valueSource.deceleration<-5){
                        valueSource.deceleration = -5
                    }
                    else
                        valueSource.deceleration = (pos1 - mouseY)*0.1
                }
                onReleased: {
                    valueSource.deceleration = 0
                    //brake_img.source = "qrc:/images/control/brake_unpressed.png"
                }
            }
        }
        Image {
            id: brake_pressed_img
            source: "qrc:/images/control/brake_pressed.png"
            width: brake_img.width
            height: brake_img.height
            anchors.top: brake_img.top
            anchors.left: brake_img.left
            visible: valueSource.deceleration<0
        }

        Image {
            id: throttle_img
            source: "qrc:/images/control/throttle_unpressed.png"
            height: parent.height * (0.2 - valueSource.throttle/5000)
            width: parent.height * 0.081
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.2
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 0.75

            MouseArea{
                width: parent.width
                height: width * 5
                anchors.bottom: parent.bottom
                anchors.left: parent.left

                property var pos1
                onPressed: {
                    //throttle_img.source = "qrc:/images/control/throttle_pressed.png"
                    pos1 = mouseY
                    mouse.accepted = true
                }
                onMouseYChanged: {
                    if(valueSource.throttle>250){
                        valueSource.throttle = 250
                    }
                    else if(valueSource.throttle<0){
                        valueSource.throttle = 0
                    }
                    else
                        valueSource.throttle = (-pos1 + mouseY)*2
                }
                onReleased: {
                    valueSource.throttle = 0
                    //throttle_img.source = "qrc:/images/control/throttle_unpressed.png"
                }
            }
        }
        Image {
            id: throttle_pressed_img
            source: "qrc:/images/control/throttle_pressed.png"
            visible: valueSource.throttle>0
            anchors.bottom: throttle_img.bottom
            anchors.left: throttle_img.left
            width: throttle_img.width
            height: throttle_img.height
        }

        Image {
            id: steer_wheel
            source: "qrc:/images/control/steering_whl.png"
            height: parent.height * 0.54
            width: height
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.14
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 0.41
            rotation: valueSource.str_whl_ang
            Image {
                height: parent.height * 0.3
                width: height * 1.443
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: parent.height * 0.07
                anchors.horizontalCenter: parent.horizontalCenter
                visible: valueSource.horn_on
                source: "qrc:/images/control/horn_pressed.png"
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                id: horn
                height: parent.height * 0.3
                width: height * 1.443
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: parent.height * 0.07
                anchors.horizontalCenter: parent.horizontalCenter
                onPressed:valueSource.horn_on = true
                onReleased: valueSource.horn_on = false
            }
        }

        Item {
            id: lift
            height: parent.height * 0.2
            width: height * 0.5
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.6
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 0.35
            Image {
                id: lift_hold
                source: "qrc:/images/control/lift_hold.png"
                visible: valueSource.lift_stat === 0
                anchors.centerIn: parent
                width: parent.width
                fillMode: Image.PreserveAspectFit
            }
            Image {
                id: lift_up
                source: "qrc:/images/control/lift_up.png"
                visible: valueSource.lift_stat === 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: lift_hold.bottom
                width: parent.width
                fillMode: Image.PreserveAspectFit
            }
            Image {
                id: lift_down
                source: "qrc:/images/control/lift_down.png"
                visible: valueSource.lift_stat === -1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: lift_hold.top
                width: parent.width
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                anchors.fill: parent
                property var pos1

                onPressed: {
                    pos1 = mouseY
                    mouse.accepted = true
                }

                onReleased: {
                    if((pos1 - mouseY) > 10 && valueSource.lift_stat<1){
                        valueSource.lift_stat += 1
                    }
                    else if((mouseY - pos1) > 10 && valueSource.lift_stat>-1){
                        valueSource.lift_stat -= 1
                    }
                }
            }
        }
        Image {
            id: gear
            visible: valueSource.add_gear == 0
            source: "qrc:/images/control/gear.png"
            height: parent.height * 0.2
            width: height * 0.6825
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.68
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 1.095
        }
        Image {
            id: gear_up
            visible: valueSource.add_gear == 1
            source: "qrc:/images/control/gear.png"
            height: parent.height * 0.2
            width: height * 0.6825
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.67
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 1.09
        }
        Image {
            id: gear_down
            visible: valueSource.add_gear == -1
            source: "qrc:/images/control/gear.png"
            height: parent.height * 0.2
            width: height * 0.6825
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.69
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 1.1
        }
        Rectangle{
            id:mouseArea_gear
            color: Qt.rgba(1,0,0,0)
            height: gear.height
            width: gear.width
            anchors.horizontalCenter: gear.horizontalCenter
            anchors.verticalCenter: gear.verticalCenter
            MouseArea{
                anchors.fill: parent
                property var pos1

                onPressed: {
                    pos1 = mouseY
                    mouse.accepted = true
                }
                onMouseYChanged: {
                    if((pos1 - mouseY) > 10 ){
                        valueSource.add_gear = 1;
                    }
                    else if((mouseY - pos1) > 10 ){
                        valueSource.add_gear = -1;
                    }
                }
                onReleased: {
                    valueSource.add_gear = 0;
                    if((pos1 - mouseY) > 10 && valueSource.gear_stat<2){
                        valueSource.gear_stat += 1
                    }
                    else if((mouseY - pos1) > 10 && valueSource.gear_stat>0){
                        valueSource.gear_stat -= 1
                    }
                }
            }
        }
        Rectangle{
            id:mouseArea_top
            color: Qt.rgba(1,0,0,0)
            height: steer_wheel.height * 0.25
            width: steer_wheel.width
            anchors.horizontalCenter: steer_wheel.horizontalCenter
            anchors.top: steer_wheel.top
            MouseArea{

                anchors.fill: parent
                property var pos1
                property var posChange

                onPressed: {
                    pos1 = mouseX
                    mouse.accepted = true
                }
                onMouseXChanged: {
                    posChange = (mouseX - pos1)*0.1 + oldPos
                    if(posChange>valueSource.str_whl_ang_max){
                        valueSource.str_whl_ang = valueSource.str_whl_ang_max
                    }
                    else if(posChange<-valueSource.str_whl_ang_max){
                        valueSource.str_whl_ang = -valueSource.str_whl_ang_max
                    }
                    else
                        valueSource.str_whl_ang = posChange

                }
                onReleased: {
                    oldPos = valueSource.str_whl_ang
                }
            }
        }
        Rectangle{
            id:mouseArea_bottom
            color: Qt.rgba(1,0,0,0)
            height: steer_wheel.height * 0.25
            width: steer_wheel.width
            anchors.horizontalCenter: steer_wheel.horizontalCenter
            anchors.bottom: steer_wheel.bottom
            anchors.bottomMargin: steer_wheel.height * 0.05
            MouseArea{

                anchors.fill: parent
                property var pos1
                property var posChange

                onPressed: {
                    pos1 = mouseX
                    mouse.accepted = true
                }
                onMouseXChanged: {
                    posChange = (pos1 - mouseX)*0.1 + oldPos
                    if(posChange>valueSource.str_whl_ang_max){
                        valueSource.str_whl_ang = valueSource.str_whl_ang_max
                    }
                    else if(posChange<-valueSource.str_whl_ang_max){
                        valueSource.str_whl_ang = -valueSource.str_whl_ang_max
                    }
                    else
                        valueSource.str_whl_ang = posChange

                }
                onReleased: {
                    oldPos = valueSource.str_whl_ang
                }
            }
        }
        Rectangle{
            id:mouseArea_left
            color: Qt.rgba(1,0,0,0)
            height: steer_wheel.height * 0.5
            width: steer_wheel.width * 0.25
            anchors.verticalCenter: steer_wheel.verticalCenter
            anchors.left: steer_wheel.left
            MouseArea{

                anchors.fill: parent
                property var pos1
                property var posChange

                onPressed: {
                    pos1 = mouseY
                    mouse.accepted = true
                }
                onMouseYChanged: {
                    posChange = (pos1 - mouseY)*0.1 + oldPos
                    if(posChange>valueSource.str_whl_ang_max){
                        valueSource.str_whl_ang = valueSource.str_whl_ang_max
                    }
                    else if(posChange<-valueSource.str_whl_ang_max){
                        valueSource.str_whl_ang = -valueSource.str_whl_ang_max
                    }
                    else
                        valueSource.str_whl_ang = posChange

                }
                onReleased: {
                    oldPos = valueSource.str_whl_ang
                }
            }
        }
        Rectangle{
            id:light_bar
            color: Qt.rgba(1,0,0,0)
            height: steer_wheel.height * 0.5
            width: steer_wheel.width * 0.25
            anchors.verticalCenter: steer_wheel.verticalCenter
            anchors.right: steer_wheel.left
            MouseArea{
                anchors.fill: parent
                property var pos1

                onPressed: {
                    light_ctl_bar.source = "qrc:/images/control/light_switch_hold.png"
                    pos1 = mouseY
                    mouse.accepted = true
                }

                onReleased: {
                    light_ctl_bar.source = "qrc:/images/control/light_switch.png"
                    if((pos1 - mouseY) > 10 && valueSource.turn_Indicator < 1){
                        valueSource.turn_Indicator += 1;
                    }
                    else if((mouseY - pos1) > 10 && valueSource.turn_Indicator > -1){
                        valueSource.turn_Indicator -= 1;
                    }
                }
            }
        }

    }



    Button{
        x:10
        y:20
        width: 100
        height: 50
        id:zoom_in
        text: qsTr("缩小")
        onClicked: {
            //hori_offset = 0
            //vert_offset = 0
            valueSource.zoom = false
        }
    }
    Button{
        x:10
        y:100
        width: 100
        height: 50
        id:zoom_out
        text: qsTr("放大")
        onClicked: {
            //vert_offset = 500
            //hori_offset = -60
            valueSource.zoom = true
        }
    }
    Button{
        x:10
        y:180
        width: 100
        height: 50
        id:manual_drive
        text: qsTr("人工驾驶")
        onClicked: {
            valueSource.driveMode = 0
        }
    }
    Button{
        x:10
        y:260
        width: 100
        height: 50
        id:auto_drive
        text: qsTr("自动驾驶")
        onClicked: {
            valueSource.driveMode = 1
        }
    }
    Button{
        x:10
        y:340
        width: 100
        height: 50
        id:show_time
        text: qsTr("v(>o<)v")
        onClicked: {
            valueSource.showTime = 1
        }
    }
    Dynamic{}
    Can{}
}
