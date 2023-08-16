#include "qt_middleware.hpp"
#include <storage_engine.hpp>
#include <fmt/core.h>
#include <QStandardPaths>

Qt_middleware::Qt_middleware()
{
    std::string d_path = fmt::format("{}/{}", QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation).toStdString(), ORG_NAME);
    if (!storage_engine::path_exist(d_path))
    {
        storage_engine::create_directory(d_path, true);
    }

    web_engine::fetch_file("tanzil.net", fmt::format("/trans/?transID={}&type=xml", "sq.nahi"), fmt::format("{}/sq.nahi.xml", d_path));
}

Qt_middleware::~Qt_middleware()
{
}
