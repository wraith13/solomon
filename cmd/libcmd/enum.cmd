@REM
@REM enum.cmd
@REM

@REM ��* ������� LIBCMD_ENUM �Z�b�g�ɂ��ꂽ�R�}���h�̈����Ƃ��ēn���Ď��s���܂��B


@REM
@REM ����
@REM

@SET LIBCMD_ENUM_ECHO=@
@IF /I "" EQU "%LIBCMD_ENUM%" SET LIBCMD_ENUM=ECHO
@SET LIBCMD_HEADTAIL_TAIL=%*
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" CALL "%~dp0headtail.cmd" DUMMY%LIBCMD_HEADTAIL_TAIL%&SET LIBCMD_ENUM_ECHO=


@REM
@REM �����{��
@REM

:TOP
@CALL "%~dp0headtail.cmd" %LIBCMD_HEADTAIL_TAIL%
@IF /I "" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO :EOF
%LIBCMD_ENUM_ECHO%%LIBCMD_ENUM% %LIBCMD_HEADTAIL_HEAD%
@GOTO TOP


@REM
@REM �w���v�\��
@REM

:SHOW_HELP
@ECHO �R�}���h���C���������ЂƂ��A���ϐ�LIBCMD_ENUM�Ŏw�肳�ꂽ�R�}���h�ɓn���Ď��s���܂��B
@ECHO.
@ECHO %~n0[%~x0] [/echo] [���ϐ�LIBCMD_ENUM�Ŏw�肳�ꂽ�R�}���h�ɓn��������]
@ECHO.
@ECHO /echo   �W���o�͂�echo���Ȃ�����s���܂��B
@ECHO.
@ECHO ���ϐ�LIBCMD_ENUM�ŃR�}���h���w�肳��Ă��Ȃ��ꍇ echo �R�}���h�ɑ΂��ď��������{���܂��B
@ECHO ���̃R�}���h�� headtail.cmd �Ɉˑ����Ă��� headtail.cmd �̎��s���ʂ��i�[�������ϐ��̓��e���㏑�������ׁA�K�v�ɉ����Ă��̃R�}���h�̌Ăяo���O�ɕʂ̊��ϐ��ɓ��e���R�s�[���Ă��������B
@GOTO :EOF
