@REM
@REM timestamp.cmd
@REM

@REM 指定された書式で現在日時を出力します。


@REM
@REM 準備
@REM

@SET LIBCMD_TIMESTAMP_ECHO=@
@SET SUBJS=%~dp0subjs\%~n0.js
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@SHIFT
@SET LIBCMD_TIMESTAMP_ECHO=
@GOTO BODY


@REM
@REM 処理本体
@REM

:BODY
@FOR /f %%A IN ('cscript "%SUBJS%" //Nologo %1') DO %LIBCMD_TIMESTAMP_ECHO%SET LIBCMD_TIMESTAMP=%%A
@GOTO :EOF


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO 指定された書式で現在日時を出力します。
@ECHO.
@ECHO %~n0[%~x0] [/echo][書式]
@ECHO.
@ECHO /echo   標準出力にechoしながら実行します。
@ECHO.
@ECHO 書式
@ECHO     YYYY  年(西暦)
@ECHO     MM    月(必ず二桁で出力)
@ECHO     DD    日(必ず二桁で出力)
@ECHO     hh    時間(必ず二桁で出力)
@ECHO     mm    分(必ず二桁で出力)
@ECHO     ss    秒(必ず二桁で出力)
@ECHO     M     月(一桁あるいは二桁で出力)
@ECHO     D     日(一桁あるいは二桁で出力)
@ECHO     h     時間(一桁あるいは二桁で出力)
@ECHO     m     分(一桁あるいは二桁で出力)
@ECHO     s     秒(一桁あるいは二桁で出力)
@ECHO     mmm   ミリ秒(必ず三桁で出力)
@ECHO     ticks 1970/1/1からのミリ秒
@ECHO.
@ECHO 書式指定例: timestamp.cmd /echo YYYY-MM-DDThh:mm:ss.mmm
@GOTO :EOF
