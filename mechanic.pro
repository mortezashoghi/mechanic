TEMPLATE = app

TARGET = Mechanic

QT += qml quick  quickcontrols2 sql
CONFIG += c++11

SOURCES += main.cpp \
    errlist.cpp \
    lstmodel.cpp \
    databasesqlite.cpp \
    filter.cpp \
    abstractmodel.cpp \
    credential.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =QtQuick.qtgraphicaleffect 1.2


# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    errlist.h \
    lstmodel.h \
    databasesqlite.h \
    filter.h \
    abstractmodel.h \
    credential.h

DISTFILES +=
