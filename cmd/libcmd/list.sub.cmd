@REM
@REM list.sub.cmd
@REM

@REM ��1 �� ��2 �ȍ~�̃��X�g�����菜�������m�� LIBCMD_LIST_SUB �ɃZ�b�g���܂��B

@REM
@REM ����
@REM

@SET LIBCMD_LIST_SUB_ECHO=@
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@SET LIBCMD_LIST_SUB_REST=%*
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@CALL "%~dp0headtail.cmd" DUMMY%LIBCMD_LIST_SUB_REST%
@SET LIBCMD_LIST_SUB_REST=%LIBCMD_HEADTAIL_TAIL%
@SET LIBCMD_LIST_SUB_ECHO=
@GOTO BODY


@REM
@REM �����{��
@REM

:BODY
@CALL "%~dp0headtail.cmd" %LIBCMD_LIST_SUB_REST%
@SET LIBCMD_LIST_SUB_TARGET=%LIBCMD_HEADTAIL_HEAD%
@SET LIBCMD_LIST_SUB_REST=%LIBCMD_HEADTAIL_TAIL%
%LIBCMD_LIST_SUB_ECHO%SET LIBCMD_LIST_SUB=
:LOOP
@CALL "%~dp0headtail.cmd" %LIBCMD_HEADTAIL_TAIL%
@IF /I "" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO :EOF
@IF /I "%LIBCMD_LIST_SUB_TARGET%" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO LOOP
%LIBCMD_LIST_SUB_ECHO%SET LIBCMD_LIST_SUB=%LIBCMD_LIST_SUB% %LIBCMD_HEADTAIL_STRICT_HEAD%
@GOTO LOOP


@REM
@REM �w���v�\��
@REM

:SHOW_HELP
@ECHO ��̖ڂ̃R�}���h���C�������Ŏw�肳�ꂽ��������ڈȍ~�̃��X�g�����菜���Ċ��ϐ�LIBCMD_LIST_SUB�ɃZ�b�g���܂��B
@ECHO.
@ECHO %~n0[%~x0] [/echo] [������] [��������������]
@ECHO.
@ECHO /echo   �W���o�͂�echo���Ȃ�����s���܂��B
@ECHO.
@ECHO ���̃R�}���h�� headtail.cmd �Ɉˑ����Ă��� headtail.cmd �̎��s���ʂ��i�[�������ϐ��̓��e���㏑�������ׁA�K�v�ɉ����Ă��̃R�}���h�̌Ăяo���O�ɕʂ̊��ϐ��ɓ��e���R�s�[���Ă��������B
@GOTO :EOF

