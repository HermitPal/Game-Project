include(FetchContent)
FetchContent_Declare(
    SDL3
    URL https://github.com/libsdl-org/SDL/releases/download/release-3.2.4/SDL3-devel-3.2.4-VC.zip
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
FetchContent_MakeAvailable(SDL3)
set(SDL3_DIR "${sdl3_SOURCE_DIR}/cmake")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS_DIRECTORY ${CMAKE_SOURCE_DIR})

# Set output directories without Debug/Release subdirectory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_SOURCE_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_SOURCE_DIR}/bin)

find_package(SDL3 REQUIRED)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE SDL3::SDL3)

if(CMAKE_SYSTEM_PROCESSOR MATCHES "ARM64")
    set(SDL_DLL_PATH "${sdl3_SOURCE_DIR}/lib/arm64/SDL3.dll")
else()
    set(SDL_DLL_PATH "${sdl3_SOURCE_DIR}/lib/x64/SDL3.dll")
endif()

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    "${SDL_DLL_PATH}"
    ${CMAKE_SOURCE_DIR}/bin
) 