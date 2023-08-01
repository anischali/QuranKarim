// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSettings>
#include <QQuickStyle>

#include "app_environment.h"
#include "import_qml_components_plugins.h"
#include "import_qml_plugins.h"

int main(int argc, char *argv[])
{
    int ret = 0;
    set_qt_environment();
    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName("QuranKarim");
    QGuiApplication::setOrganizationName("com.cciq.org");


    QSettings settings;
    if (qEnvironmentVariableIsEmpty("QT_QUICK_CONTROLS_STYLE") &&
        settings.value("style").toString().isEmpty()) {
#if defined(Q_OS_MACOS)
        QQuickStyle::setStyle(QString("iOS"));
#elif defined(Q_OS_IOS)
        QQuickStyle::setStyle(QString("iOS"));
#elif defined(Q_OS_WINDOWS)
        QQuickStyle::setStyle(QString("Windows"));
#elif defined(Q_OS_ANDROID)
        QQuickStyle::setStyle(QString("Material"));
#endif
    } else {
        QQuickStyle::setStyle(settings.value("style").toString());
    }

    const QString styleInSettings = settings.value("style").toString();
    if (styleInSettings.isEmpty())
        settings.setValue(QString("style"), QQuickStyle::name());

    QStringList builtInStyles = { QString("CustomStyle"), QString("Basic"),
                                 QString("Material"), QString("Universal") };
#if defined(Q_OS_MACOS)
    builtInStyles << QString("iOS");
#elif defined(Q_OS_IOS)
    builtInStyles << QString("iOS");
#elif defined(Q_OS_WINDOWS)
    builtInStyles << QString("Windows");
#endif


    QQmlApplicationEngine engine;

    const QUrl url(u"qrc:Main/main.qml"_qs);
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.setInitialProperties({{ "builtInStyles", builtInStyles }});
    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    ret = app.exec();

    return ret;
}
