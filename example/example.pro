QT += core
QT -= gui

TARGET = example
CONFIG += console
CONFIG -= app_bundle
TEMPLATE = app
DEFINES += QTCSV_STATIC_LIB

!msvc {
    # flags for gcc-like compiler
    CONFIG += warn_on
    QMAKE_CXXFLAGS_WARN_ON += -Werror -Wformat=2 -Wuninitialized -Winit-self \
            -Wmissing-include-dirs -Wswitch-enum -Wundef -Wpointer-arith \
            -Wdisabled-optimization -Wcast-align -Wcast-qual
}

# set where linker could find qtcsv library. By default we expect
# that library is located in the same directory as the qtcsv_example binary.
#QTCSV_LOCATION = $$OUT_PWD
#LIBS += -L$$QTCSV_LOCATION -lqtcsv

#INCLUDEPATH += $$PWD/../qtcsv/include

SOURCES += main.cpp

#win32 {
#    install_it.path = $$OUT_PWD
#    install_it.files += $$OUT_PWD/../qtcsv/qtcsv.dll

#    INSTALLS += install_it
#}

#DISTFILES += \
#    CMakeLists.txt

#message(=== Configuration of example ===)
#message(Qt version: $$[QT_VERSION])
#message(example binary will be created in folder: $$OUT_PWD)

#win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/release/ -lqtcsv
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/debug/ -lqtcsv
#else:unix: LIBS += -L$$OUT_PWD/'' -lqtcsv

#INCLUDEPATH += $$PWD/../qtcsv
#DEPENDPATH += $$PWD/../qtcsv

##



win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../qtcsv/release/ -lqtcsv
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../qtcsv/debug/ -lqtcsv
else:unix: LIBS += -L$$OUT_PWD/../qtcsv/ -lqtcsv

INCLUDEPATH += $$PWD/../qtcsv/include
DEPENDPATH += $$PWD/../qtcsv/include

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../qtcsv/release/libqtcsv.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../qtcsv/debug/libqtcsv.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../qtcsv/release/qtcsv.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../qtcsv/debug/qtcsv.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../qtcsv/libqtcsv.a
