@REM
@REM setfoldericon.cmd
@REM

@REM ％1 のフォルダアイコンを ％2 ファイルの ％3 で指定されたインデックスのアイコンに設定します。

@REM
@REM 準備
@REM

@SET LIBCMD_SETFOLDERICON_ECHO=@
:OPTION_LOOP
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" SET LIBCMD_SETFOLDERICON_ECHO=&SHIFT&GOTO OPTION_LOOP
@IF /I "/force" EQU "%1" SET LIBCMD_SETFOLDERICON_FORCE=TRUE&SHIFT&GOTO OPTION_LOOP


@REM
@REM 処理本体
@REM

:BODY
%LIBCMD_SETFOLDERICON_ECHO%IF EXIST "%~dpnx1\desktop.ini" IF /I "TRUE" NEQ "%LIBCMD_SETFOLDERICON_FORCE%" ECHO 既に "%~dpnx1\desktop.ini" が存在します。(上書きするには /force を指定して実行してください。)&GOTO :EOF
%LIBCMD_SETFOLDERICON_ECHO%ECHO [.ShellClassInfo] >"%~1\desktop.ini"
%LIBCMD_SETFOLDERICON_ECHO%ECHO IconResource=%2,%3 >>"%~1\desktop.ini"
%LIBCMD_SETFOLDERICON_ECHO%ATTRIB +S +H "%~1\desktop.ini"
%LIBCMD_SETFOLDERICON_ECHO%ATTRIB +R %1
@GOTO :EOF


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO エクスプローラー上で表示されるフォルダのアイコンを設定します。
@ECHO.
@ECHO %~n0[%~x0] [/force] [/echo] [アイコンを設定するフォルダ アイコンを保持しているファイル アイコンインデックス]
@ECHO.
@ECHO /force  既にdesktop.iniファイルが存在していても上書きします。
@ECHO /echo   標準出力にechoしながら実行します。
@GOTO :EOF
