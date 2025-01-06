#include "can1rx.h"
#include <QObject>
#include <fcntl.h>
#include <termios.h>

Can1MoveToThread::Can1MoveToThread(QObject* ){
    m_can.moveToThread(&m_thread);
    m_can.setChannel("Can1");
    m_can.canInit();
    connect(&m_thread,&QThread::started,&m_can,&CanRx::canWork);
    connect(&m_can,&CanRx::canDataRecved,this,&Can1MoveToThread::dataChangedSlot);
    connect(&m_thread,&QThread::finished,&m_can,&CanRx::canClose);
    m_thread.start();
}

Can1MoveToThread::~Can1MoveToThread()
{
    m_thread.exit();
    m_thread.wait();
}


Canfd1MoveToThread::Canfd1MoveToThread(QObject* ){
    m_can.moveToThread(&m_thread);
    connect(&m_thread,&QThread::started,&m_can,&CanRx::canfdWork);
    connect(&m_can,&CanRx::canfdDataRecved,this,&Canfd1MoveToThread::dataChangedSlot);
    connect(&m_thread,&QThread::finished,&m_can,&CanRx::canClose);
    m_thread.start();
}

Canfd1MoveToThread::~Canfd1MoveToThread()
{
    m_thread.exit();
    m_thread.wait();
}

