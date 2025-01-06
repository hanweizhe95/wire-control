import QtQuick 2.0
import Can0Tx 1.0
import Can1Tx 1.0

Item {
    Can0Tx{
        id: ccan;
    }

    Can1Tx{
        id: ican;
    }
    // XPU_BodyCtrl
    // Signals:
    property int xpu_TwoMirrorSw: valueSource.liftStat
    property int xpu_RDCUHornReq: valueSource.horn_on
    // Message:
    property int xpu_BodyCtrl_ID: 0x239
    property int xpu_BodyCtrl_DLC: 8
    property int xpu_BodyCtrl_Byte0: 0
    property int xpu_BodyCtrl_Byte1: 0
    property int xpu_BodyCtrl_Byte2: 0
    property int xpu_BodyCtrl_Byte3: 0
    property int xpu_BodyCtrl_Byte4: 0
    property int xpu_BodyCtrl_Byte5: xpu_TwoMirrorSw << 6
    property int xpu_BodyCtrl_Byte6: xpu_RDCUHornReq << 4
    property int xpu_BodyCtrl_Byte7: 0

    // XPU_BodyCtrl2
    // Signals:
    property int xpu_LDCU_HVPowerReq: valueSource.engine_start + 1
    property int xpu_PowerReqVD: valueSource.driveMode
    property int xpu_PowerReq: !valueSource.engine_start + 1
    property int xpu_RDCU_TurnLight: valueSource.turnIndicator
    property int xpu_RDCU_ADASFUnctionLampSt: valueSource.driveMode
    property int xpu_configuration_remote_update: 0
    property int xpu_BodyCtrl2_ctRoll: 0
    property int xpu_BodyCtrl2_CRC16Checksum: 0
    // Message:
    property int xpu_BodyCtrl2_ID: 0x231
    property int xpu_BodyCtrl2_DLC: 16
    property int xpu_BodyCtrl2_Byte0: xpu_RDCU_TurnLight << 5 + xpu_PowerReq << 3 + xpu_PowerReqVD << 2 + xpu_LDCU_HVPowerReq
    property int xpu_BodyCtrl2_Byte1: xpu_configuration_remote_update << 6 + xpu_RDCU_ADASFUnctionLampSt << 4
    property int xpu_BodyCtrl2_Byte2: 0
    property int xpu_BodyCtrl2_Byte3: 0
    property int xpu_BodyCtrl2_Byte4: 0
    property int xpu_BodyCtrl2_Byte5: 0
    property int xpu_BodyCtrl2_Byte6: 0
    property int xpu_BodyCtrl2_Byte7: 0
    property int xpu_BodyCtrl2_Byte8: 0
    property int xpu_BodyCtrl2_Byte9: 0
    property int xpu_BodyCtrl2_Byte10: xpu_BodyCtrl2_ctRoll
    property int xpu_BodyCtrl2_Byte11: xpu_BodyCtrl2_CRC16Checksum >> 8
    property int xpu_BodyCtrl2_Byte12: xpu_BodyCtrl2_CRC16Checksum & 0xFF
    property int xpu_BodyCtrl2_Byte13: 0
    property int xpu_BodyCtrl2_Byte14: 0
    property int xpu_BodyCtrl2_Byte15: 0

    Timer{
        interval: 50; running: valueSource.onCAN; repeat: true
        onTriggered: {
            ican.sendCanFdFrame(xpu_BodyCtrl_ID, xpu_BodyCtrl_DLC,
                [
                    xpu_BodyCtrl_Byte0, xpu_BodyCtrl_Byte1, xpu_BodyCtrl_Byte2, xpu_BodyCtrl_Byte3,
                    xpu_BodyCtrl_Byte4, xpu_BodyCtrl_Byte5, xpu_BodyCtrl_Byte6, xpu_BodyCtrl_Byte7
                ]
            )
            ican.sendCanFdFrame(xpu_BodyCtrl2_ID, xpu_BodyCtrl2_DLC,
                [
                    xpu_BodyCtrl2_Byte0, xpu_BodyCtrl2_Byte1, xpu_BodyCtrl2_Byte2, xpu_BodyCtrl2_Byte3,
                    xpu_BodyCtrl2_Byte4, xpu_BodyCtrl2_Byte5, xpu_BodyCtrl2_Byte6, xpu_BodyCtrl2_Byte7,
                    xpu_BodyCtrl2_Byte8, xpu_BodyCtrl2_Byte9, xpu_BodyCtrl2_Byte10, xpu_BodyCtrl2_Byte11,
                    xpu_BodyCtrl2_Byte12, xpu_BodyCtrl2_Byte13, xpu_BodyCtrl2_Byte14, xpu_BodyCtrl2_Byte15
                ]
            )
        }
    }

}
