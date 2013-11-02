@REM
@REM build
@REM

@REM
@REM �R���p�C��
@REM

@REM �R���p�C�����O�o�͐�
@SET COMPILE_LOG_FILE=.\compile.log
@SET COMPILE2_LOG_FILE=.\compile2.log

@REM �ʏ�R���p�C��
@SETLOCAL
@CALL "%CALL_VCVARSALL_CMD%" %VCVARSALL_ARG% >NUL
@SET COMPILE_EXECUTE_CMD=cl ".\prime.factor.cpp" %CL_ARG% /EHsc /W4 /Feprime.factor.exe
@ECHO ��%COMPILE_EXECUTE_CMD%
@%COMPILE_EXECUTE_CMD%>>"%COMPILE_LOG_FILE%" 2>&1
@ENDLOCAL

@REM �ʏ�R���p�C�����ʔ���
@IF NOT EXIST ".\prime.factor.exe" CALL "%SOLOMON_COMPILE_FAILED_CMD%" "%COMPILE_LOG_FILE%" & GOTO :EOF

@REM �ʏ�R���p�C���x������
@TYPE "%COMPILE_LOG_FILE%" | FIND /I " warning " >NUL
@IF /I "1" NEQ "%ERRORLEVEL%" CALL "%SOLOMON_COMPILE_WARNED_CMD%" "%COMPILE_LOG_FILE%"

@REM �Z���t�e�X�g�p�R���p�C��
@SETLOCAL
@CALL "%CALL_VCVARSALL_CMD%" %VCVARSALL_ARG% >NUL
@SET COMPILE_EXECUTE_CMD=cl ".\prime.factor.cpp" /DAUTO_SELF_TEST_BUILD %CL_ARG% /EHsc /W4 /Feprime.factor.test.exe
@ECHO ��%COMPILE_EXECUTE_CMD%
@%COMPILE_EXECUTE_CMD%>>"%COMPILE2_LOG_FILE%" 2>&1
@ENDLOCAL

@REM �Z���t�e�X�g�p�R���p�C�����ʔ���
@IF NOT EXIST ".\prime.factor.test.exe" CALL "%SOLOMON_COMPILE_FAILED_CMD%" "%COMPILE2_LOG_FILE%" & GOTO :EOF

@REM �Z���t�e�X�g�p�R���p�C���x������
@TYPE "%COMPILE2_LOG_FILE%" | FIND /I " warning " >NUL
@IF /I "1" NEQ "%ERRORLEVEL%" CALL "%SOLOMON_COMPILE_WARNED_CMD%" "%COMPILE2_LOG_FILE%"

@REM �R���p�C�����ʂ̃R�s�[��f�B���N�g���̍쐬
@SET RESULT_DIR=%SOLOMON_SNAPSHOT_DIR%\result\%BUILD_NAME%
@IF NOT EXIST "%RESULT_DIR%" CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%RESULT_DIR%"

@REM �R���p�C�����ʂ��R�s�[
@COPY /Y ".\*.exe" "%RESULT_DIR%" >NUL

@REM �R���p�C���������������Ƃ̒ʒm
CALL "%SOLOMON_COMPILE_SUCCESS_CMD%"


@REM
@REM �e�X�g
@REM

@REM �e�X�g���ʏo�͐�
@SET TEST_RESULT_FILE=.\test.result.html
@SET TEST_FAIL_LOG_FILE=.\test.fail.log

@REM �e�X�g���s
@SET TEST_EXECUTE_CMD=".\prime.factor.test.exe"^^^>"%TEST_RESULT_FILE%"
@ECHO ��%TEST_EXECUTE_CMD%
@SET TEST_EXECUTE_CMD=%TEST_EXECUTE_CMD%
@%TEST_EXECUTE_CMD% 2>>"%TEST_FAIL_LOG_FILE%"

@REM �e�X�g���ۂ̕ۑ�
@SET TEST_RESULT=%ERRORLEVEL%

@REM �e�X�g���ʂ��R�s�[
@COPY /Y "%TEST_RESULT_FILE%" "%RESULT_DIR%" >NUL

@REM �e�X�g���ʔ���
@IF "0" EQU "%TEST_RESULT%" (CALL "%SOLOMON_TEST_SUCCESS_CMD%") ELSE CALL "%SOLOMON_TEST_FAILED_CMD%" "%TEST_FAIL_LOG_FILE%" & GOTO :EOF
