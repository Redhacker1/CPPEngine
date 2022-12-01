cmake_minimum_required(VERSION 3.21)
set(CMAKE_CXX_STANDARD 17)
project(CPPEngine)

list(APPEND CMAKE_PREFIX_PATH "${CMAKE_SOURCE_DIR}/modules/thirdparty")

find_package(SDL2 REQUIRED)
include_directories(CPPEngine ${SDL2_INCLUDE_DIRS})
find_package(OpenGL REQUIRED)


add_executable(CPPEngine main.cpp)
message("Linking: ${SDL2_LIBRARIES}")

target_link_libraries(CPPEngine mingw32)
target_link_libraries(CPPEngine ${SDL2_LIBRARIES})
target_link_libraries(CPPEngine "OpenGL32.lib")