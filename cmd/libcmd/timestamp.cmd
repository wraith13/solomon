@REM
@REM timestamp.cmd
@REM

@REM �w�肳�ꂽ�����Ō��ݓ������o�͂��܂��B


@REM
@REM ����
@REM

@SET LIBCMD_TIMESTAMP_ECHO=@
@SET SUBJS=%~dp0subjs\%~n0.js
@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "/echo" EQU "%1" GOTO ECHO_ON
@GOTO BODY

:ECHO_ON
@SHIFT
@SET LIBCMD_TIMESTAMP_ECHO=
@GOTO BODY


@REM
@REM �����{��
@REM

:BODY
@FOR /f %%A IN ('cscript "%SUBJS%" //Nologo %1') DO %LIBCMD_TIMESTAMP_ECHO%SET LIBCMD_TIMESTAMP=%%A
@GOTO :EOF


@REM
@REM �w���v�\��
@REM

:SHOW_HELP
@ECHO �w�肳�ꂽ�����Ō��ݓ������o�͂��܂��B
@ECHO.
@ECHO %~n0[%~x0] [/echo][����]
@ECHO.
@ECHO /echo   �W���o�͂�echo���Ȃ�����s���܂��B
@ECHO.
@ECHO ����
@ECHO     YYYY  �N(����)
@ECHO     MM    ��(�K���񌅂ŏo��)
@ECHO     DD    ��(�K���񌅂ŏo��)
@ECHO     hh    ����(�K���񌅂ŏo��)
@ECHO     mm    ��(�K���񌅂ŏo��)
@ECHO     ss    �b(�K���񌅂ŏo��)
@ECHO     M     ��(�ꌅ���邢�͓񌅂ŏo��)
@ECHO     D     ��(�ꌅ���邢�͓񌅂ŏo��)
@ECHO     h     ����(�ꌅ���邢�͓񌅂ŏo��)
@ECHO     m     ��(�ꌅ���邢�͓񌅂ŏo��)
@ECHO     s     �b(�ꌅ���邢�͓񌅂ŏo��)
@ECHO     mmm   �~���b(�K���O���ŏo��)
@ECHO     ticks 1970/1/1����̃~���b
@ECHO.
@ECHO �����w���: timestamp.cmd /echo YYYY-MM-DDThh:mm:ss.mmm
@GOTO :EOF
