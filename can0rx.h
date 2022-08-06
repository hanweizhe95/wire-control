#ifndef CAN0RX_H
#define CAN0RX_H

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

class Can0Rx : public QObject
{
    Q_OBJECT
public:
    Can0Rx(QObject *parent = nullptr);

signals:
    void dataRecved(struct can_frame data);

public slots:
    void canWork();
    void canClose();

private:
    struct can_frame frame;
    int m_socket;
    struct can_frame msg;
    struct can_frame msg_;
};

class Can0MoveToThread: public QObject
{
    Q_OBJECT
    Q_PROPERTY(uint id MEMBER id)
    Q_PROPERTY(uint byte0 MEMBER byte0)
    Q_PROPERTY(uint byte1 MEMBER byte1)
    Q_PROPERTY(uint byte2 MEMBER byte2)
    Q_PROPERTY(uint byte3 MEMBER byte3)
    Q_PROPERTY(uint byte4 MEMBER byte4)
    Q_PROPERTY(uint byte5 MEMBER byte5)
    Q_PROPERTY(uint byte6 MEMBER byte6)
    Q_PROPERTY(uint byte7 MEMBER byte7)

public:
    Can0MoveToThread(QObject* parent=nullptr);
    ~Can0MoveToThread();

signals:
    void dataChanged();

public slots:
    void dataChangedSlot(struct can_frame msg);

private:
    QThread m_thread;
    Can0Rx m_can;
    uint id;
    uint byte0;
    uint byte1;
    uint byte2;
    uint byte3;
    uint byte4;
    uint byte5;
    uint byte6;
    uint byte7;
};

#endif // CAN0RX_H
