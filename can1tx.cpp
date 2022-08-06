#include "can1tx.h"
#include <fcntl.h>
#include <termios.h>

Can1Tx::Can1Tx(QObject *parent):QObject (parent)
{
    struct sockaddr_can addr;
    struct ifreq ifr;
    strcpy(ifr.ifr_name, "can1");

    //FRAME SEND
    m_socket_send = socket(PF_CAN, SOCK_RAW, CAN_RAW);
    ioctl(m_socket_send, SIOCGIFINDEX, &ifr);
    addr.can_family = AF_CAN;
    addr.can_ifindex = ifr.ifr_ifindex;
    bind(m_socket_send,(struct sockaddr *)&addr, sizeof(addr));

}

//FRAME_SEND======================================
void Can1Tx::sendframe(uint CANid, int Byte0, int Byte1, int Byte2, int Byte3, int Byte4, int Byte5, int Byte6, int Byte7)
{
   frame_send.can_id = CANid;
   frame_send.can_dlc = 8;
   frame_send.data[0] = __u8(Byte0);
   frame_send.data[1] = __u8(Byte1);
   frame_send.data[2] = __u8(Byte2);
   frame_send.data[3] = __u8(Byte3);
   frame_send.data[4] = __u8(Byte4);
   frame_send.data[5] = __u8(Byte5);
   frame_send.data[6] = __u8(Byte6);
   frame_send.data[7] = __u8(Byte7);
   write(m_socket_send, &frame_send, sizeof(frame_send));
}



Can1Tx::~Can1Tx()
{
    delete parent();
}
