cmake_minimum_required(VERSION 3.16)

project(BoardGame VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 6.4 REQUIRED COMPONENTS Multimedia)

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
        Option.qml
        GameLevel.qml
        Player.qml
        Cell.qml
        Test.qml
        FpsItem.qml
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
        images/background_menu.png
        images/background_game_level.png
        images/button_menu.png
        images/button_back.png
        images/sound_on.png
        images/sound_off.png
        images/panel_player.png
        images/panel_player_ai.png
        images/arrow.gif
        images/win.gif
        images/lose.gif
        images/anim_win.gif
        fonts/SpeedRush-JRKVB.ttf
        fonts/MinecraftEvenings-RBao.ttf
        sounds/background.wav
        sounds/win.wav
        sounds/lose.wav
)

set_target_properties(appBoardGame PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    #QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

set_property(TARGET appBoardGame APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android)
set_property(TARGET appBoardGame APPEND PROPERTY QT_ANDROID_TARGET_SDK_VERSION 33)
set_property(TARGET appBoardGame APPEND PROPERTY QT_ANDROID_VERSION_CODE 5)

target_link_libraries(appBoardGame
    PRIVATE Qt6::Quick Qt6::Multimedia
)

install(TARGETS appBoardGame
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

