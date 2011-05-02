set CURR_DIR=%cd%
::cd ./l
set SSDIR=\\10.0.0.1\test\
set ssuser=backup
set sspwd=b
set SS_PATH="C:\Program Files\Microsoft Visual SourceSafe\ss"
set BACKUP_PATH="c:\l"
::set Dir=Z:\Shared\testvssbackup\latest
::set Force_Dir=Yes
::set Force_Prj=Yes
::set Long_Filenames=Yes
::set Warn_Destroy=No
::set Warn_Exit=No
::set Warn_Multiple_Checkout=No
::set Warn_Purge=No
::set Warn_Remove=No
::set Warn_Rollback=No
::set Warn_Uncheckout=No

cd %BACKUP_PATH%
%SS_PATH% Workfold $/ %BACKUP_PATH%
%SS_PATH% Get $/ -R

::%SS_PATH% HELP Dir
::%SS_PATH% Dir $/ -R > testfile.txt

cd %CURR_DIR%