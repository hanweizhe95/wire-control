#ifndef CANTX_H
#define CANTX_H

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
#include <vector>
using namespace std;

class CanTx: public QObject
{
    Q_OBJECT


public:
    explicit CanTx(QObject *parent = nullptr);
    ~CanTx();
    int m_socket_send;
    Q_INVOKABLE void sendframe(uint id, int byte0, int byte1, int byte2, int byte3, int byte4, int byte5, int byte6, int byte7);
    Q_INVOKABLE void sendCanFdFrame(uint id, uint dlc, QList<uint> data);
signals:

public slots:

private:
    struct can_frame frame_send;
    struct canfd_frame frame_fd_send;
};

#endif // CANTX_H
