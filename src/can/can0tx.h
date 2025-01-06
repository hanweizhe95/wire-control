#ifndef CAN0TX_H
#define CAN0TX_H
#include "canTx.h"
#include <QObject>

class Can0Tx: public CanTx
{
public:
    explicit Can0Tx(QObject *parent = nullptr);
    ~Can0Tx();

private:

};

#endif // CAN0TX_H
