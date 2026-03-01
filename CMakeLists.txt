cmake_minimum_required(VERSION 3.16)

project(quickprofessionalwebsite3 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

find_package(Qt6 COMPONENTS QuickControls2 REQUIRED)

find_package(Qt6 COMPONENTS QuickEffects REQUIRED)

find_package(Qt6 COMPONENTS QuickLayouts REQUIRED)


qt_standard_project_setup(REQUIRES 6.8)

qt_add_resources(RESOURCES_RCC Resources.qrc)

qt_add_executable(appquickprofessionalwebsite3
    main.cpp ${RESOURCES_RCC}
)



qt_add_qml_module(appquickprofessionalwebsite3
    URI quickprofessionalwebsite3
    QML_FILES
        Main.qml
        RESOURCES Resources.qrc
        RESOURCES Baldy_Mountain__Philmont.jpg
        RESOURCES Down-Arrow-Transparent-Image.png
        RESOURCES linkdin.png
        RESOURCES github.png
        RESOURCES emailicon.png
        RESOURCES bydesignscreenshot.png
        RESOURCES headshot.jpg
        RESOURCES computer.PNG
        RESOURCES busrouter.PNG
        RESOURCES perceptron.png
        QML_FILES SkillBar.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appquickprofessionalwebsite3 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appquickprofessionalwebsite3
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appquickprofessionalwebsite3
    PRIVATE Qt6::Quick Qt6::Quick Qt6::QuickControls2 Qt6::QuickEffects Qt6::QuickLayouts
)

include(GNUInstallDirs)
install(TARGETS appquickprofessionalwebsite3
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
