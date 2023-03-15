@echo off
rem Name:  bench-notes.bat
rem Author:  Preston Coleman
rem Description:  Create simple timestamped notes for task documentation.
cls

ECHO.
ECHO -----------------------------------------------
ECHO bench-notes.bat 
ECHO -----------------------------------------------
ECHO.

:MENU

ECHO.
ECHO 1 - Enter notes (recorded in local time)
ECHO 3 - Enter basic case info
ECHO 5 - Exit
ECHO.

SET /P M=Type 1, 3, or 5 then press ENTER: 
ECHO.
IF "%M%"=="1" GOTO NOTE
IF "%M%"=="3" GOTO INFO
IF "%M%"=="5" (GOTO EOF) else (GOTO MENU)

:NOTE
SET /P CN=Type a note and press ENTER ("q" to quit, "m" for menu): 
IF /i "%CN%"=="q" GOTO THEEND
IF /i "%CN%"=="m" GOTO MENU
SET isod=%date:~10,4%-%date:~4,2%-%date:~7,2%
SET isot=%time:~0,2%:%time:~3,2%:%time:~6,2%
SET isot=%isot: =0%
ECHO.
ECHO %isod% %isot% %CN% >> notes.txt
ECHO.>> notes.txt
GOTO NOTE

:INFO
SET /P REQ=Enter Requestor: 
SET /P REQID=Enter Request ID: 
SET /P CID=Enter Case ID: 
SET /P EXN=Enter Examiner Name: 
ECHO Requestor: %REQ% >> notes.txt
ECHO Request ID: %REQID% >> notes.txt
ECHO Case ID: %CID% >> notes.txt
ECHO Examiner: %EXN% >> notes.txt
ECHO.>> notes.txt
GOTO MENU

:THEEND
ECHO.
pause
