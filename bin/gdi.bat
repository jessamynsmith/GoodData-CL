@echo off
SET PRJ_BIN=%~dp0

if not "%JAVA_HOME%" == "" goto jhomeok

echo.
echo ERROR: JAVA_HOME not found in your environment.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation
echo.
goto error

:jhomeok
if exist "%JAVA_HOME%\bin\java.exe" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory.
echo JAVA_HOME = "%JAVA_HOME%"
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation
echo.
goto error

:execute
%JAVA_HOME%\bin\java.exe  -Xmx256M -Dlog4j.configuration=%PRJ_BIN%..\log4j.configuration -Dderby.system.home=%PRJ_BIN%..\db -Djava.io.tmpdir=%PRJ_BIN%..\tmp -classpath %PRJ_BIN%..;%PRJ_BIN%..\target\GoodDataDI-0.6-jar-with-dependencies.jar com.gooddata.processor.GdcDI %*
goto end

:error
@REM error sink

:end
@REM end of the script