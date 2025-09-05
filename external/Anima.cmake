# Fichier: Anima.cmake
#
# Description: This CMake module manages the Anima external project. It uses
# `ExternalProject_Add` to download a zipped release from a URL, verifies its
# integrity using a SHA256 hash, and installs it into a designated directory.
# This script ensures that the Anima binaries and libraries are correctly
# fetched and placed in the project's build tree without needing a full build.
#
# Main functional blocks:
# 1. `ExternalProject_Add` Call: Configures the entire external project lifecycle
#    for Anima, including paths for temporary files, source, build, and installation.
# 2. URL and Integrity Check: Specifies the download URL and the expected
#    SHA256 hash for the Anima archive.
# 3. Build Configuration: Explicitly disables the configure and build steps,
#    as the Anima project is pre-built and only needs to be downloaded and
#    unzipped.
# 4. Debugging Messages: Provides optional `message` commands to display
#    information about the project's configuration if the `STROKESEG_DEBUG_CMAKE`
#    option is enabled.


# --- `ExternalProject_Add` Call Block ---
# This block defines the external project configuration for Anima. It sets
# all the necessary paths and tells CMake how to handle the project.
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