cmake_minimum_required(VERSION 3.25)
project(Ta2As)


enable_language(C CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_C_STANDARD 23)

option(CXX_ANALYZER true)
option(IS_GCC_BUILD true)
include(warnings.cmake)

if (CXX_ANALYZER)
    if (IS_GCC_BUILD)
        add_compile_options(-fanalyzer)
    elseif (IS_CLANG_BUILD)
        add_compile_options(-w -Xanalyzer -analyze)
    endif ()
endif ()


if (CMAKE_COMPILER_IS_GNUCXX OR IS_CLANG_BUILD OR IS_GCC_BUILD)
    add_compile_options(-g3 -fdiagnostics-color=always)
    add_compile_options($<$<CONFIG:Debug>:-Og> $<$<CONFIG:Release>:-O3>)
    add_compile_options(${COMPILER_WARNINGS})
    message(STATUS "GCC/CLANG detected, adding compile flags")

endif (CMAKE_COMPILER_IS_GNUCXX OR IS_CLANG_BUILD OR IS_GCC_BUILD)

if (BUILD_TYPE_ID STREQUAL "release")
    #message(STATUS "Enabling LTO")
    # set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
endif (BUILD_TYPE_ID STREQUAL "release")


add_compile_options(-fanalyzer -static)
add_executable(TA2AS "src/main.c" "src/ta2as.c")
target_include_directories(TA2AS PUBLIC "src")