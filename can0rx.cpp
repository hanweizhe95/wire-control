#include "can0rx.h"
#include <QObject>
#include <fcntl.h>
#include <termios.h>
#include <linux/can.h>

Can0Rx::Can0Rx(QObject*){}

void Can0Rx::canWork()
{
    struct sockaddr_can addr;
    struct ifreq ifr;
    strcpy(ifr.ifr_name, "can0");

    //FRAME READ
    m_socket = socket(PF_CAN, SOCK_RAW, CAN_RAW);
    ioctl(m_socket, SIOCGIFINDEX, &ifr);
    addr.can_family = AF_CAN;
    addr.can_ifindex = ifr.ifr_ifindex;
    bind(m_socket,(struct sockaddr *)&addr, sizeof(addr));
    fcntl(m_socket,F_SETFL,FNDELAY);

    while (1) {

        read(m_socket, &frame, sizeof(frame));
        msg_ = msg;
        msg = frame;
        bool dataChanged = false;
        int count = 0;
        while(!dataChanged && count<8)
        {
            if(msg.data[count]!=msg_.data[count])
                dataChanged = true;
            count++;
        }
        if (msg.can_id!=msg_.can_id||dataChanged){
            emit dataRecved(msg);
        }
    }
}

void Can0Rx::canClose(){}

Can0MoveToThread::Can0MoveToThread(QObject* ){
    m_can.moveToThread(&m_thread);

    connect(&m_thread,&QThread::started,&m_can,&Can0Rx::canWork);
    connect(&m_can,&Can0Rx::dataRecved,this,&Can0MoveToThread::dataChangedSlot);
    connect(&m_thread,&QThread::finished,&m_can,&Can0Rx::canClose);
    m_thread.start();
}

Can0MoveToThread::~Can0MoveToThread()
{
    m_thread.exit();
    m_thread.wait();
}

void Can0MoveToThread::dataChangedSlot(struct can_frame msg)
{
    id = msg.can_id;
    byte0 = msg.data[0];
    byte1 = msg.data[1];
    byte2 = msg.data[2];
    byte3 = msg.data[3];
    byte4 = msg.data[4];
    byte5 = msg.data[5];
    byte6 = msg.data[6];
    byte7 = msg.data[7];
    emit dataChanged();
}
