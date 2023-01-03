cmake_minimum_required(VERSION 3.21)
set(CMAKE_CXX_STANDARD 17)
project(CPPEngine)


add_executable(CPPProj Main.cpp)
add_subdirectory(modules/thirdparty/SDL2-2.26.2)
target_include_directories(CPPProj
        PRIVATE ${SDL2_INCLUDE_DIRS}
        )
target_link_libraries(CPPProj
        SDL2::SDL2main
        SDL2::SDL2-static
        )


message("Configuring Graphics API")
# Compile DXVK on non DX supported compilers and linux, otherwise, just use DX11
if(MINGW OR ${CMAKE_CXX_COMPILER_ID} EQUAL GCC OR NOT WIN32)
    message("NOT Running DX11")
    if(WIN32)
    elseif(CMAKE_SYSTEM_NAME MATCHES ".*Linux")
    endif()
else()
    message("Running DX11")
    target_link_libraries(CPPProj d3d12.lib dxgi.lib d3dcompiler.lib dxguid.lib)
endif()
