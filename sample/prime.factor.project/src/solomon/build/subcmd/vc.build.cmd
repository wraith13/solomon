@REM
@REM build
@REM

@REM
@REM コンパイル
@REM

@REM コンパイルログ出力先
@SET COMPILE_LOG_FILE=.\compile.log
@SET COMPILE2_LOG_FILE=.\compile2.log

@REM 通常コンパイル
@SETLOCAL
@CALL "%CALL_VCVARSALL_CMD%" %VCVARSALL_ARG% >NUL
@SET COMPILE_EXECUTE_CMD=cl ".\prime.factor.cpp" %CL_ARG% /EHsc /W4 /Feprime.factor.exe
@ECHO ⇒%COMPILE_EXECUTE_CMD%
@%COMPILE_EXECUTE_CMD%>>"%COMPILE_LOG_FILE%" 2>&1
@ENDLOCAL

@REM 通常コンパイル結果判定
@IF NOT EXIST ".\prime.factor.exe" CALL "%SOLOMON_COMPILE_FAILED_CMD%" "%COMPILE_LOG_FILE%" & GOTO :EOF

@REM 通常コンパイル警告判定
@TYPE "%COMPILE_LOG_FILE%" | FIND /I " warning " >NUL
@IF /I "1" NEQ "%ERRORLEVEL%" CALL "%SOLOMON_COMPILE_WARNED_CMD%" "%COMPILE_LOG_FILE%"

@REM セルフテスト用コンパイル
@SETLOCAL
@CALL "%CALL_VCVARSALL_CMD%" %VCVARSALL_ARG% >NUL
@SET COMPILE_EXECUTE_CMD=cl ".\prime.factor.cpp" /DAUTO_SELF_TEST_BUILD %CL_ARG% /EHsc /W4 /Feprime.factor.test.exe
@ECHO ⇒%COMPILE_EXECUTE_CMD%
@%COMPILE_EXECUTE_CMD%>>"%COMPILE2_LOG_FILE%" 2>&1
@ENDLOCAL

@REM セルフテスト用コンパイル結果判定
@IF NOT EXIST ".\prime.factor.test.exe" CALL "%SOLOMON_COMPILE_FAILED_CMD%" "%COMPILE2_LOG_FILE%" & GOTO :EOF

@REM セルフテスト用コンパイル警告判定
@TYPE "%COMPILE2_LOG_FILE%" | FIND /I " warning " >NUL
@IF /I "1" NEQ "%ERRORLEVEL%" CALL "%SOLOMON_COMPILE_WARNED_CMD%" "%COMPILE2_LOG_FILE%"

@REM コンパイル結果のコピー先ディレクトリの作成
@SET RESULT_DIR=%SOLOMON_SNAPSHOT_DIR%\result\%BUILD_NAME%
@IF NOT EXIST "%RESULT_DIR%" CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%RESULT_DIR%"

@REM コンパイル結果をコピー
@COPY /Y ".\*.exe" "%RESULT_DIR%" >NUL

@REM コンパイルが成功したことの通知
CALL "%SOLOMON_COMPILE_SUCCESS_CMD%"


@REM
@REM テスト
@REM

@REM テスト結果出力先
@SET TEST_RESULT_FILE=.\test.result.html
@SET TEST_FAIL_LOG_FILE=.\test.fail.log

@REM テスト実行
@SET TEST_EXECUTE_CMD=".\prime.factor.test.exe"^^^>"%TEST_RESULT_FILE%"
@ECHO ⇒%TEST_EXECUTE_CMD%
@SET TEST_EXECUTE_CMD=%TEST_EXECUTE_CMD%
@%TEST_EXECUTE_CMD% 2>>"%TEST_FAIL_LOG_FILE%"

@REM テスト成否の保存
@SET TEST_RESULT=%ERRORLEVEL%

@REM テスト結果をコピー
@COPY /Y "%TEST_RESULT_FILE%" "%RESULT_DIR%" >NUL

@REM テスト結果判定
@IF "0" EQU "%TEST_RESULT%" (CALL "%SOLOMON_TEST_SUCCESS_CMD%") ELSE CALL "%SOLOMON_TEST_FAILED_CMD%" "%TEST_FAIL_LOG_FILE%" & GOTO :EOF
