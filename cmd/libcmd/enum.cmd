@REM
@REM enum.cmd
@REM

@REM ％* を一つずつ LIBCMD_ENUM セットにされたコマンドの引数として渡して実行します。


@REM
@REM 準備
@REM

@SET LIBCMD_ENUM_ECHO=@
@IF /I "" EQU "%LIBCMD_ENUM%" SET LIBCMD_ENUM=ECHO
@SET LIBCMD_HEADTAIL_TAIL=%*
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" CALL "%~dp0headtail.cmd" DUMMY%LIBCMD_HEADTAIL_TAIL%&SET LIBCMD_ENUM_ECHO=


@REM
@REM 処理本体
@REM

:TOP
@CALL "%~dp0headtail.cmd" %LIBCMD_HEADTAIL_TAIL%
@IF /I "" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO :EOF
%LIBCMD_ENUM_ECHO%%LIBCMD_ENUM% %LIBCMD_HEADTAIL_HEAD%
@GOTO TOP


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO コマンドライン引数をひとつずつ、環境変数LIBCMD_ENUMで指定されたコマンドに渡して実行します。
@ECHO.
@ECHO %~n0[%~x0] [/echo] [環境変数LIBCMD_ENUMで指定されたコマンドに渡す引数列]
@ECHO.
@ECHO /echo   標準出力にechoしながら実行します。
@ECHO.
@ECHO 環境変数LIBCMD_ENUMでコマンドが指定されていない場合 echo コマンドに対して処理を実施します。
@ECHO このコマンドは headtail.cmd に依存しており headtail.cmd の実行結果が格納される環境変数の内容が上書きされる為、必要に応じてこのコマンドの呼び出し前に別の環境変数に内容をコピーしてください。
@GOTO :EOF
