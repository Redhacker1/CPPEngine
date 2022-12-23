cmake_minimum_required(VERSION 3.21)
set(CMAKE_CXX_STANDARD 17)
project(CPPEngine)

add_subdirectory("modules/thirdparty/bgfx_cmake")

list(APPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.26.1)

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(SDL2_DIR ${SRC_DIR}/modules/thirdparty/SDL2-2.26.1)


if(UNIX)
    find_package(SDL2 REQUIRED)
elseif(WIN32)
    if(CMAKE_SIZEOF_VOID_P EQUAL 4)
        set(SDL2_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.26.1/i686-w64-mingw32/include)
        set(SDL2_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.26.1/i686-w64-mingw32/lib/libSDL2.dll.a)
        set(SDL2_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.26.1/i686-w64-mingw32/lib/libSDL2main.a)
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(SDL2_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.26.1/x86_64-w64-mingw32/include)
        set(SDL2_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.26.1/x86_64-w64-mingw32/lib/libSDL2.dll.a
                ${CMAKE_CURRENT_SOURCE_DIR}/modules/thirdparty/SDL2-2.26.1/x86_64-w64-mingw32/lib/libSDL2main.a
                )
    else()
        message("Platform not supported!")
        return()
    endif()

endif()

message("Include directories: " ${SDL2_INCLUDE_DIRS})

add_executable(CPPProj Main.cpp)
include_directories(CPPProj ${SDL2_INCLUDE_DIRS})

target_link_libraries(CPPProj
        mingw32
        ${SDL2_LIBRARIES}
        )