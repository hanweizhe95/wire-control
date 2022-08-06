#ifndef CAN1TX_H
#define CAN1TX_H

#include <QObject>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <linux/can.h>
#include <linux/can/raw.h>
#include <QVariantList>

class Can1Tx:public QObject
{
    Q_OBJECT


public:
    explicit Can1Tx(QObject *parent = nullptr);
    ~Can1Tx();
    Q_INVOKABLE void sendframe(uint CANid, int Byte0, int Byte1, int Byte2, int Byte3, int Byte4, int Byte5, int Byte6, int Byte7);

signals:


public slots:


private:

    struct can_frame frame_send;
    int m_socket_send;



};

#endif // CAN1TX_H
