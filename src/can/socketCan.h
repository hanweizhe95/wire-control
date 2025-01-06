#include <sys/socket.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <stdio.h>
#include <string.h>
#include <linux/can/raw.h>

void bindSocketCan(int m_socket, const char* m_channel);