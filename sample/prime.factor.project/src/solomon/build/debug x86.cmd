@REM
@REM build
@REM

@REM
@REM ����
@REM

@SET BUILD_NAME=%~n0
@SET BUILD_BODY_CMD=%~dp0subcmd\vc.build.cmd
@SET CALL_VCVARSALL_CMD=%~dp0subcmd\call.vcvarsall.cmd
@SET VCVARSALL_ARG=x86
@SET CL_ARG=/MTd

@REM
@REM �{�̏����Ăяo��
@REM

@CALL "%BUILD_BODY_CMD%"
