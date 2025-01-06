#include "xbox.h"

Xbox::Xbox(QObject*){}

int Xbox::xbox_open(const char *file_name){
    int xbox_fd;

    xbox_fd = open(file_name, O_RDONLY);
    return  xbox_fd;
}

void Xbox::xbox_read(){
    int xbox_fd;
    xbox_fd = xbox_open("/dev/input/js0");
    while (1) {
        len = read(xbox_fd, &js, sizeof (struct js_event));
        if(len < 0){
            perror("read");
        }
        msg_ = msg;
        msg = js;
        if (msg.value!=msg_.value){
            emit dataRecved(msg);
        }
    }
}

void Xbox::xbox_close(){

}

XboxMoveToThread::XboxMoveToThread(QObject* ){
    m_xbox.moveToThread(&m_thread);

    connect(&m_thread,&QThread::started,&m_xbox,&Xbox::xbox_read);
    connect(&m_xbox,&Xbox::dataRecved,this,&XboxMoveToThread::dataChangedSlot);
    connect(&m_thread,&QThread::finished,&m_xbox,&Xbox::xbox_close);
    m_thread.start();
}

XboxMoveToThread::~XboxMoveToThread()
{
    m_thread.exit();
    m_thread.wait();
}

void XboxMoveToThread::dataChangedSlot(struct js_event msg)
{
    type = msg.type;
    number = msg.number;
    value = msg.value;
    emit dataChanged();
}
