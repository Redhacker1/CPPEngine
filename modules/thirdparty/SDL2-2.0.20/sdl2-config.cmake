
# Support both 32 and 64 bit builds
if (${CMAKE_SIZEOF_VOID_P} MATCHES 8)
  set(SDL2_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/x86_64-w64-mingw32/include/SDL2")
  set(SDL2_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/x86_64-w64-mingw32/lib/libSDL2main.a;${CMAKE_CURRENT_LIST_DIR}/x86_64-w64-mingw32/lib/libSDL2.dll.a")
else()
  set(SDL2_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/i686-w64-mingw32/include/SDL2")
  set(SDL2_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/i686-w64-mingw32/lib/libSDL2main.a;${CMAKE_CURRENT_LIST_DIR}/i686-w64-mingw32/lib/libSDL2.dll.a")
endif()


string(STRIP "${SDL2_LIBRARIES}" SDL2_LIBRARIES)