# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.txt.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: StrokeSegCore.cmake
#
# Description: This CMake module is responsible for fetching, building, and
# installing the main `StrokeSegCore` project from a Git repository. It uses
# `ExternalProject_Add` to clone the source code, build it according to the
# specified generator, and then install the final product.
#
# Main functional blocks:
# 1. `ExternalProject_Add` Call: Configures the entire lifecycle for the
#    `StrokeSegCore` project, from downloading a specific branch (`main`)
#    from a Git repository to building and installing the project.
# 2. Git Configuration: Specifies the Git repository URL and the branch to
#    clone.
# 3. Build and Install Commands: Specifies the commands for the `build` and
#    `install` steps, which are crucial for a project that requires compilation.
# 4. Debugging Messages: Provides optional `message` commands for debugging.


# --- `ExternalProject_Add` Call Block ---
# This block sets up the external project for `StrokeSegCore`. It defines all
# the necessary paths and tells CMake how to handle the project from a Git
# repository.
ExternalProject_Add(${ep}
    PREFIX "${EP_BASE_PATH}"
    
    TMP_DIR      "${EP_BASE_PATH}/tmp/${ep}/"
    STAMP_DIR    "${EP_BASE_PATH}/stamp/${ep}/"
    DOWNLOAD_DIR "${EP_BASE_PATH}/download/${ep}/"
    SOURCE_DIR   "${EP_BASE_PATH}/source/${ep}/"
    BINARY_DIR   "${EP_BASE_PATH}/build/${ep}/"
    INSTALL_DIR  "${EP_BASE_PATH}/install/${ep}/"
    LOG_DIR      "${EP_BASE_PATH}/log/${ep}/"
    
    GIT_REPOSITORY "${${ep}_URL}"
    GIT_TAG "${${ep}_TAG}"  
    
    CMAKE_GENERATOR ${gen}
    CMAKE_GENERATOR_PLATFORM ${CMAKE_GENERATOR_PLATFORM}
    CMAKE_ARGS ${cmake_args}
    CMAKE_CACHE_ARGS ${cmake_cache_args}
    
    DOWNLOAD_NAME     "${${ep}_NAME}"
    #PATCH_COMMAND     "${${ep}_PATCH_CMD}"
    CONFIGURE_COMMAND ""  # No configure step
    BUILD_COMMAND     "${${ep}_BUILD_CMD}"
    INSTALL_COMMAND   "${${ep}_INSTALL_CMD}"
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    STEP_TARGETS download build install # Only enable download and install (unzip)
    LOG_DOWNLOAD ON
)

# --- Debugging Messages Block ---
# This block provides a final set of messages to confirm the configuration
# of the core project, which is useful for debugging.
if(${STROKESEG_DEBUG_CMAKE})
    message("******************************")
    message("EP     : ${ep}")
    message("Name   : ${${ep}_NAME}")
    message("Patch  : ${${ep}_PATCH_CMD}")
    message("Config : ")
    message("Build  : ")
    message("Install: ${${ep}_INSTALL_CMD}")
    message("******************************")
endif()
