# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.md.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: CMakeLists.txt
#
# Description: This is the main CMakeLists.txt for managing external dependencies.
# It sets up the environment for fetching, building, and installing external
# projects using CMake's `ExternalProject` module. It dynamically includes
# dedicated CMake files for each external project, ensuring a clean and modular
# approach to dependency management.
#
# Main functional blocks:
# 1. External Project Configuration: Includes the `ExternalProject` module and
#    sets the base path for all external project builds.
# 2. Generator Selection: Determines the correct CMake generator to use for
#    sub-builds.
# 3. Custom Phase Inclusion: Searches for and includes any custom CMake scripts
#    that define additional build steps or "phases" for external projects.
# 4. Module Inclusion and Dependency Management: Iterates through all `.cmake`
#    files in the current directory, includes them as external project modules,
#    and builds a list of all dependencies for later use.

# --- External Project Configuration Block ---
# This block includes the core CMake module for handling external projects and
# defines a base directory where all temporary, build, and installation files
# for these projects will be stored.
include(ExternalProject)
set(EP_BASE_PATH ${CMAKE_BINARY_DIR}/ExtProjs)


# --- Generator Selection Block ---
# This block determines which CMake generator should be used for the external
# projects. It checks for a secondary generator (`CMAKE_EXTRA_GENERATOR`) and
# falls back to the primary one (`CMAKE_GENERATOR`) if no extra generator is specified.
if(CMAKE_EXTRA_GENERATOR)
    set(gen "${CMAKE_EXTRA_GENERATOR} -G ${CMAKE_GENERATOR}")
else()
    set(gen "${CMAKE_GENERATOR}")
endif()


# --- Custom Phase Inclusion Block ---
# This block dynamically finds and includes custom command scripts located
# in a 'customPhases/commands' subdirectory. This allows for flexible and
# reusable build steps that can be applied to different external projects.
file(GLOB custumPhases "customPhases/commands/*.cmake")
foreach(custumPhase ${custumPhases})
    message(STATUS "Including custom command from: ${custumPhase}")
    include(${custumPhase})
endforeach()
message(STATUS " ")


# --- Module Inclusion and Dependency Management Block ---
# This block iterates through all CMake modules in the current directory.
# For each module found, it includes the file, which in turn defines an
# `ExternalProject_Add` call. The name of the project is added to a list
# of dependencies (`ALL_DEPENDENCIES`) to be used later in the main `CMakeLists.txt`.
file(GLOB modules "*.cmake")
foreach(module ${modules})    
    get_filename_component(ep ${module} NAME_WE) # Get the file name without the extension
    message(STATUS "Including module: ${ep}")   
    include(${module})                           # Include the CMake module    
    list(APPEND ALL_DEPENDENCIES ${ep})
endforeach()
message(STATUS " ")

set(ALL_DEPENDENCIES ${ALL_DEPENDENCIES} PARENT_SCOPE)

