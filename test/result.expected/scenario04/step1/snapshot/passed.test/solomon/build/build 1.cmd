@REM
@REM oo build
@REM


@REM
@REM テスト
@REM

@REM テスト結果出力先
@SET TEST_RESULT_FILE=dummy.exe.test.result.txt

@REM テストの代わり
@ECHO テスト結果：成功 >"%TEST_RESULT_FILE%"

@REM テスト成否の保存(必ず成功扱い)
@SET TEST_RESULT=0

@REM 結果のコピー先ディレクトリの作成
@SET RESULT_DIR=%SOLOMON_SNAPSHOT_DIR%\result\%~n0
@IF NOT EXIST "%RESULT_DIR%" CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%RESULT_DIR%"

@REM テスト結果をコピー
copy /Y "%TEST_RESULT_FILE%" "%RESULT_DIR%"

@REM テスト結果判定
@IF "0" EQU "%TEST_RESULT%" (CALL "%SOLOMON_TEST_SUCCESS_CMD%") ELSE CALL "%SOLOMON_TEST_FAILED_CMD%" & GOTO :EOF 

