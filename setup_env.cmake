# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.md.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: setup_env.cmake
#
# Description: This script is responsible for setting up the project's Python
# environment and installing all required Python dependencies. It defines a
# custom target that automates the installation process, ensuring all
# necessary libraries are present for the application to run.
#
# Main functional blocks:
# 1. Path Configuration: Converts the Python destination path to a native
#    format and sets up the new PATH environment variable for the installation commands.
# 2. Dependency Selection: Chooses the correct ONNX runtime package based on
#    whether CUDA support is enabled.
# 3. Custom Target Definition: Defines the 'setup_environment' target, which
#    executes a series of commands to install pip and all required Python
#    packages. This target is set to run by default during the build process.
# 4. Dependency Management: Ensures that the `setup_environment` target
#    depends on other necessary targets, like `ExternalProject`, to guarantee
#    a correct execution order.

# --- Path Configuration Block ---
# This block configures the Python environment paths. It converts the CMake
# path to a native format suitable for the operating system and adds the
# 'Scripts' subdirectory to the PATH environment variable.
set(PYTHON_FOLDER "${PYTHON_DEST_DIR}")

file(TO_NATIVE_PATH ${PYTHON_DEST_DIR} PYTHON_NATIVE_FOLDER)
set(NEW_PATH "${PYTHON_NATIVE_FOLDER}\\;${PYTHON_NATIVE_FOLDER}\\Scripts")

# --- Dependency Selection Block ---
# This block conditionally selects the ONNX runtime library. If the user
# has enabled STROKESEG_GPU_CUDA, the CUDA-enabled version of onnxruntime
# is chosen. Otherwise, the standard CPU version is used.
if(${STROKESEG_GPU_CUDA})
    set(ONNX_RUNTIME "onnxruntime-gpu[cudnn]")
else()
    set(ONNX_RUNTIME "onnxruntime")
endif()

# --- Custom Target Definition Block ---
# This block defines the 'setup_environment' custom target. It uses CMake's
# ExternalProject module to download and set up the Python environment,
# including the installation of `pip` and all necessary Python packages via
# a series of `pip install` commands.
add_custom_target(setup_environment
    ALL # This target will run by default when you build the project
    COMMENT "Setting up Python environment and dependencies via ExternalProject"
    WORKING_DIRECTORY ${PYTHON_FOLDER}
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe ./get-pip.py
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install --upgrade pip setuptools wheel
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install tkinter-embed  --target .
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install ${ONNX_RUNTIME}
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install nibabel
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install scipy
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install tkhtmlview
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install markdown
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install scikit-image
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install scikit-learn
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install pandas
)

# --- Dependency Management Block ---
# This block adds a dependency to the 'setup_environment' target. This ensures
# that this target is executed only after its dependencies, such as the
# external projects needed for the environment setup, are completed.
add_dependencies(setup_environment  
    ${ALL_DEPENDENCIES}
)

