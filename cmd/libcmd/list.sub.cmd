@REM
@REM list.sub.cmd
@REM

@REM ％1 を ％2 以降のリストから取り除いたモノを LIBCMD_LIST_SUB にセットします。

@REM
@REM 準備
@REM

@SET LIBCMD_LIST_SUB_ECHO=@
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@SET LIBCMD_LIST_SUB_REST=%*
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@CALL "%~dp0headtail.cmd" DUMMY%LIBCMD_LIST_SUB_REST%
@SET LIBCMD_LIST_SUB_REST=%LIBCMD_HEADTAIL_TAIL%
@SET LIBCMD_LIST_SUB_ECHO=
@GOTO BODY


@REM
@REM 処理本体
@REM

:BODY
@CALL "%~dp0headtail.cmd" %LIBCMD_LIST_SUB_REST%
@SET LIBCMD_LIST_SUB_TARGET=%LIBCMD_HEADTAIL_HEAD%
@SET LIBCMD_LIST_SUB_REST=%LIBCMD_HEADTAIL_TAIL%
%LIBCMD_LIST_SUB_ECHO%SET LIBCMD_LIST_SUB=
:LOOP
@CALL "%~dp0headtail.cmd" %LIBCMD_HEADTAIL_TAIL%
@IF /I "" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO :EOF
@IF /I "%LIBCMD_LIST_SUB_TARGET%" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO LOOP
%LIBCMD_LIST_SUB_ECHO%SET LIBCMD_LIST_SUB=%LIBCMD_LIST_SUB% %LIBCMD_HEADTAIL_STRICT_HEAD%
@GOTO LOOP


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO 一つの目のコマンドライン引数で指定された文字列を二つ目以降のリストから取り除いて環境変数LIBCMD_LIST_SUBにセットします。
@ECHO.
@ECHO %~n0[%~x0] [/echo] [検索語] [検索される引数列]
@ECHO.
@ECHO /echo   標準出力にechoしながら実行します。
@ECHO.
@ECHO このコマンドは headtail.cmd に依存しており headtail.cmd の実行結果が格納される環境変数の内容が上書きされる為、必要に応じてこのコマンドの呼び出し前に別の環境変数に内容をコピーしてください。
@GOTO :EOF

