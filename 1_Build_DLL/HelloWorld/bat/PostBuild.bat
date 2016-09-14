@echo off

rem Step 1 (building the DLL) should already be done.

rem SET VARIABLES
set WIN-x86_DLL_VS=%~1

pushd "%~dp0\..\..\..\2_Build_ANE"
set BUILD_ANE_HOME_FOLDER=%CD%
popd

pushd "%~dp0\..\..\..\3_Build_App"
set BUILD_APP_HOME_FOLDER=%CD%
popd


rem Step 2 : Build the ANE.
call "%BUILD_ANE_HOME_FOLDER%\bat\CustomBuild.bat"


rem Step 3.1 : Prepare the ANE for building the application.
call "%BUILD_APP_HOME_FOLDER%\bat\Custom_PrepareANE.bat"


rem Step 3.2 : Build the application manually from FlashDevelop by hitting F5.