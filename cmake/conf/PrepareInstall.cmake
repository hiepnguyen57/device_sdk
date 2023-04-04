# Set library and header files install directory
SET(SDK_LIB_INSTALL_DIR     "${CMAKE_INSTALL_PREFIX}/lib")
SET(SDK_INCLUDE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}")

function(sdk_set_soname target)
    if (NOT ${TARGET_SUFFIX} EQUAL "")
        set_target_properties(${target} PROPERTIES OUTPUT_NAME ${target}${TARGET_SUFFIX})
    endif()
endfunction()

function(sdk_install_lib)
    SET(PKG_CONFIG_LIBS "${PKG_CONFIG_LIBS} -l${PROJECT_NAME}" CACHE INTERNAL "" FORCE)
    sdk_set_soname(${PROJECT_NAME})
    install(TARGETS ${PROJECT_NAME} DESTINATION "${SDK_LIB_INSTALL_DIR}")
endfunction()

function(sdk_install)
    SET(PKG_CONFIG_LIBS "${PKG_CONFIG_LIBS} -l${PROJECT_NAME}" CACHE INTERNAL "" FORCE)
    sdk_set_soname(${PROJECT_NAME})
    install(TARGETS ${PROJECT_NAME} DESTINATION "${SDK_LIB_INSTALL_DIR}")
    install(DIRECTORY "${PROJECT_SOURCE_DIR}/include" DESTINATION "${SDK_INCLUDE_INSTALL_DIR}")
endfunction()