import QtQuick 2.0

import QtQuick 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Item {
    id: iconAlert
    visible: valueSource.alerts
    property real iconsize: container.height * 0.06
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //Alerts icons below gear information start here.
    Image {
        id: alertEPBIcon
        visible: valueSource.alertEPB
        source: "qrc:/images/electric_parking_brake.png"
        height: iconsize
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.02
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:

    }
    Image {
        id: alertABSIcon
        visible: valueSource.alertABS
        source: "qrc:/images/abs_defect.png"
        height: iconsize
        anchors.right: alertEPBIcon.left
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.02
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertFootOnBrakePedalIcon
        visible: valueSource.alertFootOnBrakePedal
        source: "qrc:/images/foot_on_brake_pedal.png"
        height: iconsize
        anchors.right: alertABSIcon.left
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.02
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertWornOutBrakePadIcon
        visible: valueSource.alertWornOutBrakePad
        source: "qrc:/images/worn_out_brake_pad.png"
        height: iconsize
        anchors.right: alertFootOnBrakePedalIcon.left
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.02
        fillMode: Image.PreserveAspectFit
    }
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //Alert icons to the left of speed meter start here:
    /*Image {
        id: alertSTTonIcon
        visible: valueSource.alertSTTon
        source: "qrc:/images/stt_on.png"
        height: iconsize
        anchors.right: alertFootOnBrakePedalIcon.left
        anchors.rightMargin: container.height * 0.275
        anchors.top: parent.top
        anchors.topMargin: container.height * 0.2
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertBatteryIcon
        visible: valueSource.alertBattery
        source: "qrc:/images/battery_charging.png"
        height: iconsize
        anchors.right: alertFootOnBrakePedalIcon.left
        anchors.rightMargin: container.height * 0.235
        anchors.top: parent.top
        anchors.topMargin: container.height * 0.26
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertOilPressureIcon
        visible: valueSource.alertOilPressure
        source: "qrc:/images/oil_pressure.png"
        height: iconsize
        anchors.right: alertFootOnBrakePedalIcon.left
        anchors.rightMargin: container.height * 0.315
        anchors.top: parent.top
        anchors.topMargin: container.height * 0.26
        fillMode: Image.PreserveAspectFit
    }*/
    Image {
        id: alertFuelEmptyIcon
        visible: valueSource.alertFuelEmpty
        source: "qrc:/images/fuel_empty.png"
        height: iconsize
        anchors.right: alertFootOnBrakePedalIcon.left
        anchors.rightMargin: container.height * 0.6
        anchors.top: parent.top
        anchors.topMargin: container.height * 0.2
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertWaterInDieselFilterIcon
        visible: valueSource.alertWaterInDieselFilter
        source: "qrc:/images/water_in_diesel_filter.png"
        height: iconsize
        anchors.right: alertFootOnBrakePedalIcon.left
        anchors.rightMargin: container.height * 0.55
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.03
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertEOBDIcon
        visible: valueSource.alertEOBD
        source: "qrc:/images/eobd.png"
        height: iconsize
        anchors.right: alertFootOnBrakePedalIcon.left
        anchors.rightMargin: container.height * 0.63
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.03
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertOilLevelIcon
        visible: valueSource.alertOilLevel
        source: "qrc:/images/oil_level.png"
        height: iconsize
        anchors.right: alertFootOnBrakePedalIcon.left
        anchors.rightMargin: container.height * 0.62
        anchors.top: parent.top
        anchors.topMargin: container.height * 0.03
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertLDWLeftIcon
        visible: valueSource.alertLDWLeft
        source: "qrc:/images/LDW_left.png"
        height: iconsize
        anchors.right: alertFootOnBrakePedalIcon.left
        anchors.rightMargin: container.height * 0.025
        anchors.top: parent.top
        anchors.topMargin: container.height * -0.085
        fillMode: Image.PreserveAspectFit
    }
    //Alert icons to the left of speed meter end here.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Image {
        id: alertBrakeIcon
        visible: valueSource.alertBrake
        source: "qrc:/images/brake_default.png"
        height: iconsize
        anchors.left: alertEPBIcon.right
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.02
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertFrontFogIcon
        visible: valueSource.alertFrontFog
        source: "qrc:/images/front_fog_light.png"
        height: iconsize
        anchors.left: alertBrakeIcon.right
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.02
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertRearFogIcon
        visible: valueSource.alertRearFog
        source: "qrc:/images/rear_fog_light.png"
        height: iconsize
        anchors.left: alertFrontFogIcon.right
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.02
        fillMode: Image.PreserveAspectFit
    }

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //Alert icons to the right of tachometer start here:

    Image {
        id: alertWaterEmpty
        visible: valueSource.alertWaterEmpty
        source: "qrc:/images/water_empty.png"
        height: iconsize
        anchors.left: alertFrontFogIcon.right
        anchors.leftMargin: container.height * 0.63
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.03
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertLDWRightIcon
        visible: valueSource.alertLDWRight
        source: "qrc:/images/LDW_right.png"
        height: iconsize
        anchors.left: alertFrontFogIcon.right
        anchors.leftMargin: container.height * 0.025
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.085
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: alertLightBulbBlown
        visible: valueSource.alertLightBulbBlown
        source: "qrc:/images/light_bulb_blown.png"
        height: iconsize
        anchors.left: alertFrontFogIcon.right
        anchors.leftMargin: container.height * 0.55
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.03
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: alertWaterIcon
        visible: valueSource.alertWater
        source: "qrc:/images/water.png"
        height: iconsize
        anchors.left: alertFrontFogIcon.right
        anchors.leftMargin: container.height * 0.6
        anchors.top: parent.top
        anchors.topMargin: container.height * 0.2
        fillMode: Image.PreserveAspectFit
    }


    //Alert icons to the right of tachometer end here.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    //Alerts icons below gear information end here.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //Alert icons above gear information start here:
    Image {
        id: alertSeatBeltIcon
        visible: valueSource.alertSeatBelt
        source: "qrc:/images/seat_belt.png"
        height: iconsize
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.15
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:
    }
    Image {
        id: alertLowBeamAutoIcon
        visible: valueSource.alertLowBeamAuto
        source: "qrc:/images/low_beam_auto.png"
        height: iconsize
        anchors.left: alertSeatBeltIcon.right
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.15
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:

    }
    Image {
        id: alertLowBeamIcon
        visible: valueSource.alertLowBeam
        source: "qrc:/images/low_beam.png"
        height: iconsize
        anchors.left: alertLowBeamAutoIcon.right
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.15
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:

    }
    Image {
        id: alertHighBeamIcon
        visible: valueSource.alertHighBeam
        source: "qrc:/images/high_beam.png"
        height: iconsize
        anchors.left: alertLowBeamIcon.right
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.15
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:
    }
    Image {
        id: alertWidthLightIcon
        visible: valueSource.alertWidthLight
        source: "qrc:/images/width_light.png"
        height: iconsize
        anchors.left: alertHighBeamIcon.right
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.15
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:
    }

    Image {
        id: alertFlatTyreIcon
        visible: valueSource.alertFlatTyre
        source: "qrc:/images/flat_tyre.png"
        height: iconsize
        anchors.right: alertSeatBeltIcon.left
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.15
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:

    }

    Image {
        id: alertESPonIcon
        visible: valueSource.alertESPon
        source: "qrc:/images/esp_on.png"
        height: iconsize
        anchors.right: alertFlatTyreIcon.left
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.15
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:

    }
    Image {
        id: alertESPoffIcon
        visible: valueSource.alertESPoff
        source: "qrc:/images/esp_off.png"
        height: iconsize
        anchors.right: alertESPonIcon.left
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.15
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:
    }
    Image {
        id: alertWiperAutoIcon
        visible: valueSource.alertWiperAuto
        source: "qrc:/images/wiper_auto.png"
        height: iconsize
        anchors.right: alertESPoffIcon.left
        anchors.top: parent.top
        anchors.topMargin: -container.height * 0.15
        fillMode: Image.PreserveAspectFit
        //anchors.bottomMargin:
    }
    //Alerts icons above gear information end here.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}
