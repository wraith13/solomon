@REM
@REM make.lnk.cmd
@REM

@REM *.lnkファイルを作成します。


@REM
@REM 準備
@REM

@SET SUBJS=%~dp0subjs\%~n0.js
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "" EQU "%~dpnx2" GOTO SHOW_HELP


@REM
@REM 処理本体
@REM

@CALL cscript "%SUBJS%" //Nologo "%~dpnx1" "%~dpnx2"
@GOTO :EOF


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO ショートカット(*.lnk)ファイルを作成します。
@ECHO.
@ECHO %~n0[%~x0] ファイルパス ショートカットファイルパス
@GOTO :EOF
