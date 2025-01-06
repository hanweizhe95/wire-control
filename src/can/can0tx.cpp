#include "can0tx.h"
#include "socketCan.h"


Can0Tx::Can0Tx(QObject*)
{
    bindSocketCan(m_socket_send, "can0");
}


Can0Tx::~Can0Tx()
{
    delete parent();
}
