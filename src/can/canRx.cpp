#include "canRx.h"
#include "socketCan.h"
#include <QObject>
#include <fcntl.h>
#include <termios.h>

CanRx::CanRx(QObject*){}

void CanRx::canInit()
{
    bindSocketCan(m_socket, can_channel);
    // fcntl(m_socket,F_SETFL,FNDELAY);
}
void CanRx::setChannel(const char* channel)
{
    can_channel = channel;
}

void CanRx::canWork()
{
    while (true) {
        int nbytes = read(m_socket, &frame, sizeof(frame));
        if(nbytes < 0){
            perror("Read message failed");
            break;
        }
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
            emit canDataRecved(msg);
        }
    }
}

void CanRx::canfdWork()
{
    int enable_canfd = 1;
    if(setsockopt(m_socket, SOL_CAN_RAW, CAN_RAW_FD_FRAMES, &enable_canfd, sizeof(enable_canfd)) < 0){
        perror("Enable CAN FD failed");
        return;
    }

    while(true){
        int nbytes = read(m_socket, &fd_frame, sizeof(fd_frame));
        if(nbytes < 0){
            perror("Read message failed");
            break;
        }
        fd_msg_ = fd_msg;
        fd_msg = fd_frame;
        bool dataChanged = false;
        int count = 0;
        while(!dataChanged && count < fd_msg.len){
            if(fd_msg.data[count] != fd_msg_.data[count])
                dataChanged = true;
            count++;
        }
        if(fd_msg.can_id != fd_msg_.can_id || dataChanged){
            emit canfdDataRecved(fd_msg);
        }
    }
}

void CanRx::canClose()
{
    close(m_socket);
}

CanMoveToThread::CanMoveToThread(QObject* ){}

CanMoveToThread::~CanMoveToThread()
{
    m_thread.exit();
    m_thread.wait();
}

void CanMoveToThread::dataChangedSlot(struct can_frame msg)
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

CanfdMoveToThread::CanfdMoveToThread(QObject* ){}

CanfdMoveToThread::~CanfdMoveToThread()
{
    m_thread.exit();
    m_thread.wait();
}

void CanfdMoveToThread::dataChangedSlot(struct canfd_frame msg)
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
    byte8 = msg.data[8];
    byte9 = msg.data[9];
    byte10 = msg.data[10];
    byte11 = msg.data[11];
    byte12 = msg.data[12];
    byte13 = msg.data[13];
    byte14 = msg.data[14];
    byte15 = msg.data[15];
    byte16 = msg.data[16];
    byte17 = msg.data[17];
    byte18 = msg.data[18];
    byte19 = msg.data[19];
    byte20 = msg.data[20];
    byte21 = msg.data[21];
    byte22 = msg.data[22];
    byte23 = msg.data[23];
    byte24 = msg.data[24];
    byte25 = msg.data[25];
    byte26 = msg.data[26];
    byte27 = msg.data[27];
    byte28 = msg.data[28];
    byte29 = msg.data[29];
    byte30 = msg.data[30];
    byte31 = msg.data[31];
    byte32 = msg.data[32];
    byte33 = msg.data[33];
    byte34 = msg.data[34];
    byte35 = msg.data[35];
    byte36 = msg.data[36];
    byte37 = msg.data[37];
    byte38 = msg.data[38];
    byte39 = msg.data[39];
    byte40 = msg.data[40];
    byte41 = msg.data[41];
    byte42 = msg.data[42];
    byte43 = msg.data[43];
    byte44 = msg.data[44];
    byte45 = msg.data[45];
    byte46 = msg.data[46];
    byte47 = msg.data[47];
    byte48 = msg.data[48];
    byte49 = msg.data[49];
    byte50 = msg.data[50];
    byte51 = msg.data[51];
    byte52 = msg.data[52];
    byte53 = msg.data[53];
    byte54 = msg.data[54];
    byte55 = msg.data[55];
    byte56 = msg.data[56];
    byte57 = msg.data[57];
    byte58 = msg.data[58];
    byte59 = msg.data[59];
    byte60 = msg.data[60];
    byte61 = msg.data[61];
    byte62 = msg.data[62];
    byte63 = msg.data[63];
    emit dataChanged();
}