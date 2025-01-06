import QtQuick 2.0

Item {
    id: dynamic_root
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.topMargin: parent.width * 0
    anchors.rightMargin: parent.width * 0
    property real dynamicSize: 0.15
    width: parent.width * dynamicSize
    height: width

    NumberAnimation {
        target: dynamic_root
        property: "dynamicSize"
        duration: 200
        easing.type: Easing.InOutQuad
        from: 0.15
        to: 0.1
        running: valueSource.zoom
    }
    NumberAnimation {
        target: dynamic_root
        property: "dynamicSize"
        duration: 200
        easing.type: Easing.InOutQuad
        from: 0.1
        to: 0.15
        running: !valueSource.zoom
    }
    Image {
        id: dynamic_bg
        source: "qrc:/images/dynamic/dynamic_background.png"
        width: parent.width
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        opacity: 1
    }
    Item{
        id: obstacles
        width: dynamic_bg.width
        height: dynamic_bg.height
        anchors.horizontalCenter: dynamic_bg.horizontalCenter
        anchors.verticalCenter: dynamic_bg.verticalCenter
        opacity:  1
        property real dotSize: parent.width * 0.03
        property real dotDuration: 500
        /*Insert obstacles here*/
        Image {
            id: obstacle_0
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_0_x*valueSource.obstacle_0_x+valueSource.obstacle_0_y*valueSource.obstacle_0_y)+1)*valueSource.obstacle_0_x/Math.sqrt(valueSource.obstacle_0_x*valueSource.obstacle_0_x+valueSource.obstacle_0_y*valueSource.obstacle_0_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_0_x*valueSource.obstacle_0_x+valueSource.obstacle_0_y*valueSource.obstacle_0_y)+1)*valueSource.obstacle_0_y/Math.sqrt(valueSource.obstacle_0_x*valueSource.obstacle_0_x+valueSource.obstacle_0_y*valueSource.obstacle_0_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_0
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_0_flag
            }
        }
        Image {
            id: obstacle_1
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_1_x*valueSource.obstacle_1_x+valueSource.obstacle_1_y*valueSource.obstacle_1_y)+1)*valueSource.obstacle_1_x/Math.sqrt(valueSource.obstacle_1_x*valueSource.obstacle_1_x+valueSource.obstacle_1_y*valueSource.obstacle_1_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_1_x*valueSource.obstacle_1_x+valueSource.obstacle_1_y*valueSource.obstacle_1_y)+1)*valueSource.obstacle_1_y/Math.sqrt(valueSource.obstacle_1_x*valueSource.obstacle_1_x+valueSource.obstacle_1_y*valueSource.obstacle_1_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_1
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_1_flag
            }
        }
        Image {
            id: obstacle_2
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_2_x*valueSource.obstacle_2_x+valueSource.obstacle_2_y*valueSource.obstacle_2_y)+1)*valueSource.obstacle_2_x/Math.sqrt(valueSource.obstacle_2_x*valueSource.obstacle_2_x+valueSource.obstacle_2_y*valueSource.obstacle_2_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_2_x*valueSource.obstacle_2_x+valueSource.obstacle_2_y*valueSource.obstacle_2_y)+1)*valueSource.obstacle_2_y/Math.sqrt(valueSource.obstacle_2_x*valueSource.obstacle_2_x+valueSource.obstacle_2_y*valueSource.obstacle_2_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_2
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_2_flag
            }
        }
        Image {
            id: obstacle_3
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_3_x*valueSource.obstacle_3_x+valueSource.obstacle_3_y*valueSource.obstacle_3_y)+1)*valueSource.obstacle_3_x/Math.sqrt(valueSource.obstacle_3_x*valueSource.obstacle_3_x+valueSource.obstacle_3_y*valueSource.obstacle_3_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_3_x*valueSource.obstacle_3_x+valueSource.obstacle_3_y*valueSource.obstacle_3_y)+1)*valueSource.obstacle_3_y/Math.sqrt(valueSource.obstacle_3_x*valueSource.obstacle_3_x+valueSource.obstacle_3_y*valueSource.obstacle_3_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_3
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_3_flag
            }
        }
        Image {
            id: obstacle_4
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_4_x*valueSource.obstacle_4_x+valueSource.obstacle_4_y*valueSource.obstacle_4_y)+1)*valueSource.obstacle_4_x/Math.sqrt(valueSource.obstacle_4_x*valueSource.obstacle_4_x+valueSource.obstacle_4_y*valueSource.obstacle_4_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_4_x*valueSource.obstacle_4_x+valueSource.obstacle_4_y*valueSource.obstacle_4_y)+1)*valueSource.obstacle_4_y/Math.sqrt(valueSource.obstacle_4_x*valueSource.obstacle_4_x+valueSource.obstacle_4_y*valueSource.obstacle_4_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_4
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_4_flag
            }
        }
        Image {
            id: obstacle_5
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_5_x*valueSource.obstacle_5_x+valueSource.obstacle_5_y*valueSource.obstacle_5_y)+1)*valueSource.obstacle_5_x/Math.sqrt(valueSource.obstacle_5_x*valueSource.obstacle_5_x+valueSource.obstacle_5_y*valueSource.obstacle_5_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_5_x*valueSource.obstacle_5_x+valueSource.obstacle_5_y*valueSource.obstacle_5_y)+1)*valueSource.obstacle_5_y/Math.sqrt(valueSource.obstacle_5_x*valueSource.obstacle_5_x+valueSource.obstacle_5_y*valueSource.obstacle_5_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_5
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_5_flag
            }
        }
        Image {
            id: obstacle_6
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_6_x*valueSource.obstacle_6_x+valueSource.obstacle_6_y*valueSource.obstacle_6_y)+1)*valueSource.obstacle_6_x/Math.sqrt(valueSource.obstacle_6_x*valueSource.obstacle_6_x+valueSource.obstacle_6_y*valueSource.obstacle_6_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_6_x*valueSource.obstacle_6_x+valueSource.obstacle_6_y*valueSource.obstacle_6_y)+1)*valueSource.obstacle_6_y/Math.sqrt(valueSource.obstacle_6_x*valueSource.obstacle_6_x+valueSource.obstacle_6_y*valueSource.obstacle_6_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_6
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_6_flag
            }
        }
        Image {
            id: obstacle_7
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_7_x*valueSource.obstacle_7_x+valueSource.obstacle_7_y*valueSource.obstacle_7_y)+1)*valueSource.obstacle_7_x/Math.sqrt(valueSource.obstacle_7_x*valueSource.obstacle_7_x+valueSource.obstacle_7_y*valueSource.obstacle_7_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_7_x*valueSource.obstacle_7_x+valueSource.obstacle_7_y*valueSource.obstacle_7_y)+1)*valueSource.obstacle_7_y/Math.sqrt(valueSource.obstacle_7_x*valueSource.obstacle_7_x+valueSource.obstacle_7_y*valueSource.obstacle_7_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_7
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_7_flag
            }
        }
        Image {
            id: obstacle_8
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_8_x*valueSource.obstacle_8_x+valueSource.obstacle_8_y*valueSource.obstacle_8_y)+1)*valueSource.obstacle_8_x/Math.sqrt(valueSource.obstacle_8_x*valueSource.obstacle_8_x+valueSource.obstacle_8_y*valueSource.obstacle_8_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_8_x*valueSource.obstacle_8_x+valueSource.obstacle_8_y*valueSource.obstacle_8_y)+1)*valueSource.obstacle_8_y/Math.sqrt(valueSource.obstacle_8_x*valueSource.obstacle_8_x+valueSource.obstacle_8_y*valueSource.obstacle_8_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_8
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_8_flag
            }
        }
        Image {
            id: obstacle_9
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_9_x*valueSource.obstacle_9_x+valueSource.obstacle_9_y*valueSource.obstacle_9_y)+1)*valueSource.obstacle_9_x/Math.sqrt(valueSource.obstacle_9_x*valueSource.obstacle_9_x+valueSource.obstacle_9_y*valueSource.obstacle_9_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_9_x*valueSource.obstacle_9_x+valueSource.obstacle_9_y*valueSource.obstacle_9_y)+1)*valueSource.obstacle_9_y/Math.sqrt(valueSource.obstacle_9_x*valueSource.obstacle_9_x+valueSource.obstacle_9_y*valueSource.obstacle_9_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_9
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_9_flag
            }
        }
        Image {
            id: obstacle_10
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_10_x*valueSource.obstacle_10_x+valueSource.obstacle_10_y*valueSource.obstacle_10_y)+1)*valueSource.obstacle_10_x/Math.sqrt(valueSource.obstacle_10_x*valueSource.obstacle_10_x+valueSource.obstacle_10_y*valueSource.obstacle_10_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_10_x*valueSource.obstacle_10_x+valueSource.obstacle_10_y*valueSource.obstacle_10_y)+1)*valueSource.obstacle_10_y/Math.sqrt(valueSource.obstacle_10_x*valueSource.obstacle_10_x+valueSource.obstacle_10_y*valueSource.obstacle_10_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_10
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_10_flag
            }
        }
        Image {
            id: obstacle_11
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_11_x*valueSource.obstacle_11_x+valueSource.obstacle_11_y*valueSource.obstacle_11_y)+1)*valueSource.obstacle_11_x/Math.sqrt(valueSource.obstacle_11_x*valueSource.obstacle_11_x+valueSource.obstacle_11_y*valueSource.obstacle_11_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_11_x*valueSource.obstacle_11_x+valueSource.obstacle_11_y*valueSource.obstacle_11_y)+1)*valueSource.obstacle_11_y/Math.sqrt(valueSource.obstacle_11_x*valueSource.obstacle_11_x+valueSource.obstacle_11_y*valueSource.obstacle_11_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_11
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_11_flag
            }
        }
        Image {
            id: obstacle_12
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_12_x*valueSource.obstacle_12_x+valueSource.obstacle_12_y*valueSource.obstacle_12_y)+1)*valueSource.obstacle_12_x/Math.sqrt(valueSource.obstacle_12_x*valueSource.obstacle_12_x+valueSource.obstacle_12_y*valueSource.obstacle_12_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_12_x*valueSource.obstacle_12_x+valueSource.obstacle_12_y*valueSource.obstacle_12_y)+1)*valueSource.obstacle_12_y/Math.sqrt(valueSource.obstacle_12_x*valueSource.obstacle_12_x+valueSource.obstacle_12_y*valueSource.obstacle_12_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_12
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_12_flag
            }
        }
        Image {
            id: obstacle_13
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_13_x*valueSource.obstacle_13_x+valueSource.obstacle_13_y*valueSource.obstacle_13_y)+1)*valueSource.obstacle_13_x/Math.sqrt(valueSource.obstacle_13_x*valueSource.obstacle_13_x+valueSource.obstacle_13_y*valueSource.obstacle_13_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_13_x*valueSource.obstacle_13_x+valueSource.obstacle_13_y*valueSource.obstacle_13_y)+1)*valueSource.obstacle_13_y/Math.sqrt(valueSource.obstacle_13_x*valueSource.obstacle_13_x+valueSource.obstacle_13_y*valueSource.obstacle_13_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_13
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_13_flag
            }
        }
        Image {
            id: obstacle_14
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_14_x*valueSource.obstacle_14_x+valueSource.obstacle_14_y*valueSource.obstacle_14_y)+1)*valueSource.obstacle_14_x/Math.sqrt(valueSource.obstacle_14_x*valueSource.obstacle_14_x+valueSource.obstacle_14_y*valueSource.obstacle_14_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_14_x*valueSource.obstacle_14_x+valueSource.obstacle_14_y*valueSource.obstacle_14_y)+1)*valueSource.obstacle_14_y/Math.sqrt(valueSource.obstacle_14_x*valueSource.obstacle_14_x+valueSource.obstacle_14_y*valueSource.obstacle_14_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_14
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_14_flag
            }
        }
        Image {
            id: obstacle_15
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_15_x*valueSource.obstacle_15_x+valueSource.obstacle_15_y*valueSource.obstacle_15_y)+1)*valueSource.obstacle_15_x/Math.sqrt(valueSource.obstacle_15_x*valueSource.obstacle_15_x+valueSource.obstacle_15_y*valueSource.obstacle_15_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_15_x*valueSource.obstacle_15_x+valueSource.obstacle_15_y*valueSource.obstacle_15_y)+1)*valueSource.obstacle_15_y/Math.sqrt(valueSource.obstacle_15_x*valueSource.obstacle_15_x+valueSource.obstacle_15_y*valueSource.obstacle_15_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_15
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_15_flag
            }
        }
        Image {
            id: obstacle_16
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_16_x*valueSource.obstacle_16_x+valueSource.obstacle_16_y*valueSource.obstacle_16_y)+1)*valueSource.obstacle_16_x/Math.sqrt(valueSource.obstacle_16_x*valueSource.obstacle_16_x+valueSource.obstacle_16_y*valueSource.obstacle_16_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_16_x*valueSource.obstacle_16_x+valueSource.obstacle_16_y*valueSource.obstacle_16_y)+1)*valueSource.obstacle_16_y/Math.sqrt(valueSource.obstacle_16_x*valueSource.obstacle_16_x+valueSource.obstacle_16_y*valueSource.obstacle_16_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_16
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_16_flag
            }
        }
        Image {
            id: obstacle_17
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_17_x*valueSource.obstacle_17_x+valueSource.obstacle_17_y*valueSource.obstacle_17_y)+1)*valueSource.obstacle_17_x/Math.sqrt(valueSource.obstacle_17_x*valueSource.obstacle_17_x+valueSource.obstacle_17_y*valueSource.obstacle_17_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_17_x*valueSource.obstacle_17_x+valueSource.obstacle_17_y*valueSource.obstacle_17_y)+1)*valueSource.obstacle_17_y/Math.sqrt(valueSource.obstacle_17_x*valueSource.obstacle_17_x+valueSource.obstacle_17_y*valueSource.obstacle_17_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_17
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_17_flag
            }
        }
        Image {
            id: obstacle_18
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_18_x*valueSource.obstacle_18_x+valueSource.obstacle_18_y*valueSource.obstacle_18_y)+1)*valueSource.obstacle_18_x/Math.sqrt(valueSource.obstacle_18_x*valueSource.obstacle_18_x+valueSource.obstacle_18_y*valueSource.obstacle_18_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_18_x*valueSource.obstacle_18_x+valueSource.obstacle_18_y*valueSource.obstacle_18_y)+1)*valueSource.obstacle_18_y/Math.sqrt(valueSource.obstacle_18_x*valueSource.obstacle_18_x+valueSource.obstacle_18_y*valueSource.obstacle_18_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_18
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_18_flag
            }
        }
        Image {
            id: obstacle_19
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_19_x*valueSource.obstacle_19_x+valueSource.obstacle_19_y*valueSource.obstacle_19_y)+1)*valueSource.obstacle_19_x/Math.sqrt(valueSource.obstacle_19_x*valueSource.obstacle_19_x+valueSource.obstacle_19_y*valueSource.obstacle_19_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_19_x*valueSource.obstacle_19_x+valueSource.obstacle_19_y*valueSource.obstacle_19_y)+1)*valueSource.obstacle_19_y/Math.sqrt(valueSource.obstacle_19_x*valueSource.obstacle_19_x+valueSource.obstacle_19_y*valueSource.obstacle_19_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_19
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_19_flag
            }
        }
        Image {
            id: obstacle_20
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_20_x*valueSource.obstacle_20_x+valueSource.obstacle_20_y*valueSource.obstacle_20_y)+1)*valueSource.obstacle_20_x/Math.sqrt(valueSource.obstacle_20_x*valueSource.obstacle_20_x+valueSource.obstacle_20_y*valueSource.obstacle_20_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_20_x*valueSource.obstacle_20_x+valueSource.obstacle_20_y*valueSource.obstacle_20_y)+1)*valueSource.obstacle_20_y/Math.sqrt(valueSource.obstacle_20_x*valueSource.obstacle_20_x+valueSource.obstacle_20_y*valueSource.obstacle_20_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_20
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_20_flag
            }
        }
        Image {
            id: obstacle_21
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_21_x*valueSource.obstacle_21_x+valueSource.obstacle_21_y*valueSource.obstacle_21_y)+1)*valueSource.obstacle_21_x/Math.sqrt(valueSource.obstacle_21_x*valueSource.obstacle_21_x+valueSource.obstacle_21_y*valueSource.obstacle_21_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_21_x*valueSource.obstacle_21_x+valueSource.obstacle_21_y*valueSource.obstacle_21_y)+1)*valueSource.obstacle_21_y/Math.sqrt(valueSource.obstacle_21_x*valueSource.obstacle_21_x+valueSource.obstacle_21_y*valueSource.obstacle_21_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_21
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_21_flag
            }
        }
        Image {
            id: obstacle_22
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_22_x*valueSource.obstacle_22_x+valueSource.obstacle_22_y*valueSource.obstacle_22_y)+1)*valueSource.obstacle_22_x/Math.sqrt(valueSource.obstacle_22_x*valueSource.obstacle_22_x+valueSource.obstacle_22_y*valueSource.obstacle_22_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_22_x*valueSource.obstacle_22_x+valueSource.obstacle_22_y*valueSource.obstacle_22_y)+1)*valueSource.obstacle_22_y/Math.sqrt(valueSource.obstacle_22_x*valueSource.obstacle_22_x+valueSource.obstacle_22_y*valueSource.obstacle_22_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_22
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_22_flag
            }
        }
        Image {
            id: obstacle_23
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_23_x*valueSource.obstacle_23_x+valueSource.obstacle_23_y*valueSource.obstacle_23_y)+1)*valueSource.obstacle_23_x/Math.sqrt(valueSource.obstacle_23_x*valueSource.obstacle_23_x+valueSource.obstacle_23_y*valueSource.obstacle_23_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_23_x*valueSource.obstacle_23_x+valueSource.obstacle_23_y*valueSource.obstacle_23_y)+1)*valueSource.obstacle_23_y/Math.sqrt(valueSource.obstacle_23_x*valueSource.obstacle_23_x+valueSource.obstacle_23_y*valueSource.obstacle_23_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_23
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_23_flag
            }
        }
        Image {
            id: obstacle_24
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_24_x*valueSource.obstacle_24_x+valueSource.obstacle_24_y*valueSource.obstacle_24_y)+1)*valueSource.obstacle_24_x/Math.sqrt(valueSource.obstacle_24_x*valueSource.obstacle_24_x+valueSource.obstacle_24_y*valueSource.obstacle_24_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_24_x*valueSource.obstacle_24_x+valueSource.obstacle_24_y*valueSource.obstacle_24_y)+1)*valueSource.obstacle_24_y/Math.sqrt(valueSource.obstacle_24_x*valueSource.obstacle_24_x+valueSource.obstacle_24_y*valueSource.obstacle_24_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_24
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_24_flag
            }
        }
        Image {
            id: obstacle_25
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_25_x*valueSource.obstacle_25_x+valueSource.obstacle_25_y*valueSource.obstacle_25_y)+1)*valueSource.obstacle_25_x/Math.sqrt(valueSource.obstacle_25_x*valueSource.obstacle_25_x+valueSource.obstacle_25_y*valueSource.obstacle_25_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_25_x*valueSource.obstacle_25_x+valueSource.obstacle_25_y*valueSource.obstacle_25_y)+1)*valueSource.obstacle_25_y/Math.sqrt(valueSource.obstacle_25_x*valueSource.obstacle_25_x+valueSource.obstacle_25_y*valueSource.obstacle_25_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_25
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_25_flag
            }
        }
        Image {
            id: obstacle_26
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_26_x*valueSource.obstacle_26_x+valueSource.obstacle_26_y*valueSource.obstacle_26_y)+1)*valueSource.obstacle_26_x/Math.sqrt(valueSource.obstacle_26_x*valueSource.obstacle_26_x+valueSource.obstacle_26_y*valueSource.obstacle_26_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_26_x*valueSource.obstacle_26_x+valueSource.obstacle_26_y*valueSource.obstacle_26_y)+1)*valueSource.obstacle_26_y/Math.sqrt(valueSource.obstacle_26_x*valueSource.obstacle_26_x+valueSource.obstacle_26_y*valueSource.obstacle_26_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_26
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_26_flag
            }
        }
        Image {
            id: obstacle_27
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_27_x*valueSource.obstacle_27_x+valueSource.obstacle_27_y*valueSource.obstacle_27_y)+1)*valueSource.obstacle_27_x/Math.sqrt(valueSource.obstacle_27_x*valueSource.obstacle_27_x+valueSource.obstacle_27_y*valueSource.obstacle_27_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_27_x*valueSource.obstacle_27_x+valueSource.obstacle_27_y*valueSource.obstacle_27_y)+1)*valueSource.obstacle_27_y/Math.sqrt(valueSource.obstacle_27_x*valueSource.obstacle_27_x+valueSource.obstacle_27_y*valueSource.obstacle_27_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_27
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_27_flag
            }
        }
        Image {
            id: obstacle_28
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_28_x*valueSource.obstacle_28_x+valueSource.obstacle_28_y*valueSource.obstacle_28_y)+1)*valueSource.obstacle_28_x/Math.sqrt(valueSource.obstacle_28_x*valueSource.obstacle_28_x+valueSource.obstacle_28_y*valueSource.obstacle_28_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_28_x*valueSource.obstacle_28_x+valueSource.obstacle_28_y*valueSource.obstacle_28_y)+1)*valueSource.obstacle_28_y/Math.sqrt(valueSource.obstacle_28_x*valueSource.obstacle_28_x+valueSource.obstacle_28_y*valueSource.obstacle_28_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_28
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_28_flag
            }
        }
        Image {
            id: obstacle_29
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_29_x*valueSource.obstacle_29_x+valueSource.obstacle_29_y*valueSource.obstacle_29_y)+1)*valueSource.obstacle_29_x/Math.sqrt(valueSource.obstacle_29_x*valueSource.obstacle_29_x+valueSource.obstacle_29_y*valueSource.obstacle_29_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_29_x*valueSource.obstacle_29_x+valueSource.obstacle_29_y*valueSource.obstacle_29_y)+1)*valueSource.obstacle_29_y/Math.sqrt(valueSource.obstacle_29_x*valueSource.obstacle_29_x+valueSource.obstacle_29_y*valueSource.obstacle_29_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_29
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_29_flag
            }
        }
        Image {
            id: obstacle_30
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_30_x*valueSource.obstacle_30_x+valueSource.obstacle_30_y*valueSource.obstacle_30_y)+1)*valueSource.obstacle_30_x/Math.sqrt(valueSource.obstacle_30_x*valueSource.obstacle_30_x+valueSource.obstacle_30_y*valueSource.obstacle_30_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_30_x*valueSource.obstacle_30_x+valueSource.obstacle_30_y*valueSource.obstacle_30_y)+1)*valueSource.obstacle_30_y/Math.sqrt(valueSource.obstacle_30_x*valueSource.obstacle_30_x+valueSource.obstacle_30_y*valueSource.obstacle_30_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_30
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_30_flag
            }
        }
        Image {
            id: obstacle_31
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_31_x*valueSource.obstacle_31_x+valueSource.obstacle_31_y*valueSource.obstacle_31_y)+1)*valueSource.obstacle_31_x/Math.sqrt(valueSource.obstacle_31_x*valueSource.obstacle_31_x+valueSource.obstacle_31_y*valueSource.obstacle_31_y)
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacle_31_x*valueSource.obstacle_31_x+valueSource.obstacle_31_y*valueSource.obstacle_31_y)+1)*valueSource.obstacle_31_y/Math.sqrt(valueSource.obstacle_31_x*valueSource.obstacle_31_x+valueSource.obstacle_31_y*valueSource.obstacle_31_y)
            opacity: 1

            NumberAnimation {
                target: obstacle_31
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacle_31_flag
            }
        }
        /*Image {
            id: obstacle_4
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[4]*valueSource.obstacles_x[4]+valueSource.obstacles_y[4]*valueSource.obstacles_y[4])+1)*valueSource.obstacles_x[4]/Math.sqrt(valueSource.obstacles_x[4]*valueSource.obstacles_x[4]+valueSource.obstacles_y[4]*valueSource.obstacles_y[4])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[4]*valueSource.obstacles_x[4]+valueSource.obstacles_y[4]*valueSource.obstacles_y[4])+1)*valueSource.obstacles_y[4]/Math.sqrt(valueSource.obstacles_x[4]*valueSource.obstacles_x[4]+valueSource.obstacles_y[4]*valueSource.obstacles_y[4])
            opacity: 1

            NumberAnimation {
                target: obstacle_4
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[4]===1
            }
        }
        Image {
            id: obstacle_5
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[5]*valueSource.obstacles_x[5]+valueSource.obstacles_y[5]*valueSource.obstacles_y[5])+1)*valueSource.obstacles_x[5]/Math.sqrt(valueSource.obstacles_x[5]*valueSource.obstacles_x[5]+valueSource.obstacles_y[5]*valueSource.obstacles_y[5])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[5]*valueSource.obstacles_x[5]+valueSource.obstacles_y[5]*valueSource.obstacles_y[5])+1)*valueSource.obstacles_y[5]/Math.sqrt(valueSource.obstacles_x[5]*valueSource.obstacles_x[5]+valueSource.obstacles_y[5]*valueSource.obstacles_y[5])
            opacity: 1

            NumberAnimation {
                target: obstacle_5
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[5]===1
            }
        }
        Image {
            id: obstacle_6
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[6]*valueSource.obstacles_x[6]+valueSource.obstacles_y[6]*valueSource.obstacles_y[6])+1)*valueSource.obstacles_x[6]/Math.sqrt(valueSource.obstacles_x[6]*valueSource.obstacles_x[6]+valueSource.obstacles_y[6]*valueSource.obstacles_y[6])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[6]*valueSource.obstacles_x[6]+valueSource.obstacles_y[6]*valueSource.obstacles_y[6])+1)*valueSource.obstacles_y[6]/Math.sqrt(valueSource.obstacles_x[6]*valueSource.obstacles_x[6]+valueSource.obstacles_y[6]*valueSource.obstacles_y[6])
            opacity: 1

            NumberAnimation {
                target: obstacle_6
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[6]===1
            }
        }
        Image {
            id: obstacle_7
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[7]*valueSource.obstacles_x[7]+valueSource.obstacles_y[7]*valueSource.obstacles_y[7])+1)*valueSource.obstacles_x[7]/Math.sqrt(valueSource.obstacles_x[7]*valueSource.obstacles_x[7]+valueSource.obstacles_y[7]*valueSource.obstacles_y[7])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[7]*valueSource.obstacles_x[7]+valueSource.obstacles_y[7]*valueSource.obstacles_y[7])+1)*valueSource.obstacles_y[7]/Math.sqrt(valueSource.obstacles_x[7]*valueSource.obstacles_x[7]+valueSource.obstacles_y[7]*valueSource.obstacles_y[7])
            opacity: 1

            NumberAnimation {
                target: obstacle_7
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[7]===1
            }
        }
        Image {
            id: obstacle_8
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[8]*valueSource.obstacles_x[8]+valueSource.obstacles_y[8]*valueSource.obstacles_y[8])+1)*valueSource.obstacles_x[8]/Math.sqrt(valueSource.obstacles_x[8]*valueSource.obstacles_x[8]+valueSource.obstacles_y[8]*valueSource.obstacles_y[8])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[8]*valueSource.obstacles_x[8]+valueSource.obstacles_y[8]*valueSource.obstacles_y[8])+1)*valueSource.obstacles_y[8]/Math.sqrt(valueSource.obstacles_x[8]*valueSource.obstacles_x[8]+valueSource.obstacles_y[8]*valueSource.obstacles_y[8])
            opacity: 1

            NumberAnimation {
                target: obstacle_8
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[8]===1
            }
        }
        Image {
            id: obstacle_9
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[9]*valueSource.obstacles_x[9]+valueSource.obstacles_y[9]*valueSource.obstacles_y[9])+1)*valueSource.obstacles_x[9]/Math.sqrt(valueSource.obstacles_x[9]*valueSource.obstacles_x[9]+valueSource.obstacles_y[9]*valueSource.obstacles_y[9])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[9]*valueSource.obstacles_x[9]+valueSource.obstacles_y[9]*valueSource.obstacles_y[9])+1)*valueSource.obstacles_y[9]/Math.sqrt(valueSource.obstacles_x[9]*valueSource.obstacles_x[9]+valueSource.obstacles_y[9]*valueSource.obstacles_y[9])
            opacity: 1

            NumberAnimation {
                target: obstacle_9
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[9]===1
            }
        }
        Image {
            id: obstacle_10
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[10]*valueSource.obstacles_x[10]+valueSource.obstacles_y[10]*valueSource.obstacles_y[10])+1)*valueSource.obstacles_x[10]/Math.sqrt(valueSource.obstacles_x[10]*valueSource.obstacles_x[10]+valueSource.obstacles_y[10]*valueSource.obstacles_y[10])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[10]*valueSource.obstacles_x[10]+valueSource.obstacles_y[10]*valueSource.obstacles_y[10])+1)*valueSource.obstacles_y[10]/Math.sqrt(valueSource.obstacles_x[10]*valueSource.obstacles_x[10]+valueSource.obstacles_y[10]*valueSource.obstacles_y[10])
            opacity: 1

            NumberAnimation {
                target: obstacle_10
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[10]===1
            }
        }
        Image {
            id: obstacle_11
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[11]*valueSource.obstacles_x[11]+valueSource.obstacles_y[11]*valueSource.obstacles_y[11])+1)*valueSource.obstacles_x[11]/Math.sqrt(valueSource.obstacles_x[11]*valueSource.obstacles_x[11]+valueSource.obstacles_y[11]*valueSource.obstacles_y[11])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[11]*valueSource.obstacles_x[11]+valueSource.obstacles_y[11]*valueSource.obstacles_y[11])+1)*valueSource.obstacles_y[11]/Math.sqrt(valueSource.obstacles_x[11]*valueSource.obstacles_x[11]+valueSource.obstacles_y[11]*valueSource.obstacles_y[11])
            opacity: 1

            NumberAnimation {
                target: obstacle_11
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[11]===1
            }
        }
        Image {
            id: obstacle_12
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[12]*valueSource.obstacles_x[12]+valueSource.obstacles_y[12]*valueSource.obstacles_y[12])+1)*valueSource.obstacles_x[12]/Math.sqrt(valueSource.obstacles_x[12]*valueSource.obstacles_x[12]+valueSource.obstacles_y[12]*valueSource.obstacles_y[12])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[12]*valueSource.obstacles_x[12]+valueSource.obstacles_y[12]*valueSource.obstacles_y[12])+1)*valueSource.obstacles_y[12]/Math.sqrt(valueSource.obstacles_x[12]*valueSource.obstacles_x[12]+valueSource.obstacles_y[12]*valueSource.obstacles_y[12])
            opacity: 1

            NumberAnimation {
                target: obstacle_12
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[12]===1
            }
        }
        Image {
            id: obstacle_13
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[13]*valueSource.obstacles_x[13]+valueSource.obstacles_y[13]*valueSource.obstacles_y[13])+1)*valueSource.obstacles_x[13]/Math.sqrt(valueSource.obstacles_x[13]*valueSource.obstacles_x[13]+valueSource.obstacles_y[13]*valueSource.obstacles_y[13])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[13]*valueSource.obstacles_x[13]+valueSource.obstacles_y[13]*valueSource.obstacles_y[13])+1)*valueSource.obstacles_y[13]/Math.sqrt(valueSource.obstacles_x[13]*valueSource.obstacles_x[13]+valueSource.obstacles_y[13]*valueSource.obstacles_y[13])
            opacity: 1

            NumberAnimation {
                target: obstacle_13
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[13]===1
            }
        }
        Image {
            id: obstacle_14
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[14]*valueSource.obstacles_x[14]+valueSource.obstacles_y[14]*valueSource.obstacles_y[14])+1)*valueSource.obstacles_x[14]/Math.sqrt(valueSource.obstacles_x[14]*valueSource.obstacles_x[14]+valueSource.obstacles_y[14]*valueSource.obstacles_y[14])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[14]*valueSource.obstacles_x[14]+valueSource.obstacles_y[14]*valueSource.obstacles_y[14])+1)*valueSource.obstacles_y[14]/Math.sqrt(valueSource.obstacles_x[14]*valueSource.obstacles_x[14]+valueSource.obstacles_y[14]*valueSource.obstacles_y[14])
            opacity: 1

            NumberAnimation {
                target: obstacle_14
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[14]===1
            }
        }
        Image {
            id: obstacle_15
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[15]*valueSource.obstacles_x[15]+valueSource.obstacles_y[15]*valueSource.obstacles_y[15])+1)*valueSource.obstacles_x[15]/Math.sqrt(valueSource.obstacles_x[15]*valueSource.obstacles_x[15]+valueSource.obstacles_y[15]*valueSource.obstacles_y[15])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[15]*valueSource.obstacles_x[15]+valueSource.obstacles_y[15]*valueSource.obstacles_y[15])+1)*valueSource.obstacles_y[15]/Math.sqrt(valueSource.obstacles_x[15]*valueSource.obstacles_x[15]+valueSource.obstacles_y[15]*valueSource.obstacles_y[15])
            opacity: 1

            NumberAnimation {
                target: obstacle_15
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[15]===1
            }
        }
        Image {
            id: obstacle_16
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[16]*valueSource.obstacles_x[16]+valueSource.obstacles_y[16]*valueSource.obstacles_y[16])+1)*valueSource.obstacles_x[16]/Math.sqrt(valueSource.obstacles_x[16]*valueSource.obstacles_x[16]+valueSource.obstacles_y[16]*valueSource.obstacles_y[16])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[16]*valueSource.obstacles_x[16]+valueSource.obstacles_y[16]*valueSource.obstacles_y[16])+1)*valueSource.obstacles_y[16]/Math.sqrt(valueSource.obstacles_x[16]*valueSource.obstacles_x[16]+valueSource.obstacles_y[16]*valueSource.obstacles_y[16])
            opacity: 1

            NumberAnimation {
                target: obstacle_16
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[16]===1
            }
        }
        Image {
            id: obstacle_17
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[17]*valueSource.obstacles_x[17]+valueSource.obstacles_y[17]*valueSource.obstacles_y[17])+1)*valueSource.obstacles_x[17]/Math.sqrt(valueSource.obstacles_x[17]*valueSource.obstacles_x[17]+valueSource.obstacles_y[17]*valueSource.obstacles_y[17])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[17]*valueSource.obstacles_x[17]+valueSource.obstacles_y[17]*valueSource.obstacles_y[17])+1)*valueSource.obstacles_y[17]/Math.sqrt(valueSource.obstacles_x[17]*valueSource.obstacles_x[17]+valueSource.obstacles_y[17]*valueSource.obstacles_y[17])
            opacity: 1

            NumberAnimation {
                target: obstacle_17
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[17]===1
            }
        }
        Image {
            id: obstacle_18
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[18]*valueSource.obstacles_x[18]+valueSource.obstacles_y[18]*valueSource.obstacles_y[18])+1)*valueSource.obstacles_x[18]/Math.sqrt(valueSource.obstacles_x[18]*valueSource.obstacles_x[18]+valueSource.obstacles_y[18]*valueSource.obstacles_y[18])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[18]*valueSource.obstacles_x[18]+valueSource.obstacles_y[18]*valueSource.obstacles_y[18])+1)*valueSource.obstacles_y[18]/Math.sqrt(valueSource.obstacles_x[18]*valueSource.obstacles_x[18]+valueSource.obstacles_y[18]*valueSource.obstacles_y[18])
            opacity: 1

            NumberAnimation {
                target: obstacle_18
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[18]===1
            }
        }
        Image {
            id: obstacle_19
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[19]*valueSource.obstacles_x[19]+valueSource.obstacles_y[19]*valueSource.obstacles_y[19])+1)*valueSource.obstacles_x[19]/Math.sqrt(valueSource.obstacles_x[19]*valueSource.obstacles_x[19]+valueSource.obstacles_y[19]*valueSource.obstacles_y[19])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[19]*valueSource.obstacles_x[19]+valueSource.obstacles_y[19]*valueSource.obstacles_y[19])+1)*valueSource.obstacles_y[19]/Math.sqrt(valueSource.obstacles_x[19]*valueSource.obstacles_x[19]+valueSource.obstacles_y[19]*valueSource.obstacles_y[19])
            opacity: 1

            NumberAnimation {
                target: obstacle_19
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[19]===1
            }
        }
        Image {
            id: obstacle_20
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[20]*valueSource.obstacles_x[20]+valueSource.obstacles_y[20]*valueSource.obstacles_y[20])+1)*valueSource.obstacles_x[20]/Math.sqrt(valueSource.obstacles_x[20]*valueSource.obstacles_x[20]+valueSource.obstacles_y[20]*valueSource.obstacles_y[20])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[20]*valueSource.obstacles_x[20]+valueSource.obstacles_y[20]*valueSource.obstacles_y[20])+1)*valueSource.obstacles_y[20]/Math.sqrt(valueSource.obstacles_x[20]*valueSource.obstacles_x[20]+valueSource.obstacles_y[20]*valueSource.obstacles_y[20])
            opacity: 1

            NumberAnimation {
                target: obstacle_20
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[20]===1
            }
        }
        Image {
            id: obstacle_21
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[21]*valueSource.obstacles_x[21]+valueSource.obstacles_y[21]*valueSource.obstacles_y[21])+1)*valueSource.obstacles_x[21]/Math.sqrt(valueSource.obstacles_x[21]*valueSource.obstacles_x[21]+valueSource.obstacles_y[21]*valueSource.obstacles_y[21])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[21]*valueSource.obstacles_x[21]+valueSource.obstacles_y[21]*valueSource.obstacles_y[21])+1)*valueSource.obstacles_y[21]/Math.sqrt(valueSource.obstacles_x[21]*valueSource.obstacles_x[21]+valueSource.obstacles_y[21]*valueSource.obstacles_y[21])
            opacity: 1

            NumberAnimation {
                target: obstacle_21
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[21]===1
            }
        }
        Image {
            id: obstacle_22
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[22]*valueSource.obstacles_x[22]+valueSource.obstacles_y[22]*valueSource.obstacles_y[22])+1)*valueSource.obstacles_x[22]/Math.sqrt(valueSource.obstacles_x[22]*valueSource.obstacles_x[22]+valueSource.obstacles_y[22]*valueSource.obstacles_y[22])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[22]*valueSource.obstacles_x[22]+valueSource.obstacles_y[22]*valueSource.obstacles_y[22])+1)*valueSource.obstacles_y[22]/Math.sqrt(valueSource.obstacles_x[22]*valueSource.obstacles_x[22]+valueSource.obstacles_y[22]*valueSource.obstacles_y[22])
            opacity: 1

            NumberAnimation {
                target: obstacle_22
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[22]===1
            }
        }
        Image {
            id: obstacle_23
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[23]*valueSource.obstacles_x[23]+valueSource.obstacles_y[23]*valueSource.obstacles_y[23])+1)*valueSource.obstacles_x[23]/Math.sqrt(valueSource.obstacles_x[23]*valueSource.obstacles_x[23]+valueSource.obstacles_y[23]*valueSource.obstacles_y[23])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[23]*valueSource.obstacles_x[23]+valueSource.obstacles_y[23]*valueSource.obstacles_y[23])+1)*valueSource.obstacles_y[23]/Math.sqrt(valueSource.obstacles_x[23]*valueSource.obstacles_x[23]+valueSource.obstacles_y[23]*valueSource.obstacles_y[23])
            opacity: 1

            NumberAnimation {
                target: obstacle_23
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[23]===1
            }
        }
        Image {
            id: obstacle_24
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[24]*valueSource.obstacles_x[24]+valueSource.obstacles_y[24]*valueSource.obstacles_y[24])+1)*valueSource.obstacles_x[24]/Math.sqrt(valueSource.obstacles_x[24]*valueSource.obstacles_x[24]+valueSource.obstacles_y[24]*valueSource.obstacles_y[24])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[24]*valueSource.obstacles_x[24]+valueSource.obstacles_y[24]*valueSource.obstacles_y[24])+1)*valueSource.obstacles_y[24]/Math.sqrt(valueSource.obstacles_x[24]*valueSource.obstacles_x[24]+valueSource.obstacles_y[24]*valueSource.obstacles_y[24])
            opacity: 1

            NumberAnimation {
                target: obstacle_24
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[24]===1
            }
        }
        Image {
            id: obstacle_25
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[25]*valueSource.obstacles_x[25]+valueSource.obstacles_y[25]*valueSource.obstacles_y[25])+1)*valueSource.obstacles_x[25]/Math.sqrt(valueSource.obstacles_x[25]*valueSource.obstacles_x[25]+valueSource.obstacles_y[25]*valueSource.obstacles_y[25])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[25]*valueSource.obstacles_x[25]+valueSource.obstacles_y[25]*valueSource.obstacles_y[25])+1)*valueSource.obstacles_y[25]/Math.sqrt(valueSource.obstacles_x[25]*valueSource.obstacles_x[25]+valueSource.obstacles_y[25]*valueSource.obstacles_y[25])
            opacity: 1

            NumberAnimation {
                target: obstacle_25
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[25]===1
            }
        }
        Image {
            id: obstacle_26
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[26]*valueSource.obstacles_x[26]+valueSource.obstacles_y[26]*valueSource.obstacles_y[26])+1)*valueSource.obstacles_x[26]/Math.sqrt(valueSource.obstacles_x[26]*valueSource.obstacles_x[26]+valueSource.obstacles_y[26]*valueSource.obstacles_y[26])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[26]*valueSource.obstacles_x[26]+valueSource.obstacles_y[26]*valueSource.obstacles_y[26])+1)*valueSource.obstacles_y[26]/Math.sqrt(valueSource.obstacles_x[26]*valueSource.obstacles_x[26]+valueSource.obstacles_y[26]*valueSource.obstacles_y[26])
            opacity: 1

            NumberAnimation {
                target: obstacle_26
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[26]===1
            }
        }
        Image {
            id: obstacle_27
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[27]*valueSource.obstacles_x[27]+valueSource.obstacles_y[27]*valueSource.obstacles_y[27])+1)*valueSource.obstacles_x[27]/Math.sqrt(valueSource.obstacles_x[27]*valueSource.obstacles_x[27]+valueSource.obstacles_y[27]*valueSource.obstacles_y[27])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[27]*valueSource.obstacles_x[27]+valueSource.obstacles_y[27]*valueSource.obstacles_y[27])+1)*valueSource.obstacles_y[27]/Math.sqrt(valueSource.obstacles_x[27]*valueSource.obstacles_x[27]+valueSource.obstacles_y[27]*valueSource.obstacles_y[27])
            opacity: 1

            NumberAnimation {
                target: obstacle_27
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[27]===1
            }
        }
        Image {
            id: obstacle_28
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[28]*valueSource.obstacles_x[28]+valueSource.obstacles_y[28]*valueSource.obstacles_y[28])+1)*valueSource.obstacles_x[28]/Math.sqrt(valueSource.obstacles_x[28]*valueSource.obstacles_x[28]+valueSource.obstacles_y[28]*valueSource.obstacles_y[28])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[28]*valueSource.obstacles_x[28]+valueSource.obstacles_y[28]*valueSource.obstacles_y[28])+1)*valueSource.obstacles_y[28]/Math.sqrt(valueSource.obstacles_x[28]*valueSource.obstacles_x[28]+valueSource.obstacles_y[28]*valueSource.obstacles_y[28])
            opacity: 1

            NumberAnimation {
                target: obstacle_28
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[28]===1
            }
        }
        Image {
            id: obstacle_29
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[29]*valueSource.obstacles_x[29]+valueSource.obstacles_y[29]*valueSource.obstacles_y[29])+1)*valueSource.obstacles_x[29]/Math.sqrt(valueSource.obstacles_x[29]*valueSource.obstacles_x[29]+valueSource.obstacles_y[29]*valueSource.obstacles_y[29])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[29]*valueSource.obstacles_x[29]+valueSource.obstacles_y[29]*valueSource.obstacles_y[29])+1)*valueSource.obstacles_y[29]/Math.sqrt(valueSource.obstacles_x[29]*valueSource.obstacles_x[29]+valueSource.obstacles_y[29]*valueSource.obstacles_y[29])
            opacity: 1

            NumberAnimation {
                target: obstacle_29
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[29]===1
            }
        }
        Image {
            id: obstacle_30
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[30]*valueSource.obstacles_x[30]+valueSource.obstacles_y[30]*valueSource.obstacles_y[30])+1)*valueSource.obstacles_x[30]/Math.sqrt(valueSource.obstacles_x[30]*valueSource.obstacles_x[30]+valueSource.obstacles_y[30]*valueSource.obstacles_y[30])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[30]*valueSource.obstacles_x[30]+valueSource.obstacles_y[30]*valueSource.obstacles_y[30])+1)*valueSource.obstacles_y[30]/Math.sqrt(valueSource.obstacles_x[30]*valueSource.obstacles_x[30]+valueSource.obstacles_y[30]*valueSource.obstacles_y[30])
            opacity: 1

            NumberAnimation {
                target: obstacle_30
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[30]===1
            }
        }
        Image {
            id: obstacle_31
            source: "qrc:/images/dynamic/target_dot.png"
            width: obstacles.dotSize
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenterOffset: parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[31]*valueSource.obstacles_x[31]+valueSource.obstacles_y[31]*valueSource.obstacles_y[31])+1)*valueSource.obstacles_x[31]/Math.sqrt(valueSource.obstacles_x[31]*valueSource.obstacles_x[31]+valueSource.obstacles_y[31]*valueSource.obstacles_y[31])
            anchors.verticalCenterOffset: -parent.width/15 * Math.log(Math.sqrt(valueSource.obstacles_x[31]*valueSource.obstacles_x[31]+valueSource.obstacles_y[31]*valueSource.obstacles_y[31])+1)*valueSource.obstacles_y[31]/Math.sqrt(valueSource.obstacles_x[31]*valueSource.obstacles_x[31]+valueSource.obstacles_y[31]*valueSource.obstacles_y[31])
            opacity: 1

            NumberAnimation {
                target: obstacle_31
                property: "opacity"
                duration: obstacles.dotDuration
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
                running: valueSource.obstacles_flag[31]===1
            }
        }
        /*End*/
    }
    Image {
        id: dynamic_scaner
        source: "qrc:/images/dynamic/dynamic_scan.png"
        width: parent.width
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        opacity: 1
        rotation: 0
        NumberAnimation {
            target: dynamic_scaner
            property: "rotation"
            duration: 2000
            easing.type: Easing.Linear
            from: 0
            to: 360
            running: true
            loops: Animation.Infinite
        }
    }
    Item{
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom
        Image {
            id: chassis
            source: "qrc:/images/dynamic/chassis.png"
            width:parent.width*0.5
            height: width * 386 / 258
            //fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: parent.width * 0.05
        }
        Image {
            id: fl_wheel
            source: "qrc:/images/dynamic/wheel_green.png"
            width: parent.width * 0.06
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -parent.width * 0.32
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -parent.width * 0.2
            rotation: valueSource.str_ang_fl
        }
        Image {
            id: fr_wheel
            source: "qrc:/images/dynamic/wheel_green.png"
            width: parent.width * 0.06
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -parent.width * 0.32
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.width * 0.2
            rotation: valueSource.str_ang_fr
        }
        Image {
            id: g_g_circle
            source: "qrc:/images/dynamic/g_g_circle.png"
            width: parent.width * 0.5
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: width*valueSource.latrl_aclrtn*0.1
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: height*valueSource.longi_aclrtn*0.1
            Text {
                id: g_g_value
                text: valueSource.g_value.toFixed(2)+"G"
                color: "red"
                font.pixelSize: 0.2 * parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    // Image {
    //     id: withOutTruck
    //     source: "qrc:/images/dynamic/without_truck.png"
    //     width: parent.width
    //     height: width/1081*602
    //     anchors.right: parent.right
    //     anchors.top: parent.top
    //     anchors.topMargin: width*2.3
    // }
    // Image {
    //     id: truck
    //     source: "qrc:/images/dynamic/truck.png"
    //     height: withOutTruck.height
    //     width: 1707/603*height
    //     anchors.horizontalCenter: withOutTruck.left
    //     anchors.top: withOutTruck.top
    //     rotation: -valueSource.liftAng
    // }
}
