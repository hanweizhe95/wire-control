#include "canTx.h"
#include <fcntl.h>
#include <termios.h>
#include <iostream>
using namespace std;

CanTx::CanTx(QObject *parent):QObject (parent)
{
    struct sockaddr_can addr;
    struct ifreq ifr;
    strcpy(ifr.ifr_name, "can0");

    //FRAME SEND
    m_socket_send = socket(PF_CAN, SOCK_RAW, CAN_RAW);
    ioctl(m_socket_send, SIOCGIFINDEX, &ifr);
    addr.can_family = AF_CAN;
    addr.can_ifindex = ifr.ifr_ifindex;
    bind(m_socket_send,(struct sockaddr *)&addr, sizeof(addr));

}

void CanTx::sendframe(uint id, int byte0, int byte1, int byte2, int byte3, int byte4, int byte5, int byte6, int byte7)
{
    frame_send.can_id = id;
    frame_send.can_dlc = 8;
    frame_send.data[0] = __u8(byte0);
    frame_send.data[1] = __u8(byte1);
    frame_send.data[2] = __u8(byte2);
    frame_send.data[3] = __u8(byte3);
    frame_send.data[4] = __u8(byte4);
    frame_send.data[5] = __u8(byte5);
    frame_send.data[6] = __u8(byte6);
    frame_send.data[7] = __u8(byte7);
    if(write(m_socket_send, &frame_send, sizeof(frame_send)) < 0) {
        cout << "Send CAN frame:" << hex << id << "failed" << endl;
        return;
    }else {
        cout << "Sending CAN frame: 0x" << hex << id << endl;
        return;
    }
}

void CanTx::sendCanFdFrame(uint id, uint dlc, QList<uint> data)
{
    int enable_canfd = 1;
    if(setsockopt(m_socket_send, SOL_CAN_RAW, CAN_RAW_FD_FRAMES, &enable_canfd, sizeof(enable_canfd)) < 0){
        perror("Enable CAN FD failed");
        return;
    }
    frame_fd_send.can_id = id;
    frame_fd_send.len = dlc;
    frame_fd_send.flags = CANFD_BRS;
    for(int i = 0; i < data.size() && i < CANFD_MAX_DLEN; ++i) {
        frame_fd_send.data[i] = __u8(data[i]);
    }

    if(write(m_socket_send, &frame_send, sizeof(frame_send)) < 0) {
        cout << "Send CAN FD frame: 0x" << hex << id << " failed !" << endl;
        return;
    }else {
        cout << "Sending CAN FD frame: 0x" << hex << id << endl;
        return;
    }
}

CanTx::~CanTx()
{
    delete parent();
}
