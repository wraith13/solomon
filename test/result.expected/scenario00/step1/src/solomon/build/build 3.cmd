@REM
@REM oo build
@REM


@REM
@REM コンパイル
@REM

@REM コンパイルの代わり
@ECHO コンパイル結果 >dummy.exe.txt

@REM 必ず失敗扱い
@CALL "%SOLOMON_COMPILE_FAILED_CMD%" & GOTO :EOF

@REM 必ず警告なし扱い
@REM CALL "%SOLOMON_COMPILE_WARNED_CMD%"

@REM コンパイル結果のコピー先ディレクトリの作成
@SET RESULT_DIR=%SOLOMON_SNAPSHOT_DIR%\result\%~n0
@IF NOT EXIST "%RESULT_DIR%" CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%RESULT_DIR%"

@REM コンパイル結果をコピー
copy /Y "dummy.exe.txt" "%RESULT_DIR%"

