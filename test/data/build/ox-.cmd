@REM
@REM oo build
@REM


@REM
@REM �R���p�C��
@REM

@REM �R���p�C���̑���
@ECHO �R���p�C������ >dummy.exe.txt

@REM �K����������
@CALL "%SOLOMON_COMPILE_SUCCESS_CMD%"

@REM �K���x������
@CALL "%SOLOMON_COMPILE_WARNED_CMD%"

@REM �R���p�C�����ʂ̃R�s�[��f�B���N�g���̍쐬
@SET RESULT_DIR=%SOLOMON_SNAPSHOT_DIR%\result\%~n0
@IF NOT EXIST "%RESULT_DIR%" CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%RESULT_DIR%"

@REM �R���p�C�����ʂ��R�s�[
copy /Y "dummy.exe.txt" "%RESULT_DIR%"

