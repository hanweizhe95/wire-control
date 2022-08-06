#ifndef XBOX_H
#define XBOX_H

#include <QThread>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <linux/input.h>
#include <linux/joystick.h>

#define XBOX_TYPE_BUTTON  0x01
#define XBOX_TYPE_AXIS  0x02

#define XBOX_BUTTON_A  0x00
#define XBOX_BUTTON_B  0x01
#define XBOX_BUTTON_X  0x02
#define XBOX_BUTTON_Y  0x03
#define XBOX_BUTTON_LB  0x04
#define XBOX_BUTTON_RB  0x05
#define XBOX_BUTTON_START  0x06
#define XBOX_BUTTON_BACK  0x07
#define XBOX_BUTTON_HOME  0x08
#define XBOX_BUTTON_LO  0x09
#define XBOX_BUTTON_RO  0x0a

#define XBOX_BUTTON_ON  0x01
#define XBOX_BUTTON_OFF  0x00

#define XBOX_AXIS_LX  0x00
#define XBOX_AXIS_LY  0x01
#define XBOX_AXIS_RX  0x03
#define XBOX_AXIS_RY  0x04
#define XBOX_AXIS_LT  0x02
#define XBOX_AXIS_RT  0x05
#define XBOX_AXIS_XX  0x06
#define XBOX_AXIS_YY  0x07

#define XBOX_AXIS_VAL_UP  -32767
#define XBOX_AXIS_VAL_DOWN  32767
#define XBOX_AXIS_VAL_LEFT  -32767
#define XBOX_AXIS_VAL_RIGHT  32767

#define XBOX_AXIS_VAL_MIN  -32767
#define XBOX_AXIS_VAL_MAX  32767
#define XBOX_AXIS_VAL_MID  0x00


/*typedef struct xbox_map
{
    int time;
    int a;
    int b;
    int x;
    int y;
    int lb;
    int rb;
    int start;
    int back;
    int home;
    int lo;
    int ro;

    int lx;
    int ly;
    int rx;
    int ry;
    int lt;
    int rt;
    int xx;
    int yy;

}xbox_map_t;*/

class Xbox:public QObject
{
    Q_OBJECT

public:
    Xbox(QObject *parent = nullptr);

signals:
    void dataRecved(struct js_event data);

public slots:
    int xbox_open(const char *file_name);
    void xbox_read();
    void xbox_close();

private:
    struct js_event js;
    int len;
    struct js_event msg;
    struct js_event msg_;
};

class XboxMoveToThread: public QObject{
    Q_OBJECT
    Q_PROPERTY(int type MEMBER type)
    Q_PROPERTY(int number MEMBER number)
    Q_PROPERTY(int value MEMBER value)

public:
    XboxMoveToThread(QObject* parent=nullptr);
    ~XboxMoveToThread();

signals:
    void dataChanged();

public slots:
    void dataChangedSlot(struct js_event msg);

private:
    QThread m_thread;
    Xbox m_xbox;
    int type;
    int number;
    int value;
};

#endif // XBOX_H
