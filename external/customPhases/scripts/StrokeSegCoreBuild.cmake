#SOURCE_DIR
#DESTINATION_DIR
	
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    copy_directory_if_different
    ${SOURCE_DIR}
    ${DESTINATION_DIR})
	
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    rm
	-rf
	${DESTINATION_DIR}/.git/)
	
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    rm
	-rf
	${DESTINATION_DIR}/.gitignore)