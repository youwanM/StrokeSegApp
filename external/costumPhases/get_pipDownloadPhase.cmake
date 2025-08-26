
set(get_pip_DOWNLOAD_CMD
    ${CMAKE_COMMAND}
    -DURL=${get_pip_URL}
    -DDESTINATION=${CMAKE_BINARY_DIR}/ExtProjs/source/get_pip/get-pip.py
    -DSHA256=${get_pip_HASH}
    -P
    ${CMAKE_SOURCE_DIR}/cmake/DownloadFile.cmake)
