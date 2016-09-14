@echo off

rem SET FOLDER & FILE TARGETS
echo ---SETTING VARIABLES--- & echo/
	rem FOLDERS
set SOURCE_AS3=%BUILD_ANE_HOME_FOLDER%\src
set LIBRARY_FOLDER=%BUILD_ANE_HOME_FOLDER%\lib
set PLATFORM_FOLDER=%LIBRARY_FOLDER%\platforms
set PLATFORM_WIN-x86=%PLATFORM_FOLDER%\Windows-x86

set OUTPUT_FOLDER=%BUILD_ANE_HOME_FOLDER%\bin

	rem INPUT FILES
set SWC_LIBRARY=%LIBRARY_FOLDER%\HelloWorldSWC.swc
set SWF_LIBRARY=%PLATFORM_WIN-x86%\library.swf
set DESCRIPTOR_FILE=%LIBRARY_FOLDER%\descriptor.xml

set WIN-x86_DLL=%PLATFORM_WIN-x86%\HelloWorld.dll

	rem OUTPUT FILES
set ANE_OUTPUT_FILE=%OUTPUT_FOLDER%\HelloWorldANE.ane



rem CLEAN OLD FILES
echo/ & echo ---CLEANING OLD FILES--- & echo/
del "%SWC_LIBRARY%"
del "%SWF_LIBRARY%"
del "%WIN-x86_DLL%"


rem COMPILE SWC
echo/ & echo ---COMPILING SWC LIBRARY--- & echo/
compc -include-sources "%SOURCE_AS3%" -output "%SWC_LIBRARY%" -load-config "%FLEXAIR_SDK_HOME%\frameworks\air-config.xml" -swf-version 14

rem UNZIP WINDOWS-x86 library.swf FROM SWC FILE
echo/ & echo ---UNZIP library.swf FROM SWC---
rem You can use any unzipping tool you want.
"C:\Program Files\7-Zip\7z.exe" x "%SWC_LIBRARY%" -o"%PLATFORM_WIN-x86%" library.swf -y

rem COPY NATIVE LIBRARIES INTO PLATFORM FOLDERS
echo/ & echo ---COPYING NATIVE LIBRARIES INTO PLATFORM FOLDERS---
	rem Windows-x86 DLL
echo ***Windows-x86 DLL*** & echo/
copy "%WIN-x86_DLL_VS%" "%WIN-x86_DLL%" /Y

rem BUILD ANE
echo/ & echo ---BUILDING ANE PACKAGE--- & echo/
call adt -package -target ane "%ANE_OUTPUT_FILE%" "%DESCRIPTOR_FILE%" -swc "%SWC_LIBRARY%" -platform "Windows-x86" -C "%PLATFORM_WIN-x86%" .


echo/ & echo ---ANE BUILD DONE---