// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSettings>
#include <QQuickStyle>
#include <QScreen>


#include "app_environment.h"
#include "import_qml_components_plugins.h"
#include "import_qml_plugins.h"

#define ORG_NAME "com.cciq.org"
#define APP_NAME "QuranKarim"

uint32_t get_dpi_scale_factor(void)
{
    QScreen *s = QGuiApplication::primaryScreen();
    if (!s)
        return 1;
    float dpi = s->logicalDotsPerInch();
    if (dpi == 96.0)
        return 1;

    return std::ceil((dpi + 0.5) / 96.0) + 1;
}

int main(int argc, char *argv[])
{
    QSettings settings(ORG_NAME, APP_NAME);
    int ret = 0;
restart:
    qputenv("QT_SCALE_FACTOR", settings.value("scale_factor").toByteArray());
    set_qt_environment();

    QGuiApplication *app = new QGuiApplication(argc, argv);
    QGuiApplication::setApplicationName(APP_NAME);
    QGuiApplication::setOrganizationName(ORG_NAME);


    if (settings.value("scale_factor").toString().isEmpty())
    {
        uint32_t factor = get_dpi_scale_factor();
        settings.setValue(QString("scale_factor"), QString::fromStdString(std::to_string(factor)));
        delete app;
        goto restart;
    }



    if (qEnvironmentVariableIsEmpty("QT_QUICK_CONTROLS_STYLE") &&
        settings.value("style").toString().isEmpty()) {
        QString style;
#if defined(Q_OS_MACOS)
        style = QString("iOS");
#elif defined(Q_OS_IOS)
        style = QString("iOS");
#elif defined(Q_OS_WINDOWS)
        style = QString("Windows");
#elif defined(Q_OS_ANDROID)
        style = QString("Material");
#elif defined(Q_OS_LINUX) || defined(Q_OS_UNIX)
        style = QString("Material");
#endif
        QQuickStyle::setStyle(style);
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
        &engine, &QQmlApplicationEngine::objectCreated, app,
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

    ret = app->exec();

    delete app;
    return ret;
}
