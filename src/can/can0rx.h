#ifndef CAN0RX_H
#define CAN0RX_H

#include "canRx.h"
#include <QThread>
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


class Can0MoveToThread: public CanMoveToThread
{
public:
    Can0MoveToThread(QObject* parent=nullptr);
    ~Can0MoveToThread();
};

class Canfd0MoveToThread: public CanfdMoveToThread
{
public:
    Canfd0MoveToThread(QObject* parent=nullptr);
    ~Canfd0MoveToThread();
};
#endif // CAN0RX_H
