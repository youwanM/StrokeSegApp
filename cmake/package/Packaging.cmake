# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.txt.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: Packaging.cmake
#
# Description: This script is the central configuration file for packaging the
# project using CPack. It defines all the common parameters for the installer,
# including package name, version, and descriptive information. It also
# structures the project's output files into distinct components and component
# groups, allowing for modular installation.
#
# Main functional blocks:
# 1. Install Phase Definition: Specifies which directories from the build
#    output should be installed and maps them to specific CPack components
#    (e.g., BIN, ATLAS, MODELS).
# 2. Common CPack Parameters: Sets universal package properties such as the
#    name, description, vendor information, and version numbers.
# 3. Platform-Specific Configuration: Includes a dedicated script for
#    Windows-specific packaging options (e.g., NSIS settings) if the platform
#    is Windows.
# 4. Component Definition: Uses CPack modules to define the package components
#    and component groups. This allows the user to select which parts of the
#    application (e.g., the software binary, the data atlas, the models) they
#    want to install.

# --- Install Phase Definition Block ---
# This block defines the installation rules for the project's build
# artifacts. It specifies that the 'bin/Program' and 'bin/AppData'
# directories from the build location should be installed in the destination
# directory, assigning them to their respective components (BIN, ATLAS, MODELS)
# for fine-grained control during installation.
install(DIRECTORY ${CMAKE_BINARY_DIR}/bin/Program/ DESTINATION       . COMPONENT BIN)
install(DIRECTORY ${CMAKE_BINARY_DIR}/bin/AppData/Atlas DESTINATION  . COMPONENT ATLAS)
install(DIRECTORY ${CMAKE_BINARY_DIR}/bin/AppData/Models DESTINATION . COMPONENT MODELS)

# --- Common CPack Parameters Block ---
# This block sets the metadata for the final package. It includes
# the package name, a short summary, a detailed description, vendor and
# contact information, and version numbers. It also links to external
# resource files like the license and readme documents.
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
set(CPACK_RESOURCE_FILE_LICENSE    "${CMAKE_SOURCE_DIR}/LICENSE.txt")
set(CPACK_RESOURCE_FILE_README     "${CMAKE_SOURCE_DIR}/Readme.md")
set(CPACK_RESOURCE_FILE_WELCOME    "${CMAKE_SOURCE_DIR}/Welcome.md")

set(CPACK_PACKAGE_INSTALL_DIRECTORY "${CPACK_PACKAGE_NAME}")

set(CPACK_PACKAGE_EXECUTABLES ${CPACK_PACKAGE_NAME}BootStrapper;${CPACK_PACKAGE_NAME})
set(CPACK_CREATE_DESKTOP_LINKS ${CPACK_PACKAGE_NAME})

set(CPACK_THREADS 0)

set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME} ${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR} Setup Frontier Package")
                    
# --- Platform-Specific Configuration Block ---
# This block includes a separate configuration file for Windows-specific
# settings if the current build platform is WIN32. This modular approach
# keeps the main script clean and allows for easy management of platform-
# specific details.
if (WIN32)
    set(WIN_PACK_DIR ${CMAKE_SOURCE_DIR}/cmake/package)
    include(${WIN_PACK_DIR}/WindowsPackaging.cmake)
endif()

# --- Component Definition Block ---
# This block defines the components and component groups for the installer.
# The `DATA` group is created to contain the `ATLAS` and `MODELS` components.
# The `BIN` component, which includes the software's executables, is set as
# a required component. This structure gives the user control over which parts
# of the application are installed.
include (CPack)

cpack_add_component_group(DATA
                          DISPLAY_NAME "Data"
                          DESCRIPTION "Data used by application internaly like IA models, atlas and mask."
                          EXPANDED)
                          
cpack_add_component(BIN
                    DISPLAY_NAME Software
                    DESCRIPTION "Contains IA, Algorithums and Graphics Interface"
                    REQUIRED)

cpack_add_component(ATLAS
                    DISPLAY_NAME Atlas
                    DESCRIPTION "Atlas and mask"
                    GROUP DATA
                    REQUIRED)

cpack_add_component(MODELS
                    DISPLAY_NAME Models
                    DESCRIPTION "Contains IA models"
                    GROUP DATA)

set(CPACK_COMPONENT_APPLICATIONS_GROUP "Runtime")
