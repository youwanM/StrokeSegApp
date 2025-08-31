
set(cmake_args
  ${ep_common_cache_args}
  )
  
set(cmake_cache_args
  -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/bin/Program/StrokeSegCore/
  -DPREFIX_NAME:STRING=StrokeSeg 
  )

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