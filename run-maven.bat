SET MVN_PATH=D:\Development\apache-maven-3.3.9
SET JAVA_HOME=C:\Program Files\Java\jdk1.8.0_91
SET PROJ_PATH=D:\shereefsakr-dev-work\shereefsakr-experiments\TestThrift
SET CURR_PATH=%CD%

cd %D:\shereefsakr-dev-work\shereefsakr-experiments\TestThrift%

%MVN_PATH%\bin\mvn install

echo %CURR_PATH%
cd %CURR_PATH%