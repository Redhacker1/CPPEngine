cmake_minimum_required(VERSION 3.21)
set(CMAKE_CXX_STANDARD 17)
project(CPPEngine)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.0.20/)


message(${CMAKE_MODULE_PATH})

find_package(SDL2 REQUIRED)

include(modules/thirdparty/SDL2-2.0.20/sdl2-config.cmake)
include_directories(CPPEngine ${SDL2_INCLUDE_DIRS})


add_executable(CPPEngine main.cpp)

#add_subdirectory("modules/thirdparty/bgfx_cmake")

target_link_libraries(CPPEngine mingw32)
target_link_libraries(CPPEngine ${SDL2_LIBRARIES})
