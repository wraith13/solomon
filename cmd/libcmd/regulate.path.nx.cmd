@REM
@REM regulate.path.nx.cmd
@REM

@REM ％* で指定されたパスのディレクトリを除き拡張子を含むファイル名を %LIBCMD_REGULATE_PATH_NX% に格納する。


@REM
@REM 準備
@REM

@SET LIBCMD_REGULATE_PATH_NX_ECHO=@
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@SHIFT
@SET LIBCMD_REGULATE_PATH_NX_ECHO=
@GOTO BODY


@REM
@REM 処理本体
@REM

:BODY
%LIBCMD_REGULATE_PATH_NX_ECHO%SET LIBCMD_REGULATE_PATH_NX=%~nx1
%LIBCMD_REGULATE_PATH_NX_ECHO%SET LIBCMD_REGULATE_PATH_NX_STRICT="%~nx1"
:LOOP
@SHIFT
@IF /I "" EQU "%~nx1" GOTO :EOF
%LIBCMD_REGULATE_PATH_NX_ECHO%SET LIBCMD_REGULATE_PATH_NX=%LIBCMD_REGULATE_PATH_NX% %~nx1
%LIBCMD_REGULATE_PATH_NX_ECHO%SET LIBCMD_REGULATE_PATH_NX_STRICT=%LIBCMD_REGULATE_PATH_NX_STRICT% "%~nx1"
@GOTO LOOP


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO コマンドライン引数で指定されたパスのディレクトリを除き拡張子を含むファイル名を環境変数LIBCMD_REGULATE_PATH_NXにセットします。
@ECHO.
@ECHO %~n0[%~x0] [/echo] [ディレクトリを除き拡張子を含むファイル名を取得したいパスの引数列]
@ECHO.
@ECHO /echo   標準出力にechoしながら実行します。
@GOTO :EOF
