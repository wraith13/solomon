@REM
@REM ディレクトリの圧縮
@REM

@DEL "%~dpnx2" >NUL 2>NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%~dpnx2" "%~dpnx1\*" >NUL
