
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
    CONFIGURE_COMMAND ""  # No configure step
    BUILD_COMMAND     ""  # No build step
    INSTALL_COMMAND   ${${ep}_INSTALL_CMD}
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    STEP_TARGETS download install# Only enable download and install (unzip)
    LOG_DOWNLOAD ON
)
