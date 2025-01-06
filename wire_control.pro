TEMPLATE = app
TARGET = wire_control
INCLUDEPATH += \
    $$PWD/src/can \
    $$PWD/src/joystick
QT = core qml
QT += quick

SOURCES += \
    $$PWD/src/can/*.cpp \
    $$PWD/src/joystick/*.cpp \
    $$PWD/src/main.cpp
    

RESOURCES += \
    wire_control.qrc

OTHER_FILES += \
    $$PWD/qml/main.qml\
    $$PWD/qml/DashboardGaugeStyle.qml \
    $$PWD/qml/IconGaugeStyle.qml \
    $$PWD/qml/TachometerStyle.qml \
    $$PWD/qml/TurnIndicator.qml \
    $$PWD/qml/ValueSource.qml \
    $$PWD/qml/ADAS.qml

DISTFILES += \
    $$PWD/qml/Can.qml \
    $$PWD/qml/Dashboard.qml \
    $$PWD/qml/Dynamic.qml \
    $$PWD/qml/IconAlert.qml \
    $$PWD/qml/main.qml

HEADERS += \
    $$PWD/src/can/*.h\
    $$PWD/src/joystick/*.h
