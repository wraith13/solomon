@REM
@REM sleep.cmd
@REM

@REM ��1 �~���b�A�ҋ@����


@REM
@REM ����
@REM

@IF /I "/?" EQU "%1" GOTO SHOW_HELP


@REM
@REM �����{��
@REM

@cscript "%~dp0subjs\%~n0.js" //Nologo %1
@GOTO :EOF


@REM
@REM �w���v�\��
@REM

:SHOW_HELP
@ECHO �w�肳�ꂽ�~���b�ҋ@���܂��B
@ECHO.
@ECHO %~n0[%~x0] [�ҋ@����~���b]
