import QtQuick 2.0
import Can0Tx 1.0
import Can1Tx 1.0


Item {
    // CRC-8 function
    function crc8(data) {
        var crc = 0x00;
        var poly = 0x1D;  // CRC-8 polynomial
        for (var i = 0; i < data.length; i++) {
            crc ^= data[i];
            for (var bit = 8; bit > 0; bit--) {
                if (crc & 0x80) {
                    crc = (crc << 1) ^ poly;
                } else {
                    crc <<= 1;
                }
                crc &= 0xFF;  // Keep CRC value in 8-bit range
            }
        }
        return crc;
    }

    // CRC-16 function
    function crc16(data) {
        var crc = 0xFFFF;
        var poly = 0x1021;  // CRC-8 polynomial
        for (var i = 0; i < data.length; i++) {
            crc ^= data[i] << 8;
            for (var bit = 8; bit > 0; bit--) {
                if (crc & 0x8000) {
                    crc = (crc << 1) ^ poly;
                } else {
                    crc <<= 1;
                }
                crc &= 0xFFFF;  // Keep CRC value in 8-bit range
            }
        }
        return crc;
    }

    // Profile1 function
    function profile1(data_id, data, counter) {
        var chksum = 0x00;
        if (counter % 2) {
            data.unshift((data_id >> 8) & 0xFF);
        }else {
            data.unshift(data_id & 0xFF);
        }
        data.push(counter);
        chksum = crc8(data);
        return chksum;
    }

    Can0Tx{
        id: ccan;
    }
    // XPU_IPB_ADASToqCtrl
    // Signals:
    property int xpu_CDD_TgtBrkTq: -valueSource.deceleration * 12000 / 40 // E2E_Order1
    property int xpu_CDD_TgtBrkTqReq: valueSource.driveMode  // E2E_Order2
    property int xpu_CDD_TgtBrkTqVD: valueSource.driveMode  // E2E_Order3
    property int xpu_CDD_PrefillReq: 0  // E2E_Order4
    property int xpu_AD_EPBReq: 0 // E2E_Order5
    property int xpu_AD_EPBReqVD: 0 // E2E_Order6
    property int xpu_APA_EPBReq: 0 // E2E_Order7
    property int xpu_APA_EPBReqVD: 0 // E2E_Order8
    property int xpu_CDD_BrakeFunctionMode: valueSource.driveMode?2:0 // E2E_Order9
    property int xpu_CDD_TgtBRkTq_Type: valueSource.driveMode
    property int xpu_IPB_CDDCtrlMsgCounter: 0
    property int xpu_IPB_CDDCtrlE2EChecksum: 0
    // Message:
    property int xpu_IPB_ADASToqCtrl_ID: 0x100
    property int xpu_IPB_ADASToqCtrl_Data_ID: 0x001
    property int xpu_IPB_ADASToqCtrl_DLC: 8
    property int xpu_IPB_ADASToqCtrl_Byte0: (xpu_CDD_TgtBrkTq >> 4) & 0xFF
    property int xpu_IPB_ADASToqCtrl_Byte1: ((xpu_CDD_TgtBrkTq & 0xF) << 4) + (xpu_CDD_TgtBrkTqReq << 3) + (xpu_CDD_TgtBrkTqVD << 2) + xpu_CDD_TgtBRkTq_Type
    property int xpu_IPB_ADASToqCtrl_Byte2: xpu_CDD_PrefillReq << 6
    property int xpu_IPB_ADASToqCtrl_Byte3: 0
    property int xpu_IPB_ADASToqCtrl_Byte4: (xpu_AD_EPBReq << 2) + (xpu_AD_EPBReqVD << 1) +  (xpu_APA_EPBReq >> 1)
    property int xpu_IPB_ADASToqCtrl_Byte5: ((xpu_APA_EPBReq & 0x1) << 7) + (xpu_APA_EPBReqVD << 6) + (xpu_CDD_BrakeFunctionMode >> 1)
    property int xpu_IPB_ADASToqCtrl_Byte6: ((xpu_CDD_BrakeFunctionMode & 0x1) << 7) + xpu_IPB_CDDCtrlMsgCounter
    // XPU_EPS_AngCtrl
    // Signals:
    property int xpu_EPS_AutoModeReq: valueSource.driveMode // E2E_Order1
    property int xpu_EPS_AutoModeReqVD: valueSource.driveMode // E2E_Order2
    property int xpu_EPS_SteerAngleReqVD: valueSource.driveMode // E2E_Order3
    property int xpu_EPS_AngCtrlFailSt: 0 // E2E_Order4
    property int xpu_EPS_SteerAngleReq: (valueSource.str_whl_ang + 780) / 0.1 // E2E_Order5
    property int xpu_EPS_AngCtrlMode: valueSource.driveMode // E2E_Order6
    property int xpu_EPS_AngCtrlModeVD: valueSource.driveMode // E2E_Order7
    property int xpu_EPS_AngCtrlMsgCounter: 0
    property int xpu_EPS_AngCtrlE2EChecksum: 0
    // Message:
    property int xpu_EPS_AngCtrl_ID: 0x108
    property int xpu_EPS_AngCtrl_Data_ID: 0x801
    property int xpu_EPS_AngCtrl_DLC: 8
    property int xpu_EPS_AngCtrl_Byte0: (xpu_EPS_AutoModeReq << 6) + (xpu_EPS_AutoModeReqVD << 5) + (xpu_EPS_SteerAngleReqVD << 3) + (xpu_EPS_AngCtrlFailSt << 2)
    property int xpu_EPS_AngCtrl_Byte1: (xpu_EPS_SteerAngleReq >> 8) & 0xFF
    property int xpu_EPS_AngCtrl_Byte2: xpu_EPS_SteerAngleReq & 0xFF
    property int xpu_EPS_AngCtrl_Byte3: (xpu_EPS_AngCtrlMode << 5) + (xpu_EPS_AngCtrlModeVD << 4)
    property int xpu_EPS_AngCtrl_Byte4: 0
    property int xpu_EPS_AngCtrl_Byte5: 0
    property int xpu_EPS_AngCtrl_Byte6: xpu_EPS_AngCtrlMsgCounter
    // property int xpu_EPS_AngCtrl_Byte7: xpu_EPS_AngCtrlE2EChecksum

    Timer{
        interval: 10; running: valueSource.onCAN; repeat: true
        onTriggered: {
            // XPU_IPB_ADASToqCtrl
            if(xpu_IPB_CDDCtrlMsgCounter > 14) {
                xpu_IPB_CDDCtrlMsgCounter = xpu_IPB_CDDCtrlMsgCounter % 14
            }
            
            var xpu_IPB_ADASToqCtrl_E2E_data = [(xpu_CDD_TgtBrkTq >> 8) & 0xFF, xpu_CDD_TgtBrkTq & 0xFF, 
                                                xpu_CDD_TgtBrkTqReq, xpu_CDD_TgtBrkTqVD, xpu_CDD_PrefillReq >> 8,
                                                xpu_AD_EPBReq, xpu_AD_EPBReqVD, xpu_APA_EPBReq, xpu_APA_EPBReqVD]
            xpu_IPB_CDDCtrlE2EChecksum = profile1(xpu_IPB_ADASToqCtrl_Data_ID, xpu_IPB_ADASToqCtrl_E2E_data, xpu_IPB_CDDCtrlMsgCounter)
            var xpu_IPB_ADASToqCtrl_data = [xpu_IPB_ADASToqCtrl_Byte0, xpu_IPB_ADASToqCtrl_Byte1, 
                                            xpu_IPB_ADASToqCtrl_Byte2, xpu_IPB_ADASToqCtrl_Byte3,
                                            xpu_IPB_ADASToqCtrl_Byte4, xpu_IPB_ADASToqCtrl_Byte5,
                                            xpu_IPB_ADASToqCtrl_Byte6, xpu_IPB_CDDCtrlE2EChecksum]
            console.log("E2E Data: 0x" +   xpu_IPB_ADASToqCtrl_E2E_data.map(num => num.toString(16)))
            console.log("CAN Data: 0x" +   xpu_IPB_ADASToqCtrl_data.map(num => num.toString(16)))
            ccan.sendCanFdFrame(xpu_IPB_ADASToqCtrl_ID, xpu_IPB_ADASToqCtrl_DLC,
                [xpu_IPB_ADASToqCtrl_Byte0, xpu_IPB_ADASToqCtrl_Byte1, xpu_IPB_ADASToqCtrl_Byte2, xpu_IPB_ADASToqCtrl_Byte3,
                 xpu_IPB_ADASToqCtrl_Byte4, xpu_IPB_ADASToqCtrl_Byte5, xpu_IPB_ADASToqCtrl_Byte6, xpu_IPB_CDDCtrlE2EChecksum]
            )
            xpu_IPB_CDDCtrlMsgCounter++
            
            // XPU_EPS_AngCtrl
            if(xpu_EPS_AngCtrlMsgCounter > 14) {
                xpu_EPS_AngCtrlMsgCounter = xpu_EPS_AngCtrlMsgCounter % 14
            }
            
            var xpu_EPS_AngCtrl_E2E_data = [xpu_EPS_AutoModeReq, xpu_EPS_AutoModeReqVD,
                                            xpu_EPS_SteerAngleReqVD, xpu_EPS_AngCtrlFailSt, 
                                            xpu_EPS_SteerAngleReq >> 8, xpu_EPS_SteerAngleReq & 0xFF,
                                            xpu_EPS_AngCtrlMode, xpu_EPS_AngCtrlModeVD]
            xpu_EPS_AngCtrlE2EChecksum = profile1(xpu_EPS_AngCtrl_Data_ID, xpu_EPS_AngCtrl_E2E_data, xpu_EPS_AngCtrlMsgCounter)
            var xpu_EPS_AngCtrl_data = [xpu_EPS_AngCtrl_Byte0, xpu_EPS_AngCtrl_Byte1, 
                                        xpu_EPS_AngCtrl_Byte2, xpu_EPS_AngCtrl_Byte3,
                                        xpu_EPS_AngCtrl_Byte4, xpu_EPS_AngCtrl_Byte5,
                                        xpu_EPS_AngCtrl_Byte6, xpu_EPS_AngCtrlE2EChecksum]
            console.log("E2E Data: 0x" +   xpu_EPS_AngCtrl_E2E_data.map(num => num.toString(16)))
            console.log("CAN Data: 0x" +   xpu_EPS_AngCtrl_data.map(num => num.toString(16)))
            ccan.sendCanFdFrame(xpu_EPS_AngCtrl_ID, xpu_EPS_AngCtrl_DLC,
                [xpu_EPS_AngCtrl_Byte0, xpu_EPS_AngCtrl_Byte1, xpu_EPS_AngCtrl_Byte2, xpu_EPS_AngCtrl_Byte3,
                 xpu_EPS_AngCtrl_Byte4, xpu_EPS_AngCtrl_Byte5, xpu_EPS_AngCtrl_Byte6, xpu_EPS_AngCtrlE2EChecksum]
            )
            xpu_EPS_AngCtrlMsgCounter++             
        }
    }

    Can1Tx{
        id: ican;
    }
    // XPU_LDCU_CtrlAndReq
    // Signals:
    property int xpu_LDCU_DriveMode: 0
    property int xpu_LDCU_VehWheelTorqReq: valueSource.throttle * 4
    property int xpu_LDCU_VehWheelTorqReqVD: valueSource.driveMode
    property int xpu_LDCU_ReadyOnReq: 0
    property int xpu_LDCU_GearReq: valueSource.gearStat
    property int xpu_LDCU_APmode: valueSource.driveMode
    property int xpu_LDCU_Ctrl_ctRoll: 0
    property int xpu_LDCU_Ctrl_CRC16Checksum: 0
    // Message:
    property int xpu_LDCU_CtrlAndReq_ID: 0x13E
    property int xpu_LDCU_CtrlAndReq_DLC: 16
    property int xpu_LDCU_CtrlAndReq_Byte0: (xpu_LDCU_DriveMode << 6) + (xpu_LDCU_VehWheelTorqReq >> 6)
    property int xpu_LDCU_CtrlAndReq_Byte1: ((xpu_LDCU_VehWheelTorqReq & 0x3F) << 2) + xpu_LDCU_ReadyOnReq
    property int xpu_LDCU_CtrlAndReq_Byte2: (xpu_LDCU_VehWheelTorqReqVD << 7) + (xpu_LDCU_GearReq << 4)
    property int xpu_LDCU_CtrlAndReq_Byte3: 0
    property int xpu_LDCU_CtrlAndReq_Byte4: 0
    property int xpu_LDCU_CtrlAndReq_Byte5: xpu_LDCU_APmode << 2
    property int xpu_LDCU_CtrlAndReq_Byte6: 0
    property int xpu_LDCU_CtrlAndReq_Byte7: 0
    property int xpu_LDCU_CtrlAndReq_Byte8: 0
    property int xpu_LDCU_CtrlAndReq_Byte9: 0
    property int xpu_LDCU_CtrlAndReq_Byte10: xpu_LDCU_Ctrl_ctRoll
    property int xpu_LDCU_CtrlAndReq_Byte11: xpu_LDCU_Ctrl_CRC16Checksum >> 8
    property int xpu_LDCU_CtrlAndReq_Byte12: xpu_LDCU_Ctrl_CRC16Checksum & 0xFF
    property int xpu_LDCU_CtrlAndReq_Byte13: 0
    property int xpu_LDCU_CtrlAndReq_Byte14: 0
    property int xpu_LDCU_CtrlAndReq_Byte15: 0

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
        interval: 10; running: valueSource.onCAN; repeat: true
        onTriggered: {
            if(xpu_LDCU_Ctrl_ctRoll > 255) xpu_LDCU_Ctrl_ctRoll = 0
            var xpu_LDCU_CtrlAndReq_data = [xpu_LDCU_CtrlAndReq_Byte0, xpu_LDCU_CtrlAndReq_Byte1, 
                                            xpu_LDCU_CtrlAndReq_Byte2, xpu_LDCU_CtrlAndReq_Byte3,
                                            xpu_LDCU_CtrlAndReq_Byte4, xpu_LDCU_CtrlAndReq_Byte5, 
                                            xpu_LDCU_CtrlAndReq_Byte6, xpu_LDCU_CtrlAndReq_Byte7,
                                            xpu_LDCU_CtrlAndReq_Byte8, xpu_LDCU_CtrlAndReq_Byte9, 
                                            xpu_LDCU_CtrlAndReq_Byte10]
            xpu_LDCU_Ctrl_CRC16Checksum = crc16(xpu_LDCU_CtrlAndReq_data)
            console.log("CAN Data: 0x" +   xpu_LDCU_CtrlAndReq_data.map(num => num.toString(16)) + "," + xpu_LDCU_Ctrl_CRC16Checksum.toString(16))
            ican.sendCanFdFrame(xpu_LDCU_CtrlAndReq_ID, xpu_LDCU_CtrlAndReq_DLC,
                [
                    xpu_LDCU_CtrlAndReq_Byte0, xpu_LDCU_CtrlAndReq_Byte1, xpu_LDCU_CtrlAndReq_Byte2, xpu_LDCU_CtrlAndReq_Byte3,
                    xpu_LDCU_CtrlAndReq_Byte4, xpu_LDCU_CtrlAndReq_Byte5, xpu_LDCU_CtrlAndReq_Byte6, xpu_LDCU_CtrlAndReq_Byte7,
                    xpu_LDCU_CtrlAndReq_Byte8, xpu_LDCU_CtrlAndReq_Byte9, xpu_LDCU_CtrlAndReq_Byte10, xpu_LDCU_CtrlAndReq_Byte11,
                    xpu_LDCU_CtrlAndReq_Byte12, xpu_LDCU_CtrlAndReq_Byte13, xpu_LDCU_CtrlAndReq_Byte14, xpu_LDCU_CtrlAndReq_Byte15
                ]
            )
            xpu_LDCU_Ctrl_ctRoll++
        }
    }
    
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
