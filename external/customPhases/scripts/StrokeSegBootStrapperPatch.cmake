# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.txt.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: StrokeSegBootStrapperPatch.cmake
#
# Description: This script handles the patching of the StrokeSegBootstrapper
# source code. It copies necessary resource files from the main project's
# resource directory into the bootstrapper's source directory, ensuring
# compilation can proceed with the correct assets.
#
# Main functional blocks:
# 1. Conditional File Copy: Checks if the destination `resources` directory
#    exists and, if not, copies the ressource folder inside BootStrappe. After move the `resource.h` and `BootStrapper.rc` files
#    from the BootStrappe's `resources` directory to the root of BootStrappe

if(NOT EXISTS ./resources/)
  file(COPY_FILE ../resources/ DESTINATION  ./resources/)
  file(RENAME  ./resources/resource.h DESTINATION  ./resource.h)
  file(RENAME  ./resources/BootStrapper.rc DESTINATION  ./BootStrapper.rc)
endif()

