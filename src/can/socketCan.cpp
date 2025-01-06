#include "socketCan.h"

void bindSocketCan(int m_socket, const char* m_channel)
{
    // Create socket
    m_socket = socket(PF_CAN, SOCK_RAW, CAN_RAW);
    if(m_socket < 0){
        perror("Socket create failed");
        return;
    }

    // Specify CAN interface
    struct ifreq ifr;
    strcpy(ifr.ifr_name, m_channel);
    if(ioctl(m_socket, SIOCGIFINDEX, &ifr) < 0){
        perror("Get interface index failed");
        return;
    }

    // Bind socket to CAN interface
    struct sockaddr_can addr;
    addr.can_family = AF_CAN;
    addr.can_ifindex = ifr.ifr_ifindex;
    if(bind(m_socket,(struct sockaddr *)&addr, sizeof(addr)) < 0){
        perror("Bind socket failed");
        return;
    }
}