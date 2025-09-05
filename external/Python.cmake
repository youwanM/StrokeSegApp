# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.md.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: Python.cmake
#
# Description: This CMake module manages the Python external project. It is
# responsible for downloading an embedded version of the Python interpreter,
# verifying its integrity with a SHA256 hash, and installing it into the
# project's designated directory. This ensures that the application has a
# self-contained Python environment.
#
# Main functional blocks:
# 1. `ExternalProject_Add` Call: Configures the download and installation of
#    the Python interpreter. It defines the paths and sets the step targets
#    to only include `download` and `install` as the package is a pre-compiled
#    archive.
# 2. URL and Hash Verification: Uses the pre-defined URL and SHA256 hash to
#    securely fetch the Python archive.
# 3. Debugging Messages: Provides optional `message` commands for displaying
#    configuration details when debug mode is enabled.


# --- `ExternalProject_Add` Call Block ---
# This block sets up the external project for Python. It defines all the
# necessary paths and tells CMake how to download and install the
# embedded Python package.
ExternalProject_Add(${ep}
    PREFIX "${EP_BASE_PATH}"
    
    TMP_DIR      "${EP_BASE_PATH}/tmp/${ep}/"
    STAMP_DIR    "${EP_BASE_PATH}/stamp/${ep}/"
    DOWNLOAD_DIR "${EP_BASE_PATH}/download/${ep}/"
    SOURCE_DIR   "${EP_BASE_PATH}/source/${ep}/"
    BINARY_DIR   "${EP_BASE_PATH}/build/${ep}/"
    INSTALL_DIR  "${EP_BASE_PATH}/install/${ep}/"
    LOG_DIR      "${EP_BASE_PATH}/log/${ep}/"
    
    URL "${${ep}_URL}"
    URL_HASH SHA256=${${ep}_HASH}  
    
    CMAKE_GENERATOR ${gen}
    CMAKE_GENERATOR_PLATFORM ${CMAKE_GENERATOR_PLATFORM}
    CMAKE_ARGS ${cmake_args}
    CMAKE_CACHE_ARGS ${cmake_cache_args}
    
    DOWNLOAD_NAME     "${${ep}_NAME}"
    PATCH_COMMAND     "${${ep}_PATCH_CMD}"
    CONFIGURE_COMMAND ""  # No configure step
    BUILD_COMMAND     ""  # No build step
    INSTALL_COMMAND   "${${ep}_INSTALL_CMD}"
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    STEP_TARGETS download install # Only enable download and install (unzip)
    LOG_DOWNLOAD ON
)

# --- Debugging Messages Block ---
# This block provides debugging messages, similar to other external projects,
# to help diagnose configuration issues.
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
