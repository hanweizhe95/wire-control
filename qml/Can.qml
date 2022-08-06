import QtQuick 2.0
import Can0Tx 1.0

Item {
    Can0Tx{
        id: can0tx;
    }

    Timer{
        interval: 20; running: valueSource.onCAN; repeat: true
        onTriggered: {
            //TX
            //console.log(valueSource.driveMode)
            can0tx.sendframe(0x60,valueSource.driveMode,valueSource.engine_start+16,0,0,0,0,0,0)
            can0tx.sendframe(0x62,
                                valueSource.throttle,
                                valueSource.rvv_spd/0.00390625%256,
                                Math.floor(valueSource.rvv_spd/0.00390625/256),
                                valueSource.rvv_on,
                                1,0,0,0)
            can0tx.sendframe(0x64,
                                (valueSource.str_ang+157.5)*10%256,
                                (valueSource.str_ang+157.5)*10/256,
                                30,1+valueSource.lka_on*2,0,0,0,0)
            can0tx.sendframe(0x66,
                                valueSource.gearStat,
                                1,0,0,0,0,0,0)
            can0tx.sendframe(0x68,
                                0,0,
                                (valueSource.deceleration+15.687)/0.00048828125%256,
                                Math.floor((valueSource.deceleration+15.687)/0.00048828125/256),
                                1,16+valueSource.epb_on,
                                0,0)
            can0tx.sendframe(0x6A,
                                valueSource.liftStat+
                                valueSource.turnIndicator*4+
                                valueSource.lowBeam_on*16+
                                valueSource.highBeam_on*32+
                                valueSource.horn_on*64+
                                valueSource.fog_on*128,
                                0,
                                valueSource.back_on*4+
                                valueSource.wiperIndicator*32+
                                valueSource.wiperCleaner*128,
                                3,0,0,0,0)
        }
    }
}
