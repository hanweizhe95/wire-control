#include "can1tx.h"
#include "socketCan.h"

Can1Tx::Can1Tx(QObject*)
{
    bindSocketCan(m_socket_send, "can1");
}


Can1Tx::~Can1Tx()
{
    delete parent();
}
