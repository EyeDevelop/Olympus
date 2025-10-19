cmake_minimum_required(VERSION 3.23)

project(OlympusLauncher LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(QT_QML_GENERATE_QMLLS_INI ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS
    Core
    Quick
    Qml
    DBus
)

qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

add_executable(olympus src/main.cpp)
target_link_libraries(olympus PRIVATE
    Qt6::Core
    Qt6::Quick
    Qt6::Qml
    Qt6::DBus
)

qt_add_qml_module(olympus
    URI ${PROJECT_NAME}
    VERSION 1.0
    QML_FILES
    qml/view/Main.qml
)
