@REM
@REM make.lnk.cmd
@REM

@REM *.lnk�t�@�C�����쐬���܂��B


@REM
@REM ����
@REM

@SET SUBJS=%~dp0subjs\%~n0.js
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "" EQU "%~dpnx2" GOTO SHOW_HELP


@REM
@REM �����{��
@REM

@CALL cscript "%SUBJS%" //Nologo "%~dpnx1" "%~dpnx2"
@GOTO :EOF


@REM
@REM �w���v�\��
@REM

:SHOW_HELP
@ECHO �V���[�g�J�b�g(*.lnk)�t�@�C�����쐬���܂��B
@ECHO.
@ECHO %~n0[%~x0] �t�@�C���p�X �V���[�g�J�b�g�t�@�C���p�X
@GOTO :EOF
