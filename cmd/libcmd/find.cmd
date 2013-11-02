@REM
@REM find.cmd
@REM

@REM ％1 が ％2 に以降に存在すれば %2 を 0 としたインデックス値を LIBCMD_FIND_INDEX にセットします。(見つからなければ -1)

@REM
@REM 準備
@REM

@SET LIBCMD_FIND_ECHO=@
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@SET LIBCMD_FIND_REST=%*
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@CALL "%~dp0headtail.cmd" DUMMY%LIBCMD_FIND_REST%
@SET LIBCMD_FIND_REST=%LIBCMD_HEADTAIL_TAIL%
@SET LIBCMD_FIND_ECHO=
@GOTO BODY


@REM
@REM 処理本体
@REM

:BODY
@CALL "%~dp0headtail.cmd" %LIBCMD_FIND_REST%
@SET LIBCMD_FIND_TARGET=%LIBCMD_HEADTAIL_HEAD%
@SET LIBCMD_FIND_REST=%LIBCMD_HEADTAIL_TAIL%
%LIBCMD_FIND_ECHO%SET LIBCMD_FIND_INDEX=0
:LOOP
@CALL "%~dp0headtail.cmd" %LIBCMD_HEADTAIL_TAIL%
@IF /I "" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO NOTFOUND
@IF /I "%LIBCMD_FIND_TARGET%" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO :EOF
%LIBCMD_FIND_ECHO%SET /A LIBCMD_FIND_INDEX=%LIBCMD_FIND_INDEX%+1
@GOTO LOOP
:NOTFOUND
%LIBCMD_FIND_ECHO%SET LIBCMD_FIND_INDEX=-1
@GOTO :EOF


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO 一つの目のコマンドライン引数で指定された文字列が二つ目以降に以降に存在すれば二つ目を0としたインデックス値を環境変数LIBCMD_FIND_INDEXにセットします。(見つからなければ-1)
@ECHO.
@ECHO %~n0[%~x0] [/echo] [検索語] [検索される引数列]
@ECHO.
@ECHO /echo   標準出力にechoしながら実行します。
@ECHO.
@ECHO このコマンドは headtail.cmd に依存しており headtail.cmd の実行結果が格納される環境変数の内容が上書きされる為、必要に応じてこのコマンドの呼び出し前に別の環境変数に内容をコピーしてください。
@GOTO :EOF
