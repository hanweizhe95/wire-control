#ifndef CANRX_H
#define CANRX_H

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

class CanRx : public QObject
{
    Q_OBJECT
public:
    CanRx(QObject *parent = nullptr);
    void canInit();
    void setChannel(const char* channel);

signals:
    void canDataRecved(struct can_frame data);
    void canfdDataRecved(struct canfd_frame data);

public slots:
    void canWork();
    void canfdWork();
    void canClose();

private:
    int m_socket;
    const char* can_channel;

    struct can_frame frame;
    struct can_frame msg;
    struct can_frame msg_;

    struct canfd_frame fd_frame;
    struct canfd_frame fd_msg;
    struct canfd_frame fd_msg_;
};

class CanMoveToThread: public QObject
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
    CanMoveToThread(QObject* parent=nullptr);
    ~CanMoveToThread();
    CanRx m_can;
    QThread m_thread;

signals:
    void dataChanged();

public slots:
    void dataChangedSlot(struct can_frame msg);

private:
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

class CanfdMoveToThread: public QObject
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
    Q_PROPERTY(uint byte8 MEMBER byte8)
    Q_PROPERTY(uint byte9 MEMBER byte9)
    Q_PROPERTY(uint byte10 MEMBER byte10)
    Q_PROPERTY(uint byte11 MEMBER byte11)
    Q_PROPERTY(uint byte12 MEMBER byte12)
    Q_PROPERTY(uint byte13 MEMBER byte13)
    Q_PROPERTY(uint byte14 MEMBER byte14)
    Q_PROPERTY(uint byte15 MEMBER byte15)
    Q_PROPERTY(uint byte16 MEMBER byte16)
    Q_PROPERTY(uint byte17 MEMBER byte17)
    Q_PROPERTY(uint byte18 MEMBER byte18)
    Q_PROPERTY(uint byte19 MEMBER byte19)
    Q_PROPERTY(uint byte20 MEMBER byte20)
    Q_PROPERTY(uint byte21 MEMBER byte21)
    Q_PROPERTY(uint byte22 MEMBER byte22)
    Q_PROPERTY(uint byte23 MEMBER byte23)
    Q_PROPERTY(uint byte24 MEMBER byte24)
    Q_PROPERTY(uint byte25 MEMBER byte25)
    Q_PROPERTY(uint byte26 MEMBER byte26)
    Q_PROPERTY(uint byte27 MEMBER byte27)
    Q_PROPERTY(uint byte28 MEMBER byte28)
    Q_PROPERTY(uint byte29 MEMBER byte29)
    Q_PROPERTY(uint byte30 MEMBER byte30)
    Q_PROPERTY(uint byte31 MEMBER byte31)
    Q_PROPERTY(uint byte32 MEMBER byte32)
    Q_PROPERTY(uint byte33 MEMBER byte33)
    Q_PROPERTY(uint byte34 MEMBER byte34)
    Q_PROPERTY(uint byte35 MEMBER byte35)
    Q_PROPERTY(uint byte36 MEMBER byte36)
    Q_PROPERTY(uint byte37 MEMBER byte37)
    Q_PROPERTY(uint byte38 MEMBER byte38)
    Q_PROPERTY(uint byte39 MEMBER byte39)
    Q_PROPERTY(uint byte40 MEMBER byte40)
    Q_PROPERTY(uint byte41 MEMBER byte41)
    Q_PROPERTY(uint byte42 MEMBER byte42)
    Q_PROPERTY(uint byte43 MEMBER byte43)
    Q_PROPERTY(uint byte44 MEMBER byte44)
    Q_PROPERTY(uint byte45 MEMBER byte45)
    Q_PROPERTY(uint byte46 MEMBER byte46)
    Q_PROPERTY(uint byte47 MEMBER byte47)
    Q_PROPERTY(uint byte48 MEMBER byte48)
    Q_PROPERTY(uint byte49 MEMBER byte49)
    Q_PROPERTY(uint byte50 MEMBER byte50)
    Q_PROPERTY(uint byte51 MEMBER byte51)
    Q_PROPERTY(uint byte52 MEMBER byte52)
    Q_PROPERTY(uint byte53 MEMBER byte53)
    Q_PROPERTY(uint byte54 MEMBER byte54)
    Q_PROPERTY(uint byte55 MEMBER byte55)
    Q_PROPERTY(uint byte56 MEMBER byte56)
    Q_PROPERTY(uint byte57 MEMBER byte57)
    Q_PROPERTY(uint byte58 MEMBER byte58)
    Q_PROPERTY(uint byte59 MEMBER byte59)
    Q_PROPERTY(uint byte60 MEMBER byte60)
    Q_PROPERTY(uint byte61 MEMBER byte61)
    Q_PROPERTY(uint byte62 MEMBER byte62)
    Q_PROPERTY(uint byte63 MEMBER byte63)


public:
    CanfdMoveToThread(QObject* parent=nullptr);
    ~CanfdMoveToThread();
    CanRx m_can;
    QThread m_thread;

signals:
    void dataChanged();

public slots:
    void dataChangedSlot(struct canfd_frame msg);

private:
    uint id;
    uint byte0;
    uint byte1;
    uint byte2;
    uint byte3;
    uint byte4;
    uint byte5;
    uint byte6;
    uint byte7;
    uint byte8;
    uint byte9;
    uint byte10;
    uint byte11;
    uint byte12;
    uint byte13;
    uint byte14;
    uint byte15;
    uint byte16;
    uint byte17;
    uint byte18;
    uint byte19;
    uint byte20;
    uint byte21;
    uint byte22;
    uint byte23;
    uint byte24;
    uint byte25;
    uint byte26;
    uint byte27;
    uint byte28;
    uint byte29;
    uint byte30;
    uint byte31;
    uint byte32;
    uint byte33;
    uint byte34;
    uint byte35;
    uint byte36;
    uint byte37;
    uint byte38;
    uint byte39;
    uint byte40;
    uint byte41;
    uint byte42;
    uint byte43;
    uint byte44;
    uint byte45;
    uint byte46;
    uint byte47;
    uint byte48;
    uint byte49;
    uint byte50;
    uint byte51;
    uint byte52;
    uint byte53;
    uint byte54;
    uint byte55;
    uint byte56;
    uint byte57;
    uint byte58;
    uint byte59;
    uint byte60;
    uint byte61;
    uint byte62;
    uint byte63;

};
#endif // CanRX_H
