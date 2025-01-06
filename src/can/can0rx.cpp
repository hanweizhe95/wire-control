#include "can0rx.h"
#include <QObject>
#include <fcntl.h>
#include <termios.h>

Can0MoveToThread::Can0MoveToThread(QObject* ){
    m_can.moveToThread(&m_thread);
    m_can.setChannel("can0");
    m_can.canInit();
    connect(&m_thread,&QThread::started,&m_can,&CanRx::canWork);
    connect(&m_can,&CanRx::canDataRecved,this,&Can0MoveToThread::dataChangedSlot);
    connect(&m_thread,&QThread::finished,&m_can,&CanRx::canClose);
    m_thread.start();
}

Can0MoveToThread::~Can0MoveToThread()
{
    m_thread.exit();
    m_thread.wait();
}


Canfd0MoveToThread::Canfd0MoveToThread(QObject* ){
    m_can.moveToThread(&m_thread);
    m_can.setChannel("can0");
    m_can.canInit();
    connect(&m_thread,&QThread::started,&m_can,&CanRx::canfdWork);
    connect(&m_can,&CanRx::canfdDataRecved,this,&Canfd0MoveToThread::dataChangedSlot);
    connect(&m_thread,&QThread::finished,&m_can,&CanRx::canClose);
    m_thread.start();
}

Canfd0MoveToThread::~Canfd0MoveToThread()
{
    m_thread.exit();
    m_thread.wait();
}

