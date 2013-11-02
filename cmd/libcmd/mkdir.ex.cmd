@REM
@REM mkdir.ex.cmd
@REM

@REM 拡張機能が有効になっているmkdirと同じく深い階層のディレクトリを一度に作成します。


@REM
@REM 準備
@REM

@SET LIBCMD_MKDIR_EX_ECHO=@
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@SHIFT
@SET LIBCMD_MKDIR_EX_ECHO=
@SET LIBCMD_MKDIR_EX_SUB_OPTION=/echo
@GOTO BODY


@REM
@REM 処理本体
@REM

:BODY
@IF NOT EXIST "%~dpnx1\.." CALL "%~dpnx0" %LIBCMD_MKDIR_EX_SUB_OPTION% "%~dpnx1\.."
@IF EXIST "%~dpnx1" GOTO :EOF
%LIBCMD_MKDIR_EX_ECHO%MKDIR "%~dpnx1"
@GOTO :EOF


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
