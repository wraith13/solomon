@REM
@REM regulate.path.nx.cmd
@REM

@REM ��* �Ŏw�肳�ꂽ�p�X�̃f�B���N�g���������g���q���܂ރt�@�C������ %LIBCMD_REGULATE_PATH_NX% �Ɋi�[����B


@REM
@REM ����
@REM

@SET LIBCMD_REGULATE_PATH_NX_ECHO=@
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@SHIFT
@SET LIBCMD_REGULATE_PATH_NX_ECHO=
@GOTO BODY


@REM
@REM �����{��
@REM

:BODY
%LIBCMD_REGULATE_PATH_NX_ECHO%SET LIBCMD_REGULATE_PATH_NX=%~nx1
%LIBCMD_REGULATE_PATH_NX_ECHO%SET LIBCMD_REGULATE_PATH_NX_STRICT="%~nx1"
:LOOP
@SHIFT
@IF /I "" EQU "%~nx1" GOTO :EOF
%LIBCMD_REGULATE_PATH_NX_ECHO%SET LIBCMD_REGULATE_PATH_NX=%LIBCMD_REGULATE_PATH_NX% %~nx1
%LIBCMD_REGULATE_PATH_NX_ECHO%SET LIBCMD_REGULATE_PATH_NX_STRICT=%LIBCMD_REGULATE_PATH_NX_STRICT% "%~nx1"
@GOTO LOOP


@REM
@REM �w���v�\��
@REM

:SHOW_HELP
@ECHO �R�}���h���C�������Ŏw�肳�ꂽ�p�X�̃f�B���N�g���������g���q���܂ރt�@�C���������ϐ�LIBCMD_REGULATE_PATH_NX�ɃZ�b�g���܂��B
@ECHO.
@ECHO %~n0[%~x0] [/echo] [�f�B���N�g���������g���q���܂ރt�@�C�������擾�������p�X�̈�����]
@ECHO.
@ECHO /echo   �W���o�͂�echo���Ȃ�����s���܂��B
@GOTO :EOF
