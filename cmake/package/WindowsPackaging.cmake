
set(ICONS_PATH "${PROJECT_SOURCE_DIR}/resources")

# Used on pinned on taskbar
set(CPACK_PACKAGE_ICON ${ICONS_PATH}/StrokeSegPWR.ico)
string(REGEX REPLACE "/" "\\\\\\\\" ICONS_PATH "${ICONS_PATH}")


# The icon to install the application.
set(CPACK_NSIS_MUI_ICON ${ICONS_PATH}\\\\StrokeSegPWR.ico)

# The icon to uninstall the application.
set(CPACK_NSIS_MUI_UNIICON ${ICONS_PATH}\\\\StrokeSegUn.ico)

# The icon in the Add/Remove control panel
set(CPACK_NSIS_INSTALLED_ICON_NAME ${ICONS_PATH}\\\\StrokeSegPWR.ico)

set(CPACK_NSIS_EXECUTABLES_DIRECTORY StrokeSegCore)

set(CPACK_NSIS_UNINSTALL_NAME "${CPACK_PACKAGE_NAME}_Uninstall")


set(CPACK_NSIS_COMPRESSOR "lzma")

# Add APP to the PATH
set(CPACK_NSIS_MODIFY_PATH "ON")

set(CPACK_NSIS_DISPLAY_NAME ${CPACK_PACKAGE_NAME})

set(CPACK_NSIS_PACKAGE_NAME "${CPACK_PACKAGE_NAME}")

# Add a link to the application website in the Startup menu.
#set(CPACK_NSIS_MENU_LINKS
#  "StrokeSegCore\\\\StrokeSegBootStrapper.exe" 
#  "${CPACK_PACKAGE_NAME}") 

# Add a link to the application website in the Startup menu.
list(APPEND CPACK_NSIS_MENU_LINKS
  "https://github.com/Empenn-Stroke/StrokeSegApp" 
  "Project website") 
  
# Add a link to the application website in the Startup menu.
list(APPEND CPACK_NSIS_MENU_LINKS
  "https://strokeseg-doc.readthedocs.io" 
  "Online documentation") 

# Add a link to the application website in the Startup menu.
list(APPEND CPACK_NSIS_MENU_LINKS
  "doc\\\\StrokeSegBootStrapper\\\\html\\\\index.html" 
  "Local documentation") 

# Run APP after installation
set(CPACK_NSIS_MUI_FINISHPAGE_RUN "StrokeSegBootStrapper.exe")

set(CPACK_NSIS_MODELS_INSTALL_DIRECTORY "$COMMONPROGRAMDATA\\\\${CPACK_PACKAGE_NAME}\\\\")
set(CPACK_NSIS_ATLAS_INSTALL_DIRECTORY  "$COMMONPROGRAMDATA\\\\${CPACK_PACKAGE_NAME}\\\\")

set(CPACK_NSIS_MANIFEST_DPI_AWARE ON)

set(CPACK_NSIS_CREATE_ICONS_EXTRA  "  CreateShortCut \\\"$DESKTOP\\\\StrokeSeg.lnk\\\" \\\"$INSTDIR\\\\StrokeSegCore\\\\StrokeSegBootStrapper.exe\\\"")
set(CPACK_NSIS_DELETE_ICONS_EXTRA  "  Delete \\\"$DESKTOP\\\\StrokeSeg.lnk\\\"")