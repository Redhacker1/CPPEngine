
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was Config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include("${CMAKE_CURRENT_LIST_DIR}/bgfxTargets.cmake")
get_target_property(BGFX_INCLUDE_PATH bgfx::bgfx INTERFACE_INCLUDE_DIRECTORIES)
list(GET BGFX_INCLUDE_PATH 0 BGFX_INCLUDE_PATH_1) # bgfx::bgfx exports include directory twice?
set(BGFX_SHADER_INCLUDE_PATH ${BGFX_INCLUDE_PATH_1}/bgfx)

# If cross compiling, we need a host-compatible version of shaderc to compile shaders
if (FALSE AND NOT TARGET bgfx::shaderc)
  find_program(
    shaderc_EXECUTABLE REQUIRED
    NAMES bgfx-shaderc shaderc
    PATHS /usr/bin
          ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/packages/bgfx_x64-linux/tools/bgfx
          ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/packages/bgfx_x64-windows/tools/bgfx
          ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/packages/bgfx_x64-osx/tools/bgfx
  )
  add_executable(bgfx::shaderc IMPORTED)
  set_target_properties(
    bgfx::shaderc PROPERTIES IMPORTED_LOCATION "${shaderc_EXECUTABLE}"
  )
endif ()

include("${CMAKE_CURRENT_LIST_DIR}/bgfxToolUtils.cmake")
check_required_components("bgfx") 
