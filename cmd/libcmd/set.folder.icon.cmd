@REM
@REM setfoldericon.cmd
@REM

@REM ��1 �̃t�H���_�A�C�R���� ��2 �t�@�C���� ��3 �Ŏw�肳�ꂽ�C���f�b�N�X�̃A�C�R���ɐݒ肵�܂��B

@REM
@REM ����
@REM

@SET LIBCMD_SETFOLDERICON_ECHO=@
:OPTION_LOOP
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" SET LIBCMD_SETFOLDERICON_ECHO=&SHIFT&GOTO OPTION_LOOP
@IF /I "/force" EQU "%1" SET LIBCMD_SETFOLDERICON_FORCE=TRUE&SHIFT&GOTO OPTION_LOOP


@REM
@REM �����{��
@REM

:BODY
%LIBCMD_SETFOLDERICON_ECHO%IF EXIST "%~dpnx1\desktop.ini" IF /I "TRUE" NEQ "%LIBCMD_SETFOLDERICON_FORCE%" ECHO ���� "%~dpnx1\desktop.ini" �����݂��܂��B(�㏑������ɂ� /force ���w�肵�Ď��s���Ă��������B)&GOTO :EOF
%LIBCMD_SETFOLDERICON_ECHO%ECHO [.ShellClassInfo] >"%~1\desktop.ini"
%LIBCMD_SETFOLDERICON_ECHO%ECHO IconResource=%2,%3 >>"%~1\desktop.ini"
%LIBCMD_SETFOLDERICON_ECHO%ATTRIB +S +H "%~1\desktop.ini"
%LIBCMD_SETFOLDERICON_ECHO%ATTRIB +R %1
@GOTO :EOF


@REM
@REM �w���v�\��
@REM

:SHOW_HELP
@ECHO �G�N�X�v���[���[��ŕ\�������t�H���_�̃A�C�R����ݒ肵�܂��B
@ECHO.
@ECHO %~n0[%~x0] [/force] [/echo] [�A�C�R����ݒ肷��t�H���_ �A�C�R����ێ����Ă���t�@�C�� �A�C�R���C���f�b�N�X]
@ECHO.
@ECHO /force  ����desktop.ini�t�@�C�������݂��Ă��Ă��㏑�����܂��B
@ECHO /echo   �W���o�͂�echo���Ȃ�����s���܂��B
@GOTO :EOF
