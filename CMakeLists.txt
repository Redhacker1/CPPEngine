cmake_minimum_required(VERSION 3.21)
set(CMAKE_CXX_STANDARD 17)
project(CPPEngine)


list(APPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.26.1)

find_package(SDL2 REQUIRED)

message("Include directories: " ${SDL2_INCLUDE_DIRS})

add_executable(CPPProj Main.cpp)
include_directories(CPPProj ${SDL2_INCLUDE_DIRS})

add_subdirectory("modules/thirdparty/bgfx_cmake")

target_link_libraries(CPPProj
        mingw32
        ${SDL2_LIBRARIES}
        )