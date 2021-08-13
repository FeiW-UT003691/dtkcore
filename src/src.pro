QT -= gui
QT += dbus
QT += xml
CONFIG += link_pkgconfig
TARGET = dtkcore

# 龙芯架构上没有默认添加PT_GNU_STACK-section,所以此处手动指定一下
contains(QMAKE_HOST.arch, mips.*): QMAKE_LFLAGS_SHLIB += "-Wl,-z,noexecstack"

QMAKE_CXXFLAGS_RELEASE += -fvisibility=hidden

INCLUDEPATH += $$PWD
HEADERS += $$PWD/dtkcore_global.h \
    dconfig.h \
    dsysinfo.h \
    dsecurestring.h \
    ddesktopentry.h

SOURCES += \
    dconfig.cpp \
    dsysinfo.cpp \
    dsecurestring.cpp \
    ddesktopentry.cpp

linux: {
    HEADERS += \
        $$PWD/dconfigfile.h

    SOURCES += \
        $$PWD/dconfigfile.cpp

    # generic dbus interfaces
    isEmpty(DTK_DISABLE_DBUS_CONFIG) {
        QT += dbus

        config.files = $$PWD/dbus/org.desktopspec.ConfigManager.xml
        config.header_flags += -c DSGConfig -N
        config.source_flags += -c DSGConfig -N

        manager.files = $$PWD/dbus/org.desktopspec.ConfigManager.Manager.xml
        manager.header_flags += -c DSGConfigManager -N
        manager.source_flags += -c DSGConfigManager -N

        DBUS_INTERFACES += config manager
    } else {
        DEFINES += D_DISABLE_DBUS_CONFIG
    }
} else {
    DEFINES += D_DISABLE_DCONFIG
}

include($$PWD/base/base.pri)
include($$PWD/util/util.pri)
include($$PWD/log/log.pri)
include($$PWD/filesystem/filesystem.pri)
include($$PWD/settings/settings.pri)

DTK_MODULE_NAME = $$TARGET
load(dtk_build)

# ----------------------------------------------
# install config
includes.files += \
    $$PWD/*.h \
    $$PWD/dtkcore_config.h \
    $$PWD/DtkCores \
    $$PWD/DSysInfo \
    $$PWD/DSecureString \
    $$PWD/DDesktopEntry \
    $$PWD/DConfigFile \
    $$PWD/DConfig

INSTALLS += includes target

isEmpty(DTK_STATIC_LIB){
    DEFINES += LIBDTKCORE_LIBRARY
} else {
    DEFINES += DTK_STATIC_LIB
}

#cmake
load(dtk_cmake)

#qt module
load(dtk_module)
