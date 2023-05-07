cmake_minimum_required(VERSION 3.16)

project(BoardGame VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appBoardGame
    main.cpp
)

#qt_add_qml_module(mytest
#    URI net.maxiprogram.scalingratiowrapper
#    VERSION 1.0
#    SOURCES
#        scalingratiowrapper.h scalingratiowrapper.cpp
#)


qt_add_qml_module(appBoardGame
    URI BoardGame
    VERSION 1.0
    SOURCES
        scalingratiowrapper.h scalingratiowrapper.cpp
    QML_FILES
        Main.qml
        Start.qml
        GameLevel.qml
        Player.qml
        Cell.qml
        Test.qml
        js/scaling-ratio.js
        js/logic.js
    RESOURCES
        images/cell0.png
        images/cell1.png
        images/cell2.png
        images/cell3.png
        images/player.png
        images/playerAI.png
        images/cube.gif
)

set_target_properties(appBoardGame PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appBoardGame
    PRIVATE Qt6::Quick
)

install(TARGETS appBoardGame
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
