#Core_DIR
	
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    rm
	-rf
	${Core_DIR}/.git/)