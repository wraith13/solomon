@REM
@REM build
@REM

@REM
@REM 準備
@REM

@SET BUILD_NAME=%~n0
@SET BUILD_BODY_CMD=%~dp0subcmd\vc.build.cmd
@SET CALL_VCVARSALL_CMD=%~dp0subcmd\call.vcvarsall.cmd
@SET VCVARSALL_ARG=x86
@SET CL_ARG=/MTd

@REM
@REM 本体処理呼び出し
@REM

@CALL "%BUILD_BODY_CMD%"
