TEMPLATE = subdirs

SUBDIRS += \
    qtcsv \
    example

DISTFILES += \
    CMakeLists.txt

example.depends = qtcsv
