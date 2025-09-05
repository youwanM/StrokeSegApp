# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.md.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: CMakeLists.txt
#
# Description: This is the main CMakeLists.txt for the StrokeSegApp project. It
# defines the project's properties, user options, and the overall build structure.
# It includes other CMake files to handle specific tasks like environment setup,
# external project integration, data population, and packaging.
#
# Main functional blocks:
# 1. Project Configuration: Sets the minimum required CMake version and project
#    details.
# 2. User Options: Defines configurable options that can be set by the user,
#    such as GPU support and debug mode.
# 3. URLs and Hashes: Centralizes URLs and integrity hashes for external
#    dependencies.
# 4. Path Definitions: Specifies the installation directories for all project
#    components.
# 5. Target Includes: Includes and integrates external projects, setup scripts,
#    data population scripts, and packaging logic.

# Set the minimum required CMake version
cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

# Project name
project(StrokeSegApp VERSION 1.0.0 LANGUAGES CXX)

# --- User Options Block ---
# This block defines several options that allow the user to customize the
# build process. These options control whether to enable CUDA support for
# GPU acceleration, and whether to show debug information during CMake
# configuration.
set(ONNX_MODELS_MONO "" CACHE FILEPATH "Model weight in ONNX format for the mono modal (T1) application.")
set(ONNX_MODELS_BI   "" CACHE FILEPATH "Model weight in ONNX format for the bi modal (T1+Flair) application.")
option(STROKESEG_GPU_CUDA "Package with cuda support" ON)
option(STROKESEG_DEBUG_CMAKE "Show some informations like paths used during CMake configuration phase" OFF)
mark_as_advanced(STROKESEG_DEBUG_CMAKE)

# --- URLs and Hashes Block ---
# This block centralizes all URLs and corresponding SHA256 hashes for external
# dependencies, ensuring that the project can reliably download and verify
# components like the Python interpreter, pip installer, and other libraries
# from their official sources.
set(Python_URL           "https://www.python.org/ftp/python/3.13.4/python-3.13.4-embed-amd64.zip")
set(get_pip_URL          "https://bootstrap.pypa.io/get-pip.py")
set(Anima_URL            "https://github.com/Inria-Empenn/Anima-Public/releases/download/v4.2/Anima-Windows-4.2.zip")
set(StrokeSegCore_URL    "git@github.com:Empenn-Stroke/StrokeSegLab.git")

set(atlas_REF_T1_URL     "https://github.com/Inria-Empenn/Anima-Scripts-Data-Public/raw/refs/heads/master/icc_atlas/Reference_T1.nrrd")
set(atlas_BRAIN_MASK_URL "https://github.com/Inria-Empenn/Anima-Scripts-Data-Public/raw/refs/heads/master/icc_atlas/BrainMask.nrrd")

set(Python_HASH          "514ca14ec356ecb7749a7c0a1ef1eac9fd9c67d57af4812cb1f0822b0d3a85e8")
set(get_pip_HASH         "b4c0f2a23c8c26893d5b9bdcd3ef8e6d3915d90f84acccafa3e7829bd0bf4414")
set(Anima_HASH           "42ff5cca0537b9fb3cd43fe83ffb7c042926afd9e203f9a739a27ac969384ed6")
set(atlas_BRAIN_MASK_HASH  "b2e48e0e6e48dabe983fe8409bce96544f0d018e79f133db5c4863256d13d139")
set(atlas_REF_T1_HASH    "0c577b4f8f2c3d60abc4eb9fcaf68c33e26c9a4323b3215a9cb474a76ce4e3de")


# --- Path Definitions Block ---
# This block defines the destination directories for all components of the
# project relative to the build directory. This centralized approach
# ensures a consistent and predictable file structure for the final
# packaged application.
set(PYTHON_DEST_DIR          "${CMAKE_BINARY_DIR}/bin/Program/Python")
set(ANIMA_DEST_DIR           "${CMAKE_BINARY_DIR}/bin/Program/Anima")
set(STROKE_SEG_CORE_DEST_DIR "${CMAKE_BINARY_DIR}/bin/Program/StrokeSegCore")
set(STROKE_SEG_BOOT_DEST_DIR "${CMAKE_BINARY_DIR}/bin/Program/StrokeSegCore")
set(ONNX_MODELS_DEST_DIR     "${CMAKE_BINARY_DIR}/bin/AppData/Models")
set(ATLAS_DEST_DIR           "${CMAKE_BINARY_DIR}/bin/AppData/Atlas")


# --- Target Includes Block ---
# This block integrates the sub-projects and scripts that form the core
# of the build process. It includes the `setup_env.cmake` script for
# environment configuration, `populateData.cmake` for handling data, and
# the `packaging.cmake` script for creating the final installer.

add_subdirectory(external) # External Targets (python, pip, anima, StrokeSegLab, ...)

include(setup_env.cmake)

include(populateData.cmake)

include(cmake/package/packaging.cmake)
