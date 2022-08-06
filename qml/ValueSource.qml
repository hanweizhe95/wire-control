/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import Can0MoveToThread 1.0
import Can1MoveToThread 1.0
import XboxMoveToThread 1.0



Item {
    id: valueSource


    property bool onCAN: true
    property bool zoom: false
    property real kph: 0
    property real rpm: 0

    property bool start: true
    property real temp: 25
    property real canid
    property real milage: 10000
    property real longi_aclrtn: 0
    property real latrl_aclrtn: 0
    property real g_value: Math.sqrt(latrl_aclrtn*latrl_aclrtn+longi_aclrtn*longi_aclrtn)/9.8
    property string date
    property string time

    property real fuel: 0.2
    property real waterTemp: 0.6
    property real pressureFA: 0
    property real pressureRA: 0
    property int leftTurnSignal: 0//gear == "P" && !start ? randomDirection() : -1
    property int rightTurnSignal: 0//gear == "P" && !start ? randomDirection() : -1
    property real liftAng: 0

    //control parameters
    property bool showTime: false
    property bool engine_start: false
    property bool epb_on: false
    property bool horn_on: false
    property bool lowBeam_on: false
    property bool highBeam_on: false
    property bool fog_on: false
    property bool back_on: false
    property bool leftIndicator: false
    property bool rightIndicator: false
    property real turn_Indicator: 0
    property real add_Indicator: 0
    property real turnIndicator: {
        if(turn_Indicator==0){return 0}
        if(turn_Indicator==1){return 2}
        if(turn_Indicator==-1){return 1}
    }
    property real wiperIndicator: 0
    property real wiperAdder: 0
    property bool wiperCleaner: false
    property real lift_stat: 0
    property real liftStat: {
        if (lift_stat == 0){return 0}
        if (lift_stat == 1){return 1}
        if (lift_stat == -1){return 2}
    }
    property real gear_stat: 1
    property real add_gear: 0
    property real gearStat:{
        if (gear_stat == 0){return 2}
        if (gear_stat == 1){return 3}
        if (gear_stat == 2){return 1}
        else{return 0}
    }

    property real deceleration: 0
    property bool driveMode: false
    property real throttle: 0
    property real str_whl_ang: 0 //-450~450
    property real str_whl_ang_max: 180
    property real str_ang: str_whl_ang * 30/str_whl_ang_max
    property real str_ang_fl: 30
    property real wheelbase: 6
    property real frontTrack: 2.8
    property real str_ang_fr: 30 //180/Math.PI*Math.atan(wheelbase/(wheelbase/Math.tan(str_ang_fl*Math.PI/180)-frontTrack))

    //ADAS parameters
    property real drive_mode: 0
    property real acc_state: 0
    property real aeb_active: 0
    property bool acc_far: drive_mode === 1?true:false
    property bool acc_mid: drive_mode === 2?true:false
    property bool acc_short: drive_mode === 3?true:false
    property real ego_veh_hori_offset: 0
    property bool lka_on: false
    property bool rvv_on: false
    property real rvv_spd: 10
    property bool rvv_spd_up: false
    property bool rvv_spd_down: false
    property bool beepSound: false

    //Obstacels under Cartesian coordinates
//    property var obstacles_x: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//    property var obstacles_y: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//    property var obstacles_flag: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    property real obstacles_x: 0
    property real obstacles_y: 0

    property real obstacle_0_x: 0
    property real obstacle_1_x: 0
    property real obstacle_2_x: 0
    property real obstacle_3_x: 0
    property real obstacle_4_x: 0
    property real obstacle_5_x: 0
    property real obstacle_6_x: 0
    property real obstacle_7_x: 0
    property real obstacle_8_x: 0
    property real obstacle_9_x: 0
    property real obstacle_10_x: 0
    property real obstacle_11_x: 0
    property real obstacle_12_x: 0
    property real obstacle_13_x: 0
    property real obstacle_14_x: 0
    property real obstacle_15_x: 0
    property real obstacle_16_x: 0
    property real obstacle_17_x: 0
    property real obstacle_18_x: 0
    property real obstacle_19_x: 0
    property real obstacle_20_x: 0
    property real obstacle_21_x: 0
    property real obstacle_22_x: 0
    property real obstacle_23_x: 0
    property real obstacle_24_x: 0
    property real obstacle_25_x: 0
    property real obstacle_26_x: 0
    property real obstacle_27_x: 0
    property real obstacle_28_x: 0
    property real obstacle_29_x: 0
    property real obstacle_30_x: 0
    property real obstacle_31_x: 0

    property real obstacle_0_y: 0
    property real obstacle_1_y: 0
    property real obstacle_2_y: 0
    property real obstacle_3_y: 0
    property real obstacle_4_y: 0
    property real obstacle_5_y: 0
    property real obstacle_6_y: 0
    property real obstacle_7_y: 0
    property real obstacle_8_y: 0
    property real obstacle_9_y: 0
    property real obstacle_10_y: 0
    property real obstacle_11_y: 0
    property real obstacle_12_y: 0
    property real obstacle_13_y: 0
    property real obstacle_14_y: 0
    property real obstacle_15_y: 0
    property real obstacle_16_y: 0
    property real obstacle_17_y: 0
    property real obstacle_18_y: 0
    property real obstacle_19_y: 0
    property real obstacle_20_y: 0
    property real obstacle_21_y: 0
    property real obstacle_22_y: 0
    property real obstacle_23_y: 0
    property real obstacle_24_y: 0
    property real obstacle_25_y: 0
    property real obstacle_26_y: 0
    property real obstacle_27_y: 0
    property real obstacle_28_y: 0
    property real obstacle_29_y: 0
    property real obstacle_30_y: 0
    property real obstacle_31_y: 0

    property bool obstacle_0_flag: false
    property bool obstacle_1_flag: false
    property bool obstacle_2_flag: false
    property bool obstacle_3_flag: false
    property bool obstacle_4_flag: false
    property bool obstacle_5_flag: false
    property bool obstacle_6_flag: false
    property bool obstacle_7_flag: false
    property bool obstacle_8_flag: false
    property bool obstacle_9_flag: false
    property bool obstacle_10_flag: false
    property bool obstacle_11_flag: false
    property bool obstacle_12_flag: false
    property bool obstacle_13_flag: false
    property bool obstacle_14_flag: false
    property bool obstacle_15_flag: false
    property bool obstacle_16_flag: false
    property bool obstacle_17_flag: false
    property bool obstacle_18_flag: false
    property bool obstacle_19_flag: false
    property bool obstacle_20_flag: false
    property bool obstacle_21_flag: false
    property bool obstacle_22_flag: false
    property bool obstacle_23_flag: false
    property bool obstacle_24_flag: false
    property bool obstacle_25_flag: false
    property bool obstacle_26_flag: false
    property bool obstacle_27_flag: false
    property bool obstacle_28_flag: false
    property bool obstacle_29_flag: false
    property bool obstacle_30_flag: false
    property bool obstacle_31_flag: false

    property bool alerts: true
    property bool alertEPB: false
    property bool alertABS: false
    property bool alertBrake: rpm>0?false:true
    property bool alertSeatBelt: false
    property bool alertLowBeamAuto: false
    property bool alertOilPressure: false
    property bool alertAirBag: false
    property bool alertFlatTyre: false
    property bool alertESPon: false
    property bool alertESPoff: false
    property bool alertEOBD: false
    property bool alertOilLevel: false
    property bool alertBattery: false
    property bool alertFootOnBrakePedal: false
    property bool alertLowBeam: false
    property bool alertHighBeam: false
    property bool alertWidthLight: false
    property bool alertFrontFog: false
    property bool alertRearFog: false
    property bool alertWiperAuto: wiperIndicator>0?true:false
    property bool alertFuelEmpty: false
    property bool alertWater: false
    property bool alertWaterEmpty: false
    property bool alertWornOutBrakePad: false
    property bool alertWaterInDieselFilter: false
    property bool alertSTTon: false
    property bool alertLightBulbBlown: false
    property bool alertLFDoorOpen: false
    property bool alertRFDoorOpen: false
    property bool alertLRDoorOpen: false
    property bool alertRRDoorOpen: false
    property bool alertTrunkOpen: false
    property bool alertLDWLeft: false
    property bool alertLDWRight: false
    property string gear: {
        var g;
        if (kph == 0 && animation.running) {
            return "P";
        }
        if (kph < 30 && animation.running) {
            return "D1";
        }
        if (kph < 50 && animation.running) {
            return "D2";
        }
        if (kph < 80 && animation.running) {
            return "D3";
        }
        if (kph < 120 && animation.running) {
            return "D4";
        }
        if (kph < 160 && animation.running) {
            return "D5";
        }
        else
            return "0";
    }

    /*   function randomDirection() {
           return Math.random() > 0.5 ? Qt.LeftArrow : Qt.RightArrow;
       }
   */

    property real circleRotation: 45
    NumberAnimation{
        target: valueSource
        property: "circleRotation"
        easing.type: Easing.InOutSine
        from: 45
        to: -360
        duration: 300
        running:!zoom
    }
    NumberAnimation{
        target: valueSource
        property: "circleRotation"
        easing.type: Easing.InOutSine
        from: -360
        to: 45
        duration: 300
        running:zoom
    }
    Item {
        id: showTimer
        property bool trigger_1: false
        property bool trigger_2: false
        property bool trigger_3: false
        property bool trigger_4: false
        property bool trigger_5: false
        property bool trigger_6: false
        property bool trigger_7: false
        property bool trigger_8: false
        property bool trigger_9: false
        property bool trigger_10: false
        property bool trigger_11: false
        property bool trigger_12: false
        property bool trigger_13: false
        property bool trigger_14: false
        property bool trigger_15: false
        property bool trigger_16: false
        property bool trigger_17: false
        property bool trigger_18: false
        property bool trigger_19: false
        property bool trigger_20: false
        property bool trigger_21: false

        Timer{
            interval: 500; running: showTime; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                showTime = false;
                parent.trigger_1 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_1; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_1 = false;
                parent.trigger_2 = true;
            }
        }
        Timer{
            interval: 500; running: parent.trigger_2; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_2 = false;
                parent.trigger_3 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_3; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_3 = false;
                parent.trigger_4 = true;
            }
        }
        Timer{
            interval: 500; running: parent.trigger_4; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_4 = false;
                parent.trigger_5 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_5; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_5 = false;
                parent.trigger_6 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_6; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_6 = false;
                parent.trigger_7 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_7; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_7 = false;
                parent.trigger_8 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_8; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_8 = false;
                parent.trigger_9 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_9; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_9 = false;
                parent.trigger_10 = true;
            }
        }
        Timer{
            interval: 500; running: parent.trigger_10; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_10 = false;
                parent.trigger_11 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_11; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_11 = false;
                parent.trigger_12 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_12; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_12 = false;
                parent.trigger_13 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_13; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_13 = false;
                parent.trigger_14 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_14; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_14 = false;
                parent.trigger_15 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_15; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_15 = false;
                parent.trigger_16 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_16; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_16 = false;
                parent.trigger_17 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_17; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_17 = false;
                parent.trigger_18 = true;
            }
        }
        Timer{
            interval: 500; running: parent.trigger_18; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_18 = false;
                parent.trigger_19 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_19; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_19 = false;
                parent.trigger_20 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_20; repeat: false
            onTriggered: {
                horn_on = true;
                highBeam_on = true;
                lowBeam_on = true;
                fog_on = true;
                parent.trigger_20 = false;
                parent.trigger_21 = true;
            }
        }
        Timer{
            interval: 200; running: parent.trigger_21; repeat: false
            onTriggered: {
                horn_on = false;
                highBeam_on = false;
                lowBeam_on = false;
                fog_on = false;
                parent.trigger_21 = false;
            }
        }
    }

    //vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv//
    /*Keyboard inputs start here*/
    Item{   //TurnIndicator
        anchors.fill: parent
        focus: true
        Keys.onLeftPressed:{
            valueSource.leftTurnSignal =  1
            valueSource.rightTurnSignal =  0
            console.log("left pressed")
        }
        Keys.onRightPressed:{
            valueSource.leftTurnSignal =  0
            valueSource.rightTurnSignal =  1
            console.log("right pressed")
        }
        Keys.onEnterPressed:{

            valueSource.leftTurnSignal =  1
            valueSource.rightTurnSignal =  1
            console.log("enter pressed")
        }
        Keys.onSpacePressed:{
            valueSource.leftTurnSignal = 0
            valueSource.rightTurnSignal =  0
            console.log("space pressed")
        }
        Keys.onTabPressed: {
            valueSource.alerts = !valueSource.alerts
            valueSource.alertLFDoorOpen = !valueSource.alertLFDoorOpen
            valueSource.alertRFDoorOpen = !valueSource.alertRFDoorOpen
            valueSource.alertLRDoorOpen = !valueSource.alertLRDoorOpen
            valueSource.alertRRDoorOpen = !valueSource.alertRRDoorOpen
            valueSource.alertTrunkOpen = !valueSource.alertTrunkOpen
            console.log("TAB pressed")
        }
    }
    /*End of keyboard inputs*/
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//

    Timer{      //GET SYSTEM TIME
        interval: 500; running: true; repeat: true
        onTriggered: {
            date = Qt.formatDate(new Date(),"yyyy年MM月dd日");
            time = Qt.formatDateTime(new Date(),"hh:mm:ss");
        }
    }
    Timer{
        interval: 1000; running: rvv_spd_up||rvv_spd_down; repeat: true
        onTriggered: {
            if(rvv_spd_up)rvv_spd+=5
            else if(rvv_spd_down&&rvv_spd>=5)rvv_spd-=5
        }
    }

    //vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv//
    /*CAN connections start here*/
    Can0MoveToThread{id:can0}
    Connections{
        target: can0
        onDataChanged:{
            switch(can0.id){
            case 0x61:
                drive_mode = can0.byte0 & 0x3
                aeb_active = (can0.byte0>>3)&0x7
                acc_state = can0.byte0>>6
                milage = 0.125*(can0.byte7*16777216+can0.byte6*65536+can0.byte5*256+can0.byte4)
                //kph = 0.01*(can0.byte3*256+can0.byte2)
                break;
            case 0x63:
                rpm = 0.125*(can0.byte4*256+can0.byte3)
                alertEOBD = (can0.byte5&0x7)>>2
                break;
            case 0x65:
                str_ang_fl = (can0.byte1*256+can0.byte0)*0.01-157.5
                str_ang_fr = (can0.byte3*256+can0.byte2)*0.01-157.5
                break;
            case 0x67:
                if((can0.byte0&0x3) == 0){gear="P"}
                if((can0.byte0&0x3) == 1){gear="R"}
                if((can0.byte0&0x3) == 2){gear="D"}
                if((can0.byte0&0x3) == 3){gear="N"}
                break;
            case 0x69:
                alertWornOutBrakePad = can0.byte4&0x1
                alertEPB = can0.byte7&0x1
                longi_aclrtn = can0.byte2*0.1-12.5
                //latrl_aclrtn = can0.byte3*0.1-12.
                break;
            case 0x6B:
                alertHighBeam = can0.byte5>>4
                alertLowBeam = can0.byte5&0xF
                alertLightBulbBlown = can0.byte2>>4
                alertWidthLight = can0.byte4>>4
                leftTurnSignal = can0.byte3&0xF
                rightTurnSignal = can0.byte3>>4
                alertFrontFog = can0.byte6>>4
                break;
            case 0x6D:
                kph = ((can0.byte1*256+can0.byte0)*0.00390625+(can0.byte3*256+can0.byte2)*0.00390625)*0.5
                break;
            case 0x6F:
                waterTemp = can0.byte0 / 160
                break;
            case 0x71:
                liftAng = 0.1*(can0.byte0+can0.byte1*256)
                break;
            case 0x73:
                pressureFA = can0.byte6 * 4
                pressureRA = can0.byte7 * 4
                break;
            case 0x311:
                ego_veh_hori_offset = -(((can0.byte1&0xF)*255+can0.byte0)*0.01-16)
                break;
            }
        }
    }
    Can1MoveToThread{id:can1}
    Connections{
        target: can1
        onDataChanged:{
            switch(can1.id){
            case 0x311:
                ego_veh_hori_offset = -(((can1.byte1&0xF)*255+can1.byte0)*0.01-16)
                break;
            case 0x60b:
                obstacles_x = -((can1.byte2&0x7)*256+can1.byte3)*0.2+204.6
                obstacles_y = (can1.byte1*32+(can1.byte2&0xF8)/8)*0.2-500
                console.log(can1.byte0+":("+obstacles_x+","+obstacles_y+")")
                switch(can1.byte0){
                case 0:
                    obstacle_0_x=obstacles_x
                    obstacle_0_y=obstacles_y
                    obstacle_0_flag=0
                    obstacle_0_flag=1
                    break;
                case 1:
                    obstacle_1_x=obstacles_x
                    obstacle_1_y=obstacles_y
                    obstacle_1_flag=0
                    obstacle_1_flag=1
                    break;
                case 2:
                    obstacle_2_x=obstacles_x
                    obstacle_2_y=obstacles_y
                    obstacle_2_flag=0
                    obstacle_2_flag=1
                    break;
                case 3:
                    obstacle_3_x=obstacles_x
                    obstacle_3_y=obstacles_y
                    obstacle_3_flag=0
                    obstacle_3_flag=1
                    break;
                case 4:
                    obstacle_4_x=obstacles_x
                    obstacle_4_y=obstacles_y
                    obstacle_4_flag=0
                    obstacle_4_flag=1
                    break;
                case 5:
                    obstacle_5_x=obstacles_x
                    obstacle_5_y=obstacles_y
                    obstacle_5_flag=0
                    obstacle_5_flag=1
                    break;
                case 6:
                    obstacle_6_x=obstacles_x
                    obstacle_6_y=obstacles_y
                    obstacle_6_flag=0
                    obstacle_6_flag=1
                    break;
                case 7:
                    obstacle_7_x=obstacles_x
                    obstacle_7_y=obstacles_y
                    obstacle_7_flag=0
                    obstacle_7_flag=1
                    break;
                case 8:
                    obstacle_8_x=obstacles_x
                    obstacle_8_y=obstacles_y
                    obstacle_8_flag=0
                    obstacle_8_flag=1
                    break;
                case 9:
                    obstacle_9_x=obstacles_x
                    obstacle_9_y=obstacles_y
                    obstacle_9_flag=0
                    obstacle_9_flag=1
                    break;
                case 10:
                    obstacle_10_x=obstacles_x
                    obstacle_10_y=obstacles_y
                    obstacle_10_flag=0
                    obstacle_10_flag=1
                    break;
                case 11:
                    obstacle_11_x=obstacles_x
                    obstacle_11_y=obstacles_y
                    obstacle_11_flag=0
                    obstacle_11_flag=1
                    break;
                case 12:
                    obstacle_12_x=obstacles_x
                    obstacle_12_y=obstacles_y
                    obstacle_12_flag=0
                    obstacle_12_flag=1
                    break;
                case 13:
                    obstacle_13_x=obstacles_x
                    obstacle_13_y=obstacles_y
                    obstacle_13_flag=0
                    obstacle_13_flag=1
                    break;
                case 14:
                    obstacle_14_x=obstacles_x
                    obstacle_14_y=obstacles_y
                    obstacle_14_flag=0
                    obstacle_14_flag=1
                    break;
                case 15:
                    obstacle_15_x=obstacles_x
                    obstacle_15_y=obstacles_y
                    obstacle_15_flag=0
                    obstacle_15_flag=1
                    break;
                case 16:
                    obstacle_16_x=obstacles_x
                    obstacle_16_y=obstacles_y
                    obstacle_16_flag=0
                    obstacle_16_flag=1
                    break;
                case 17:
                    obstacle_17_x=obstacles_x
                    obstacle_17_y=obstacles_y
                    obstacle_17_flag=0
                    obstacle_17_flag=1
                    break;
                case 18:
                    obstacle_18_x=obstacles_x
                    obstacle_18_y=obstacles_y
                    obstacle_18_flag=0
                    obstacle_18_flag=1
                    break;
                case 19:
                    obstacle_19_x=obstacles_x
                    obstacle_19_y=obstacles_y
                    obstacle_19_flag=0
                    obstacle_19_flag=1
                    break;
                case 20:
                    obstacle_20_x=obstacles_x
                    obstacle_20_y=obstacles_y
                    obstacle_20_flag=0
                    obstacle_20_flag=1
                    break;
                case 21:
                    obstacle_21_x=obstacles_x
                    obstacle_21_y=obstacles_y
                    obstacle_21_flag=0
                    obstacle_21_flag=1
                    break;
                case 22:
                    obstacle_22_x=obstacles_x
                    obstacle_22_y=obstacles_y
                    obstacle_22_flag=0
                    obstacle_22_flag=1
                    break;
                case 23:
                    obstacle_23_x=obstacles_x
                    obstacle_23_y=obstacles_y
                    obstacle_23_flag=0
                    obstacle_23_flag=1
                    break;
                case 24:
                    obstacle_24_x=obstacles_x
                    obstacle_24_y=obstacles_y
                    obstacle_24_flag=0
                    obstacle_24_flag=1
                    break;
                case 25:
                    obstacle_25_x=obstacles_x
                    obstacle_25_y=obstacles_y
                    obstacle_25_flag=0
                    obstacle_25_flag=1
                    break;
                case 26:
                    obstacle_26_x=obstacles_x
                    obstacle_26_y=obstacles_y
                    obstacle_26_flag=0
                    obstacle_26_flag=1
                    break;
                case 27:
                    obstacle_27_x=obstacles_x
                    obstacle_27_y=obstacles_y
                    obstacle_27_flag=0
                    obstacle_27_flag=1
                    break;
                case 28:
                    obstacle_28_x=obstacles_x
                    obstacle_28_y=obstacles_y
                    obstacle_28_flag=0
                    obstacle_28_flag=1
                    break;
                case 29:
                    obstacle_29_x=obstacles_x
                    obstacle_29_y=obstacles_y
                    obstacle_29_flag=0
                    obstacle_29_flag=1
                    break;
                case 30:
                    obstacle_30_x=obstacles_x
                    obstacle_30_y=obstacles_y
                    obstacle_30_flag=0
                    obstacle_30_flag=1
                    break;
                case 31:
                    obstacle_31_x=obstacles_x
                    obstacle_31_y=obstacles_y
                    obstacle_31_flag=0
                    obstacle_31_flag=1
                    break;
                }
//                obstacles_x[can1.byte0]=((can1.byte2&7)<<8+can1.byte3)*0.2-204.6
//                console.log(can1.byte0,obstacles_x[can1.byte0])
//                obstacles_y[can1.byte0]=(can1.byte1<<5+can1.byte2>>3)*0.2-500
//                obstacles_flag[can1.byte0]=0
//                obstacles_flag[can1.byte0]=1
                break;

            }
        }
    }
    /*End of CAN connections*/
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//

    //vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv//
    /*XBOX coonections start here*/
    XboxMoveToThread{id:xbox}
    Connections{
        target: xbox
        onDataChanged:{
            if (xbox.type == 1)//JS_EVENT_BUTTON
            {
                switch(xbox.number)
                {
                    case 0://XBOX_BUTTON_A:
                        if(xbox.value){lowBeam_on=!lowBeam_on}
                        break;

                    case 1://XBOX_BUTTON_B:
                        if(xbox.value){epb_on = !epb_on}
                        break;

                    case 2://XBOX_BUTTON_X:
                        if(xbox.value){highBeam_on=!highBeam_on}
                        break;

                    case 3://XBOX_BUTTON_Y:
                        if(xbox.value){fog_on=!fog_on}
                        break;

                    case 4://XBOX_BUTTON_LB:
                        lift_stat = xbox.value
                        break;

                    case 5://XBOX_BUTTON_RB:
                        lift_stat = -xbox.value
                        break;

                    case 6://XBOX_BUTTON_START:
                        if(xbox.value){
                            driveMode = !driveMode
                        }
                        break;

                    case 7://XBOX_BUTTON_BACK:
                        if(xbox.value){
                            engine_start = !engine_start;//back_on=!back_on
                        }
                        break;

                    case 8://XBOX_BUTTON_HOME:

                            horn_on = xbox.value;//fog_on=!fog_on

                        break;

                    case 9://XBOX_BUTTON_LO:
                        //if(xbox.value){zoom=!zoom}
                        horn_on = xbox.value;
                        break;

                    case 10://XBOX_BUTTON_RO:
                        if(xbox.value){zoom=!zoom}
                        break;

                    default:
                        break;
                }
            }
            else if(xbox.type == 2)//JS_EVENT_AXIS
            {
                switch(xbox.number)
                {
                    case 0://XBOX_AXIS_LX:
                        str_whl_ang = xbox.value*str_whl_ang_max/32767
                        break;

                    case 1://XBOX_AXIS_LY:
                        if(xbox.value>22000){
                            add_Indicator = -1;
                        }
                        else if(xbox.value<-22000){
                            add_Indicator = 1;
                        }
                        else{
                            if((turn_Indicator<1&&add_Indicator>0)||(turn_Indicator>-1&&add_Indicator<0)){
                                turn_Indicator += add_Indicator;
                            }
                            add_Indicator = 0;
                        }

                        //console.log(xbox.value,add_Indicator)
                        break;

                    case 2://XBOX_AXIS_LT:
                        deceleration = (-32767-xbox.value)*5/65534

                        break;

                    case 3://XBOX_AXIS_RX:

                        break;

                    case 4://XBOX_AXIS_RY:
                        if(xbox.value>22000){
                            add_gear = -1;
                        }
                        else if(xbox.value<-22000){
                            add_gear = 1;
                        }
                        else{
                            if((gear_stat<2&&add_gear>0)||(gear_stat>0&&add_gear<0)){
                                gear_stat += add_gear;
                            }
                            add_gear = 0;
                        }
                        break;

                    case 5://XBOX_AXIS_RT:
                        throttle = (xbox.value+32767)*250/65534
                        break;

                    case 6://XBOX_AXIS_XX:
                        if(xbox.value<0){
                            rvv_on = !rvv_on;
                            rvv_spd = Math.floor(kph);
                        }
                        else if(xbox.value>0)lka_on = !lka_on;
                        break;

                    case 7://XBOX_AXIS_YY:
                        if(xbox.value<0){
                            rvv_spd+=1;
                            rvv_spd_up = true;
                        }
                        else if(xbox.value>0&&rvv_spd>0){
                            rvv_spd-=1;
                            rvv_spd_down = true;
                        }
                        else{
                            rvv_spd_up = false;
                            rvv_spd_down = false;
                        }
                        break;

                    default:
                        break;
                }
            }
        }
    }
    //wireless
    /*Connections{
        target: xbox
        onDataChanged:{
            if (xbox.type == 1)//JS_EVENT_BUTTON
            {
                switch(xbox.number)
                {
                    case 0://XBOX_BUTTON_A:
                        if(xbox.value){lowBeam_on=!lowBeam_on}
                        break;

                    case 1://XBOX_BUTTON_B:
                        if(xbox.value){epb_on = !epb_on}
                        break;

                    case 2://XBOX_BUTTON_X:
                        if(xbox.value){highBeam_on=!highBeam_on}
                        break;

                    case 3://XBOX_BUTTON_X:
                        if(xbox.value){highBeam_on=!highBeam_on}
                        break;

                    case 4://XBOX_BUTTON_Y:
                        if(xbox.value){fog_on=!fog_on}

                        break;

                    case 5://XBOX_BUTTON_
                        break;

                    case 6://XBOX_BUTTON_LB:
                        lift_stat = xbox.value
                        break;

                    case 7://XBOX_BUTTON_RB:
                        lift_stat = -xbox.value
                        break;

                    case 8://XBOX_BUTTON_HOME:

                            //fog_on=!fog_on

                        break;

                    case 9:
                        //if(xbox.value){zoom=!zoom}
                        horn_on = xbox.value;
                        break;

                    case 10:

                        break;

                    case 11://XBOX_BUTTON_BACK
                        if(xbox.value){
                            engine_start = !engine_start;//back_on=!back_on
                        }
                        break;

                    case 13://XBOX_BUTTON_LO:
                        horn_on = xbox.value;
                        break;

                    case 14://XBOX_BUTTON_RO:
                        wiperCleaner = xbox.value
                        //if(xbox.value){zoom=!zoom}
                        break;

                    default:
                        break;
                }
            }
            else if(xbox.type == 2)//JS_EVENT_AXIS
            {
                switch(xbox.number)
                {
                    case 0://XBOX_AXIS_LX:
                        str_whl_ang = xbox.value*str_whl_ang_max/32767
                        break;

                    case 1://XBOX_AXIS_LY:
                        if(xbox.value>22000){
                            add_Indicator = -1;
                        }
                        else if(xbox.value<-22000){
                            add_Indicator = 1;
                        }
                        else{
                            if((turn_Indicator<1&&add_Indicator>0)||(turn_Indicator>-1&&add_Indicator<0)){
                                turn_Indicator += add_Indicator;
                            }
                            add_Indicator = 0;
                        }

                        //console.log(xbox.value,add_Indicator)
                        break;

                    case 2://XBOX_AXIS_RX:
                        if(xbox.value>22000){
                            wiperAdder = 1;
                        }
                        else if(xbox.value<-22000){
                            wiperAdder = -1;
                        }
                        else{
                            if((wiperIndicator<2&&wiperAdder>0)||(wiperIndicator>0&&wiperAdder<0)){
                                wiperIndicator += wiperAdder;
                            }
                            wiperAdder = 0;
                        }
                        break;

                    case 3://XBOX_AXIS_RY:
                        if(xbox.value>22000){
                            add_gear = -1;
                        }
                        else if(xbox.value<-22000){
                            add_gear = 1;
                        }
                        else{
                            if((gear_stat<2&&add_gear>0)||(gear_stat>0&&add_gear<0)){
                                gear_stat += add_gear;
                            }
                            add_gear = 0;
                        }
                        break;


                    case 4://XBOX_AXIS_RT:
                        throttle = (xbox.value+32767)*250/65534
                        break;

                    case 5://XBOX_AXIS_LT:
                        deceleration = (-32767-xbox.value)*5/65534
                        break;

                    case 6://XBOX_AXIS_XX:
                        if(xbox.value<0){
                            rvv_on = !rvv_on;
                            rvv_spd = Math.floor(kph);
                        }
                        else if(xbox.value>0)lka_on = !lka_on;
                        break;

                    case 7://XBOX_AXIS_YY:
                        if(xbox.value<0){
                            rvv_spd+=1;
                            rvv_spd_up = true;
                        }
                        else if(xbox.value>0&&rvv_spd>0){
                            rvv_spd-=1;
                            rvv_spd_down = true;
                        }
                        else{
                            rvv_spd_up = false;
                            rvv_spd_down = false;
                        }
                        break;

                    default:
                        break;
                }
            }
        }
    }*/

    /*End of XBOX connections*/
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//

    SequentialAnimation {
        id: animation
        running: !onCAN
        loops: 1

        // We want a small pause at the beginning, but we only want it to happen once.
        PauseAnimation {
            duration: 1000
        }

        PropertyAction {
            target: valueSource
            property: "start"
            value: false
        }

        SequentialAnimation {
            loops: Animation.Infinite
//! [1]
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    from: 0
                    to: 30
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    from: 1
                    to: 6.1
                    duration: 3000
                }
            }
//! [1]
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    from: 30
                    to: 26
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    from: 6
                    to: 2.4
                    duration: 600
                }
            }
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 60
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 5.6
                    duration: 3000
                }
            }
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 56
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.3
                    duration: 600
                }
            }
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 100
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 5.1
                    duration: 3000
                }
            }
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 96
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.2
                    duration: 600
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 140
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 6.2
                    duration: 3000
                }
            }

            // Start downshifting.

            // Fifth to fourth gear.
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.Linear
                    to: 100
                    duration: 5000
                }

                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 3.1
                    duration: 5000
                }
            }

            // Fourth to third gear.
            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 5.5
                duration: 600
            }

            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 60
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.6
                    duration: 5000
                }
            }

            // Third to second gear.
            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 6.3
                duration: 600
            }

            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 30
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.6
                    duration: 5000
                }
            }

            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 6.5
                duration: 600
            }

            // Second to first gear.
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 0
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 1
                    duration: 4500
                }
            }

            PauseAnimation {
                duration: 5000
            }
        }
    }
}
