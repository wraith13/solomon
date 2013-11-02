@REM
@REM ox build
@REM


@REM
@REM コンパイル
@REM

@REM コンパイルの代わり
@ECHO コンパイル結果 >dummy.exe.txt

@REM 必ず成功扱い
@CALL "%SOLOMON_COMPILE_SUCCESS_CMD%"

@REM 必ず警告扱い
@CALL "%SOLOMON_COMPILE_WARNED_CMD%"

@REM コンパイル結果のコピー先ディレクトリの作成
@SET RESULT_DIR=%SOLOMON_SNAPSHOT_DIR%\result\%~n0
@IF NOT EXIST "%RESULT_DIR%" CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%RESULT_DIR%"

@REM コンパイル結果をコピー
copy /Y "dummy.exe.txt" "%RESULT_DIR%"


@REM
@REM テスト
@REM

@REM テスト結果出力先
@SET TEST_RESULT_FILE=dummy.exe.test.result.txt

@REM テストの代わり
@ECHO テスト結果：失敗 >"%TEST_RESULT_FILE%"

@REM テスト成否の保存(必ず失敗扱い)
@SET TEST_RESULT=1

@REM テスト結果をコピー
copy /Y "%TEST_RESULT_FILE%" "%RESULT_DIR%"

@REM テスト結果判定
@IF "0" EQU "%TEST_RESULT%" (CALL "%SOLOMON_TEST_SUCCESS_CMD%") ELSE CALL "%SOLOMON_TEST_FAILED_CMD%" & GOTO :EOF 
