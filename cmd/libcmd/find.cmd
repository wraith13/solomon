@REM
@REM find.cmd
@REM

@REM ��1 �� ��2 �Ɉȍ~�ɑ��݂���� %2 �� 0 �Ƃ����C���f�b�N�X�l�� LIBCMD_FIND_INDEX �ɃZ�b�g���܂��B(������Ȃ���� -1)

@REM
@REM ����
@REM

@SET LIBCMD_FIND_ECHO=@
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@SET LIBCMD_FIND_REST=%*
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@CALL "%~dp0headtail.cmd" DUMMY%LIBCMD_FIND_REST%
@SET LIBCMD_FIND_REST=%LIBCMD_HEADTAIL_TAIL%
@SET LIBCMD_FIND_ECHO=
@GOTO BODY


@REM
@REM �����{��
@REM

:BODY
@CALL "%~dp0headtail.cmd" %LIBCMD_FIND_REST%
@SET LIBCMD_FIND_TARGET=%LIBCMD_HEADTAIL_HEAD%
@SET LIBCMD_FIND_REST=%LIBCMD_HEADTAIL_TAIL%
%LIBCMD_FIND_ECHO%SET LIBCMD_FIND_INDEX=0
:LOOP
@CALL "%~dp0headtail.cmd" %LIBCMD_HEADTAIL_TAIL%
@IF /I "" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO NOTFOUND
@IF /I "%LIBCMD_FIND_TARGET%" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO :EOF
%LIBCMD_FIND_ECHO%SET /A LIBCMD_FIND_INDEX=%LIBCMD_FIND_INDEX%+1
@GOTO LOOP
:NOTFOUND
%LIBCMD_FIND_ECHO%SET LIBCMD_FIND_INDEX=-1
@GOTO :EOF


@REM
@REM �w���v�\��
@REM

:SHOW_HELP
@ECHO ��̖ڂ̃R�}���h���C�������Ŏw�肳�ꂽ�����񂪓�ڈȍ~�Ɉȍ~�ɑ��݂���Γ�ڂ�0�Ƃ����C���f�b�N�X�l�����ϐ�LIBCMD_FIND_INDEX�ɃZ�b�g���܂��B(������Ȃ����-1)
@ECHO.
@ECHO %~n0[%~x0] [/echo] [������] [��������������]
@ECHO.
@ECHO /echo   �W���o�͂�echo���Ȃ�����s���܂��B
@ECHO.
@ECHO ���̃R�}���h�� headtail.cmd �Ɉˑ����Ă��� headtail.cmd �̎��s���ʂ��i�[�������ϐ��̓��e���㏑�������ׁA�K�v�ɉ����Ă��̃R�}���h�̌Ăяo���O�ɕʂ̊��ϐ��ɓ��e���R�s�[���Ă��������B
@GOTO :EOF
