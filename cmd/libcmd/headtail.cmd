@REM
@REM headtail.cmd
@REM

@REM ％1 を LIBCMD_HEADTAIL_HEAD に、％2 以降を LIBCMD_HEADTAIL_TAIL にセットします。


@REM
@REM 準備
@REM

@SET LIBCMD_HEADTAIL_ECHO=@
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@SHIFT
@SET LIBCMD_HEADTAIL_ECHO=
@GOTO BODY


@REM
@REM 処理本体
@REM

:BODY
%LIBCMD_HEADTAIL_ECHO%SET LIBCMD_HEADTAIL_STRICT_HEAD=%1
%LIBCMD_HEADTAIL_ECHO%SET LIBCMD_HEADTAIL_HEAD=%~1
@SHIFT
%LIBCMD_HEADTAIL_ECHO%SET LIBCMD_HEADTAIL_TAIL=%1
:LOOP
@IF /I "" EQU "%~1" GOTO :EOF
@SHIFT
%LIBCMD_HEADTAIL_ECHO%SET LIBCMD_HEADTAIL_TAIL=%LIBCMD_HEADTAIL_TAIL% %1
@GOTO LOOP


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO 一つの目のコマンドライン引数を環境変数LIBCMD_HEADTAIL_HEADにセットし二つ目以降のコマンドライン引数を全て環境変数LIBCMD_HEADTAIL_TAILにセットします。
@ECHO.
@ECHO %~n0[%~x0] [/echo] [headとtailに分割される引数列]
@ECHO.
@ECHO /echo   標準出力にechoしながら実行します。
@GOTO :EOF
