@REM
@REM mkdir.ex.cmd
@REM

@REM �g���@�\���L���ɂȂ��Ă���mkdir�Ɠ������[���K�w�̃f�B���N�g������x�ɍ쐬���܂��B


@REM
@REM ����
@REM

@SET LIBCMD_MKDIR_EX_ECHO=@
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@SHIFT
@SET LIBCMD_MKDIR_EX_ECHO=
@SET LIBCMD_MKDIR_EX_SUB_OPTION=/echo
@GOTO BODY


@REM
@REM �����{��
@REM

:BODY
@IF NOT EXIST "%~dpnx1\.." CALL "%~dpnx0" %LIBCMD_MKDIR_EX_SUB_OPTION% "%~dpnx1\.."
@IF EXIST "%~dpnx1" GOTO :EOF
%LIBCMD_MKDIR_EX_ECHO%MKDIR "%~dpnx1"
@GOTO :EOF


@REM
@REM �w���v�\��
@REM

:SHOW_HELP
@ECHO ��̖ڂ̃R�}���h���C�����������ϐ�LIBCMD_HEADTAIL_HEAD�ɃZ�b�g����ڈȍ~�̃R�}���h���C��������S�Ċ��ϐ�LIBCMD_HEADTAIL_TAIL�ɃZ�b�g���܂��B
@ECHO.
@ECHO %~n0[%~x0] [/echo] [head��tail�ɕ�������������]
@ECHO.
@ECHO /echo   �W���o�͂�echo���Ȃ�����s���܂��B
@GOTO :EOF
