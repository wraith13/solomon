@REM
@REM ox build
@REM


@REM
@REM �e�X�g
@REM

@REM �e�X�g���ʏo�͐�
@SET TEST_RESULT_FILE=dummy.exe.test.result.txt

@REM �e�X�g�̑���
@ECHO �e�X�g���ʁF���s >"%TEST_RESULT_FILE%"

@REM �e�X�g���ۂ̕ۑ�(�K�����s����)
@SET TEST_RESULT=1

@REM ���ʂ̃R�s�[��f�B���N�g���̍쐬
@SET RESULT_DIR=%SOLOMON_SNAPSHOT_DIR%\result\%~n0
@IF NOT EXIST "%RESULT_DIR%" CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%RESULT_DIR%"

@REM �e�X�g���ʂ��R�s�[
copy /Y "%TEST_RESULT_FILE%" "%RESULT_DIR%"

@REM �e�X�g���ʔ���
@IF "0" NEQ "%TEST_RESULT%" CALL "%SOLOMON_TEST_FAILED_CMD%" & GOTO :EOF 
