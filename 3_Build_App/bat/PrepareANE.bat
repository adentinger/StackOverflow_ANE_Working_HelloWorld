@echo off

echo/ & echo ---COPYING AND UNZIPPING ANE TO APP PROJECT'S LIBRARY FOLDER--- & echo/

set ANE_DIR=%BUILD_APP_HOME_FOLDER%\lib
set ANE_TARGET=%ANE_DIR%\HelloWorldANE.ane
set EXTENSION_ID=HelloWorldExtension
set ANE_UNZIPPED_FOLDER=%ANE_DIR%\%EXTENSION_ID%.ane

rem COPY THE ANE WE BUILT IN STEP 2
copy "%ANE_OUTPUT_FILE%" "%ANE_TARGET%" /Y

rem UNZIP THE ANE'S CONTENTS IN A FOLDER CALLED "[extensionID].ane"
rem You can use any unzipping tool you want.
"C:\Program Files\7-Zip\7z.exe" x "%ANE_TARGET%" -o"%ANE_UNZIPPED_FOLDER%" * -y

echo/ & echo ---ANE PREPARED FOR BUILD---
echo PLEASE MANUALLY BUILD THE APPLICATION IN FLASHDEVELOP