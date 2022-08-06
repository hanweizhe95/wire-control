TEMPLATE = app
TARGET = senta_truck
INCLUDEPATH += .
QT = core qml
QT += quick

SOURCES += \
    can0rx.cpp \
    can0tx.cpp \
    can1rx.cpp \
    can1tx.cpp \
    main.cpp \
    xbox.cpp

RESOURCES += \
    senta_truck.qrc

OTHER_FILES += \
    qml/main.qml\
    qml/DashboardGaugeStyle.qml \
    qml/IconGaugeStyle.qml \
    qml/TachometerStyle.qml \
    qml/TurnIndicator.qml \
    qml/ValueSource.qml \
    qml/ADAS.qml

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols/extras/dashboard
INSTALLS += target

DISTFILES += \
    qml/Can.qml \
    qml/Dashboard.qml \
    qml/Dynamic.qml \
    qml/IconAlert.qml \
    qml/main.qml

HEADERS += \
    can0rx.h \
    can0tx.h \
    can1rx.h \
    can1tx.h \
    xbox.h
