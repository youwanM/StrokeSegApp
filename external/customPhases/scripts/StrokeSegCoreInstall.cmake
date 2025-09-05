# Fichier: StrokeSegCoreInstall.cmake
#
# Description: This script handles the installation of the compiled
# StrokeSegCore binaries. It copies the entire build output directory to the
# final installation location.
#
# Main functional blocks:
# 1. Binary Copying: Uses a `copy_directory_if_different` command to perform
#    a recursive copy of the compiled binaries to their destination.

# SOURCE_DIR
# DESTINATION_DIR
	
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    copy_directory_if_different
    ${SOURCE_DIR}
    ${DESTINATION_DIR})