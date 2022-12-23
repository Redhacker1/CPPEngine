cmake_minimum_required(VERSION 3.21)
set(CMAKE_CXX_STANDARD 17)
project(CPPEngine)

add_subdirectory("modules/thirdparty/bgfx_cmake")

list(APPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.26.1/cmake)

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(SDL2_DIR ${SRC_DIR}/modules/thirdparty/SDL2-2.26.1)

find_package(SDL2 REQUIRED)

message("Include directories: " ${SDL2_INCLUDE_DIRS})
include_directories(SDL2Test ${SDL2_INCLUDE_DIRS})

add_executable(SDL2Test Main.cpp)
target_link_libraries(SDL2Test
        mingw32
        ${SDL2_LIBRARIES}
        )