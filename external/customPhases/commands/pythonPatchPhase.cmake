
set(embed_python_PATCH_CMD  
    ${CMAKE_COMMAND}
    -DWORKING_DIR=${CMAKE_BINARY_DIR}/ExtProjs/source/embed_python
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/patchs/pythonPatch.cmake)
