
set(ICONS_PATH "${PROJECT_SOURCE_DIR}/resources") #/StrokeSeg.ico")

# Used on pinned on taskbar
set(CPACK_PACKAGE_ICON ${ICONS_PATH}/StrokeSegPWR.ico)
string(REGEX REPLACE "/" "\\\\\\\\" ICONS_PATH "${ICONS_PATH}")

message("****************************************** ${ICONS_PATH} **********************************************")

#if(CPACK_GENERATOR MATCHES "NSIS")

	# The icon to install the application.
	set(CPACK_NSIS_MUI_ICON ${ICONS_PATH}\\\\StrokeSegPWR.ico)

	# The icon to uninstall the application.
	set(CPACK_NSIS_MUI_UNIICON ${ICONS_PATH}\\\\StrokeSegUn.ico)

	# The icon in the Add/Remove control panel
	set(CPACK_NSIS_INSTALLED_ICON_NAME ${ICONS_PATH}\\\\StrokeSegPWR.ico)


	
	set(CPACK_NSIS_COMPRESSOR "lzma")

	# Add APP to the PATH
	set(CPACK_NSIS_MODIFY_PATH "ON")

    set(CPACK_NSIS_DISPLAY_NAME ${CPACK_PACKAGE_NAME})
	
	set(CPACK_NSIS_PACKAGE_NAME "${CPACK_PACKAGE_NAME}")

	# Add a link to the application website in the Startup menu.
	set(CPACK_NSIS_MENU_LINKS
	  "SegStrokCore/StrokeSegBootStrapper.exe" 
	  "${CMAKE_PROJECT_NAME}") 

	# Run APP after installation
	set(CPACK_NSIS_MUI_FINISHPAGE_RUN "$INSTDIR\\\\SegStrokCore\\\\StrokeSegBootStrapper.exe")

	# Delete the Startup menu link after uninstallation
	set(CPACK_NSIS_DELETE_ICONS_EXTRA " Delete '\$SMPROGRAMS\\\\$MUI_TEMP\\\\*.*' ")
	
	set(CPACK_NSIS_DATA_INSTALL_DIRECTORY "$COMMONPROGRAMDATA\\\\${CPACK_PACKAGE_NAME}\\\\")
