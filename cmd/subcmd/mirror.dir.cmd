@REM
@REM �f�B���N�g���[�̃~���[�R�s�[
@REM

@REM ���{���A����cmd���ł̃��g���C�͕s�v���������Ă���Ώۂ��A���`�E�B���X�\�t�g�ɖڂ�t�����₷��
@REM �@�v���O�����̃t�@�C���ł��邱�Ƃ��炩���ɂ���Ă̓f�B���N�g���̍폜���R�s�[�����ʂɂ�������
@REM �@�����p�x�Ŏ��s���邱�Ƃ�����ׁA���s�������Ƃ��킩�����ꍇ�͎����I�Ƀ��g���C���s���B

@SETLOCAL

@SET SOLOMON_REMOVE_DIR_TRY_COUNT=0
:RMDIR
@SET /A SOLOMON_REMOVE_DIR_TRY_COUNT=%SOLOMON_REMOVE_DIR_TRY_COUNT%+1
@RMDIR /S /Q "%~dpnx2" >NUL 2>NUL
@IF exist "%~dpnx2" ECHO %SOLOMON_MESSAGE_PREFIX%[error] "%~dpnx2"�f�B���N�g���[���폜�ł��܂���ł����B&@CALL "%SOLOMON_LIBCMD_DIR%\sleep.cmd" 1000&ECHO %SOLOMON_MESSAGE_PREFIX%[retry] "%~dpnx2"�̍폜�����g���C���܂��B(%SOLOMON_REMOVE_DIR_TRY_COUNT%���)&GOTO RMDIR
@IF /I "1" NEQ "%SOLOMON_REMOVE_DIR_TRY_COUNT%" ECHO %SOLOMON_MESSAGE_PREFIX%[recovered] "%~dpnx2"�f�B���N�g���[���폜�ł��܂����B

@REM ���{���A����robocopy�R�}���h�����ł��܂������ė~�����Ƃ���Ȃ̂����A�R�s�[���ƃR�s�[���
@REM �@�X�V�����A�T�C�Y�A����������̃t�@�C�����㏑������Ȃ��Ƃ����d�l/��肪����ׁA�R�s�[�O��
@REM �@�R�s�[��������Ă��܂��B�Ȃ��A����robocopy�̋������������ׂɑ��݂��Ă��� /is �Ƃ���
@REM �@�I�v�V�����͌��s��robocopy�ł͋@�\���Ȃ��͗l�B
@REM �@
@REM �@�܂��A�R�s�[���\�ߍ폜���Ă����Ȃ��ƃ~���[(robocopy)�̎��s���ɂ����烊�g���C��
@REM �@�J��Ԃ��Ă��������Ȃ��P�[�X������A���̊ϓ_��������O�ɃR�s�[����폜���Ă����K�v
@REM �@������B�����āA�R�s�[��𐳏�ɍ폜�ł��Ă���ꍇ�Ƀ~���[�Ɏ��s�����͂��܂̏���
@REM �@�ϑ�����Ă��Ȃ��B

@SET SOLOMON_MIRROR_DIR_TRY_COUNT=0
:ROBOCOPY
@SET /A SOLOMON_MIRROR_DIR_TRY_COUNT=%SOLOMON_MIRROR_DIR_TRY_COUNT%+1
@robocopy "%~dpnx1" "%~dpnx2" /MIR >NUL
@IF /I "1" NEQ "%ERRORLEVEL%" ECHO %SOLOMON_MESSAGE_PREFIX%[error] "%~dpnx1"����"%~dpnx2"�ցA�~���[�ł��܂���ł����B&@CALL "%SOLOMON_LIBCMD_DIR%\sleep.cmd" 1000&ECHO %SOLOMON_MESSAGE_PREFIX%[retry] "%~dpnx1"����"%~dpnx2"�ւ̃~���[�����g���C���܂��B(%SOLOMON_MIRROR_DIR_TRY_COUNT%���)&GOTO ROBOCOPY
@IF /I "1" NEQ "%SOLOMON_MIRROR_DIR_TRY_COUNT%" ECHO %SOLOMON_MESSAGE_PREFIX%[recovered] "%~dpnx1"����"%~dpnx2"�ցA�~���[�ł��܂����B

@ENDLOCAL
