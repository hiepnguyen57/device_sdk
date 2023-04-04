cmake_minimum_required(VERSION 3.16)
project(glogger)

add_executable(glogger main.cpp)
target_link_libraries(glogger glog::glog)