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

import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4


    // Dashboards are typically in a landscape orientation, so we need to ensure
    // our height is never greater than our width.
Item {
        id: container
        width: height * 3
        height: parent.height * 0.17
        property real iconsize: container.height * 0.06


        Image {

            id: contour
            source : "qrc:/images/contour.png"
            anchors.verticalCenter:parent.verticalCenter
            //anchors.verticalCenterOffset: parent.height * 0.13
            anchors.horizontalCenter: parent.horizontalCenter
            width: height * 3.1
            height: container.height * 0.6
            clip: true
        }

        Image {
            opacity: (valueSource.circleRotation>-360&&valueSource.circleRotation<45)?0.3:0
            id: circle
            source: "qrc:/images/circle.png"
            anchors.centerIn: parent
            width: parent.height * 0.7
            height: width
            rotation: valueSource.circleRotation
        }

        Row {
            id: gaugeRow
            spacing: container.height * 0.04
            anchors.centerIn: parent


            CircularGauge {
                id: speedometer
                value: valueSource.kph
                anchors.verticalCenter: parent.verticalCenter
                maximumValue: 280
                // We set the width to the height, because the height will always be
                // the more limited factor. Also, all circular controls letterbox
                // their contents to ensure that they remain circular. However, we
                // don't want to extra space on the left and right of our gauges,
                // because they're laid out horizontally, and that would create
                // large horizontal gaps between gauges on wide screens.
                width: height
                height: container.height * 0.5

                style: DashboardGaugeStyle {}

                CircularGauge {
                    id: fuelGauge
                    value: valueSource.fuel
                    maximumValue: 1
                    anchors.left: parent.left
                    y: parent.height * 0.8
                    width: parent.width * 0.4
                    height: parent.width * 0.28
                    anchors.leftMargin: -parent.width * 0.3

                    style: IconGaugeStyle {
                        id: fuelGaugeStyle

                        icon: "qrc:/images/fuel-icon.png"
                        minWarningColor: Qt.rgba(0.5, 0, 0, 1)

                        tickmarkLabel: Text {
                            color: "white"
                            visible: styleData.value === 0 || styleData.value === 1
                            font.pixelSize: fuelGaugeStyle.toPixels(0.225)
                            text: styleData.value === 0 ? "E" : (styleData.value === 1 ? "F" : "")
                        }
                    }
                }
            }


            TurnIndicator {
                id: leftIndicator
                y: parent.height / 2 - container.height * 0.2
                //anchors.verticalCenter: parent.verticalCenter
                width: height
                height: container.height * 0.08 - gaugeRow.spacing

                direction: Qt.LeftArrow
                on: valueSource.leftTurnSignal === 1
            }

            Item {
                width: height
                height: container.height * 0.25 //- gaugeRow.spacing
                anchors.verticalCenter: parent.verticalCenter

                Text{
                    visible: true
                    id: gearPosition
                    font.pixelSize: 0.2 * parent.height
                    font.bold: true
                    text: valueSource.gear
                    color: text === "P" ? Qt.rgba(0.5, 0, 0, 1) : (text === "N" ? "ORANGE" : "GREEN")
                    horizontalAlignment: Text.AlignRight
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.height / 2 - container.height * 0.2
                }


                IconAlert{
                    id: alertIcons
                    width: height
                    height: container.height * 0.25
                    anchors.centerIn: gearPosition.Center
                }

                Text {
                    visible: true
                    id: speedText
                    font.pixelSize: 0.5 * parent.height
                    text: kphInt
                    color: "white"
                    horizontalAlignment: Text.AlignRight
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 0.15 * parent.height
                    //anchors.topMargin: 0.1 * parent.height

                    readonly property int kphInt: valueSource.kph
                }
                Text {
                    id: spd_unit_txt
                    visible: speedText.visible
                    text: "km/h"
                    color: "white"
                    font.pixelSize: 0.1 * parent.height
                    anchors.left: speedText.right
                    anchors.leftMargin: 0.05 * parent.height
                    anchors.bottom: speedText.bottom
                    anchors.bottomMargin: 0.1 * parent.height
                }
                Image {
                    id: rvv
                    source: "qrc:/images/rvv_on.png"
                    height: iconsize
                    fillMode: Image.PreserveAspectFit
                    visible: valueSource.rvv_on
                    anchors.bottom: spd_unit_txt.top
                    anchors.left: spd_unit_txt.left
                    Text {
                        id: rvv_spd
                        visible: parent.visible
                        text: valueSource.rvv_spd
                        color: "#00ff00"
                        font.pixelSize: 0.5 * parent.height
                        anchors.left: parent.right
                        anchors.leftMargin: -0.2 * parent.height
                        anchors.bottom: parent.top
                        anchors.bottomMargin: -0.3 * parent.height
                    }

                }
                Text {
                    id: dateText
                    text: "日期："
                    color: "white"
                    font.pixelSize: 0.12 * parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: -0.2 * parent.height
                    anchors.top: speedText.bottom
                    anchors.topMargin: 0.1 * parent.height
                }
                Text {
                    text: valueSource.date
                    color: "white"
                    font.pixelSize: 0.12 * parent.height
                    anchors.left: dateText.right
                    //anchors.leftMargin: -0.5 * parent.height
                    anchors.bottom: dateText.bottom
                    anchors.bottomMargin: 0.01 * parent.height
                }
                Text {
                    id: timeText
                    text: "时间："
                    color: "white"
                    font.pixelSize: 0.12 * parent.height
                    anchors.left: dateText.left
                    //anchors.leftMargin: -0.2 * parent.height
                    anchors.top: dateText.bottom
                    //anchors.topMargin: 0.1 * parent.height
                }
                Text {
                    text: valueSource.time
                    color: "white"
                    font.pixelSize: 0.12 * parent.height
                    anchors.left: timeText.right
                    //anchors.leftMargin: -0.5 * parent.height
                    anchors.bottom: timeText.bottom
                    anchors.bottomMargin: 0.01 * parent.height
                }
                Text {
                    id: tempText
                    text: "气压(前桥/后桥):"
                    color: "white"
                    font.pixelSize: 0.12 * parent.height
                    anchors.left: timeText.left
                    anchors.top: timeText.bottom
                    //anchors.topMargin: 0.1 * parent.height
                }
                Text {
                    text: presFAInt+"/"+presRAInt+"(kPa)"
                    color: "white"
                    font.pixelSize: 0.12 * parent.height
                    anchors.left: tempText.right
                    //anchors.leftMargin: -0.5 * parent.height
                    anchors.bottom: tempText.bottom
                    anchors.bottomMargin: 0.01 * parent.height
                    readonly property int presFAInt: valueSource.pressureFA
                    readonly property int presRAInt: valueSource.pressureRA
                }
                Text {
                    id: milageText
                    text: "行驶里程(km)："
                    color: "#c8c8c8"
                    font.italic: true
                    font.pixelSize: 0.12 * parent.height
                    anchors.left: tempText.left
                    y: 1.45 * parent.height
                    //anchors.bottomMargin: 1 * parent.height
                }
                Text {
                    text: valueSource.milage
                    color: "#c8c8c8"
                    font.italic: true
                    font.pixelSize: 0.12 * parent.height
                    anchors.left: milageText.right
                    //anchors.leftMargin: -0.5 * parent.height
                    anchors.bottom: milageText.bottom
                    anchors.bottomMargin: 0.01 * parent.height
                }




            }


            TurnIndicator {
                id: rightIndicator
                y: parent.height / 2 - container.height * 0.2
                //anchors.verticalCenter: parent.verticalCenter
                width: height
                height: container.height * 0.08 - gaugeRow.spacing

                direction: Qt.RightArrow
                on: valueSource.rightTurnSignal === 1
            }

            CircularGauge {
                id: tachometer
                width: height
                height: container.height * 0.5 //- gaugeRow.spacing
                value: valueSource.rpm/1000
                maximumValue: 8
                anchors.verticalCenter: parent.verticalCenter

                style: TachometerStyle {}

                CircularGauge {
                    value: valueSource.waterTemp
                    maximumValue: 1
                    anchors.right: parent.right
                    anchors.rightMargin: -parent.width * 0.3
                    y: parent.height * 0.8
                    width: parent.width * 0.4
                    height: parent.width * 0.28

                    style: IconGaugeStyle {
                        id: tempGaugeStyle

                        icon: "qrc:/images/temperature-icon.png"
                        maxWarningColor: Qt.rgba(0.5, 0, 0, 1)
                        minWarningColor: Qt.rgba(0, 0, 0.5, 1)

                        tickmarkLabel: Text {
                            color: "white"
                            visible: styleData.value === 0 || styleData.value === 1
                            font.pixelSize: tempGaugeStyle.toPixels(0.225)
                            text: styleData.value === 0 ? "C" : (styleData.value === 1 ? "H" : "")
                        }
                    }
                }
                Image {
                    id: alertLFDoorOpenIcon
                    visible: valueSource.alertLFDoorOpen
                    source: "qrc:/images/car.png"
                    height: container.height * 0.15
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: container.height * 0.3
                    fillMode: Image.PreserveAspectFit
                    Image{
                        source: "qrc:/images/door_left_front.png"
                        height: container.height * 0.06
                        visible: parent.visible
                        anchors.right: parent.left
                        anchors.rightMargin: -container.height * 0.01
                        anchors.top: parent.top
                        anchors.topMargin: container.height * 0.035
                        fillMode: Image.PreserveAspectFit
                    }
                }
                Image {
                    id: alertRFDoorOpenIcon
                    visible: valueSource.alertRFDoorOpen
                    source: "qrc:/images/car.png"
                    height: container.height * 0.15
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: container.height * 0.3
                    fillMode: Image.PreserveAspectFit
                    Image{
                        source: "qrc:/images/door_right_front.png"
                        height: container.height * 0.06
                        visible: parent.visible
                        anchors.left: parent.right
                        anchors.leftMargin: -container.height * 0.01
                        anchors.top: parent.top
                        anchors.topMargin: container.height * 0.035
                        fillMode: Image.PreserveAspectFit
                    }
                }
                Image {
                    id: alertLRDoorOpenIcon
                    visible: valueSource.alertLRDoorOpen
                    source: "qrc:/images/car.png"
                    height: container.height * 0.15
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: container.height * 0.3
                    fillMode: Image.PreserveAspectFit
                    Image{
                        source: "qrc:/images/door_left_rear.png"
                        height: container.height * 0.06
                        visible: parent.visible
                        anchors.right: parent.left
                        anchors.rightMargin: -container.height * 0.01
                        anchors.top: parent.top
                        anchors.topMargin: container.height * 0.06
                        fillMode: Image.PreserveAspectFit
                    }
                }
                Image {
                    id: alertRRDoorOpenIcon
                    visible: valueSource.alertRRDoorOpen
                    source: "qrc:/images/car.png"
                    height: container.height * 0.15
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: container.height * 0.3
                    fillMode: Image.PreserveAspectFit
                    Image{
                        source: "qrc:/images/door_right_rear.png"
                        height: container.height * 0.06
                        visible: parent.visible
                        anchors.left: parent.right
                        anchors.leftMargin: -container.height * 0.01
                        anchors.top: parent.top
                        anchors.topMargin: container.height * 0.06
                        fillMode: Image.PreserveAspectFit
                    }
                }
                Image {
                    id: alertTrunkOpenIcon
                    visible: valueSource.alertTrunkOpen
                    source: "qrc:/images/car.png"
                    height: container.height * 0.15
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: container.height * 0.3
                    fillMode: Image.PreserveAspectFit
                    Image{
                        source: "qrc:/images/trunk.png"
                        height: container.height * 0.06
                        visible: parent.visible
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        anchors.topMargin: -container.height * 0.059
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }



        }
    }
//}
