# Append custom CMake modules.
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/conf)

# Marcos 
function(mark_as_dependent target dependency)
    if (${dependency})
        mark_as_advanced(CLEAR ${target})
    elseif (NOT ${dependency})
        mark_as_advanced(FORCE ${target})
    endif()
endfunction(mark_as_dependent)

macro(include_once module)
    if(NOT DEFINED "BuildDefaults_Include_${module}_Set")
        set("BuildDefaults_Include_${module}_Set" ON)
        include("${module}")
    endif()
endmacro()

# Setup glog
include_once(Glog)