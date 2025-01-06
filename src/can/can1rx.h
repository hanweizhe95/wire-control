#ifndef CAN1RX_H
#define CAN1RX_H

#include "canRx.h"

class Can1MoveToThread: public CanMoveToThread
{
public:
    Can1MoveToThread(QObject* parent=nullptr);
    ~Can1MoveToThread();
};

class Canfd1MoveToThread: public CanfdMoveToThread
{
public:
    Canfd1MoveToThread(QObject* parent=nullptr);
    ~Canfd1MoveToThread();
};
#endif // CAN1RX_H
