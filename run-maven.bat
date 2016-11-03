SET MVN_PATH=D:\Development\apache-maven-3.3.9
SET JAVA_HOME=C:\Program Files\Java\jdk1.8.0_91
SET PROJ_PATH=D:\shereefsakr-dev-work\shereefsakr-experiments\TestThrift
SET CURR_PATH=%CD%

echo "Changing current path to %PROJ_PATH%"
cd %PROJ_PATH%


call %MVN_PATH%\bin\mvn install

echo "Changing current path back to current path : %CURR_PATH%"
cd %CURR_PATH%