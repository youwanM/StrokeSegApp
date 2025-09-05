# Fichier: get_pip.cmake
#
# Description: This CMake module is responsible for fetching the `get-pip.py`
# script, which is a crucial first step for setting up the Python environment.
# It ensures that the script is downloaded from a trusted URL and its integrity
# is verified before it is used to install other Python dependencies.
#
# Main functional blocks:
# 1. `ExternalProject_Add` Call: Configures the download and installation
#    process for `get-pip.py`.
# 2. URL and Hash Verification: Specifies the URL for the script and the
#    SHA256 hash to guarantee a secure and uncorrupted download.
# 3. Execution Dependency: Sets a dependency on the `Python` external project,
#    ensuring that the Python interpreter is available before attempting to
#    download the `get-pip.py` script.
# 4. Debugging Messages: Provides optional status messages to help diagnose
#    any issues with the download or installation process.


# --- `ExternalProject_Add` Call Block ---
# This block sets up the external project for `get-pip.py`. It defines all the
# necessary paths and commands, ensuring the script is downloaded and installed correctly.
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
    DOWNLOAD_COMMAND  "${${ep}_DOWNLOAD_CMD}"
    PATCH_COMMAND     "${${ep}_PATCH_CMD}"
    CONFIGURE_COMMAND ""  # No configure step
    BUILD_COMMAND     ""  # No build step
    INSTALL_COMMAND   "${${ep}_INSTALL_CMD}"
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    STEP_TARGETS download install # Only enable download and install
    LOG_DOWNLOAD ON
    DEPENDS Python
)

# --- Debugging Messages Block ---
# Similar to other external project modules, this block provides messages
# for debugging purposes, showing the configuration details of the `get_pip`
# external project.
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