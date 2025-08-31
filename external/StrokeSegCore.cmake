
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
    GIT_TAG "main"  
    
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