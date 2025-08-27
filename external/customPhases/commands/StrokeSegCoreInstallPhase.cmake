
set(app_seg_PATCH_CMD  
    ${CMAKE_COMMAND}
    -E
    rm
	-rf
	${CMAKE_BINARY_DIR}/ExtProjs/source/app_seg/.git/)
