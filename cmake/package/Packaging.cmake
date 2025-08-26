

###############################################################################
## Install phases for CPack bundelling
###############################################################################
install(DIRECTORY ${CMAKE_BINARY_DIR}/bin/Program/ DESTINATION . COMPONENT BIN)
#install(DIRECTORY D:/d/Yann/StrokSegApp-build/titi DESTINATION . COMPONENT BIN)
install(DIRECTORY ${CMAKE_BINARY_DIR}/bin/AppData/ DESTINATION . COMPONENT DATA)

###############################################################################
## Set common CPACK parameters
###############################################################################
set(CPACK_PACKAGE_NAME StrokeSeg CACHE STRING "Name of the package for the superproject")
mark_as_advanced(CPACK_PACKAGE_NAME)

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "${CPACK_PACKAGE_NAME} - sub-acute and chronic brain stroke lesion segmentation tool")

set(CPACK_PACKAGE_DESCRIPTION  "${CPACK_PACKAGE_NAME} is an automated sub-acute and chronic brain stroke lesion segmentation tool developed by team Empenn in Rennes (FR)")

set(CPACK_PACKAGE_VENDOR  "https://${CPACK_PACKAGE_NAME}.inria.fr")
set(CPACK_PACKAGE_CONTACT "${CPACK_PACKAGE_NAME} Team <${CPACK_PACKAGE_NAME}@inria.fr>")

set(CPACK_PACKAGE_VERSION_MAJOR ${${PROJECT_NAME}_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${${PROJECT_NAME}_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${${PROJECT_NAME}_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION ${${PROJECT_NAME}_VERSION})

set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_SOURCE_DIR}/Description.md")
set(CPACK_RESOURCE_FILE_LICENSE    "${CMAKE_SOURCE_DIR}/LICENSE.md")
set(CPACK_RESOURCE_FILE_README     "${CMAKE_SOURCE_DIR}/Readme.md")
set(CPACK_RESOURCE_FILE_WELCOME    "${CMAKE_SOURCE_DIR}/Welcome.md")

set(CPACK_PACKAGE_INSTALL_DIRECTORY "${CPACK_PACKAGE_NAME}")

set(CPACK_CREATE_DESKTOP_LINKS "${CPACK_PACKAGE_NAME}") # Add a desktop shortcut
set(CPACK_PACKAGE_EXECUTABLES ${CPACK_PACKAGE_NAME}BootStraper;${CPACK_PACKAGE_NAME}) # Add shortcut in the Startup menu

set(CPACK_THREADS 0)

###############################################################################
## Set cpack variables specific to the plateform
###############################################################################
if (WIN32)
    set(WIN_PACK_DIR ${CMAKE_SOURCE_DIR}/cmake/package)
    include(${WIN_PACK_DIR}/WindowsPackaging.cmake)
endif()


###############################################################################
## Include cpack modules
###############################################################################
include (CPack)

