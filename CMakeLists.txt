cmake_minimum_required (VERSION 3.16 FATAL_ERROR)
project(sdk VERSION 1.0.0 LANGUAGES CXX)

# get the cmake build files
get_filename_component(DEVICE_CMAKE_BUILD cmake ABSOLUTE)
include(${DEVICE_CMAKE_BUILD}/BuildDefaults.cmake)

# Set variables for target install and .pc pkg-config file
include(${DEVICE_CMAKE_BUILD}/conf/PrepareInstall.cmake)

# Devices SDK targets
add_subdirectory(third-party)

add_subdirectory(examples)
