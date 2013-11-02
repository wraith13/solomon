@REM
@REM sleep.cmd
@REM

@REM ％1 ミリ秒、待機する


@REM
@REM 準備
@REM

@IF /I "/?" EQU "%1" GOTO SHOW_HELP


@REM
@REM 処理本体
@REM

@cscript "%~dp0subjs\%~n0.js" //Nologo %1
@GOTO :EOF


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO 指定されたミリ秒待機します。
@ECHO.
@ECHO %~n0[%~x0] [待機するミリ秒]
