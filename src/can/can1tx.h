#ifndef CAN1TX_H
#define CAN1TX_H
#include "canTx.h"
#include <QObject>

class Can1Tx: public CanTx
{
public:
    explicit Can1Tx(QObject *parent = nullptr);
    ~Can1Tx();

private:

};
#endif // CAN1TX_H
