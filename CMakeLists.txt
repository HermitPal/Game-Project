cmake_minimum_required(VERSION 3.30)
project(YourProjectName VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(WIN32)
    include(${CMAKE_SOURCE_DIR}/cmake/Windows.cmake)
endif()

