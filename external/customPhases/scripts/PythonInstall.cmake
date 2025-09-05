# Fichier: PythonInstall.cmake
#
# Description: This script handles the installation of the Python directory.
# It copies the entire source directory containing the embedded Python
# installation to the specified destination, ensuring all files and subdirectories
# are correctly moved.
#
# Main functional blocks:
# 1. Directory Copying: Uses a `copy_directory_if_different` command to
#    perform a recursive copy of the Python installation directory.

# SOURCE_DIR
# DESTINATION_DIR
	
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    copy_directory_if_different
    ${SOURCE_DIR}
    ${DESTINATION_DIR})