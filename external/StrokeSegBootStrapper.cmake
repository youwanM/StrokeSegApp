# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.txt.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: StrokeSegBootStrapper.cmake
#
# Description: This CMake module manages the `StrokeSegBootStrapper` external
# project. It is configured to build a native executable from local source
# files and install it to a specified destination. This bootstrapper is a
# critical component for launching the main application.
#
# Main functional blocks:
# 1. Arguments Definition: Sets the necessary `cmake_args` and `cmake_cache_args`
#    for the external project, including the installation prefix and a custom
#    prefix name.
# 2. `ExternalProject_Add` Call: Configures the build and installation process
#    for the bootstrapper. It specifies the local source directory, the build
#    directory, and the final installation directory.
# 3. Debugging Messages: Displays configuration details for debugging if the
#    `STROKESEG_DEBUG_CMAKE` option is enabled.


# --- Arguments Definition Block ---
# This block sets the arguments passed to the external project's CMake call.
# It defines the installation prefix and a custom prefix name that will be
# used during the build.
set(cmake_args
  ${ep_common_cache_args}
  )
  
set(cmake_cache_args
  -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/bin/Program/StrokeSegCore/
  -DPREFIX_NAME:STRING=StrokeSeg 
  )

# --- `ExternalProject_Add` Call Block ---
# This block configures the external project for the bootstrapper. It points
# to a local source directory (`CMAKE_SOURCE_DIR}/BootStrap`) instead of a
# remote URL, ensuring that the local code is built and installed correctly.
ExternalProject_Add(${ep}
    PREFIX "${EP_BASE_PATH}"
    
    TMP_DIR      "${EP_BASE_PATH}/tmp/${ep}/"
    STAMP_DIR    "${EP_BASE_PATH}/stamp/${ep}/"
    DOWNLOAD_DIR "${EP_BASE_PATH}/download/${ep}/"
    SOURCE_DIR   "${CMAKE_SOURCE_DIR}/BootStrap"
    BINARY_DIR   "${EP_BASE_PATH}/build/${ep}/"
    INSTALL_DIR  "${STROKE_SEG_BOOT_DEST_DIR}"
    LOG_DIR      "${EP_BASE_PATH}/log/${ep}/"    
    
    CMAKE_GENERATOR ${gen}
    CMAKE_GENERATOR_PLATFORM ${CMAKE_GENERATOR_PLATFORM}
    CMAKE_ARGS ${cmake_args}
    CMAKE_CACHE_ARGS ${cmake_cache_args}
	
	PATCH_COMMAND     "${${ep}_PATCH_CMD}"
)

# --- Debugging Messages Block ---
# This block provides a final set of messages to confirm the configuration
# of the bootstrapper project, which is useful for debugging.
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
