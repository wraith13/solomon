@REM
@REM �e�X�g�Ɏ��s
@REM

@REM �e�X�g���b�Z�[�W�{���̏o��
@IF EXIST "%~dpnx1" CALL "%SOLOMON_HILITE_TYPE_CMD%" "%~dpnx1"

@REM ���b�Z�[�W�o��
@ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_BUILD_HEAD% �̃e�X�g�Ɏ��s

@REM �e�X�g�Ɏ��s�����X�e�[�^�X���Z�b�g
@SET SOLOMON_TEST_STATUS=NG

@REM ��build�Ŋ��Ƀe�X�g�Ɏ��s���Ă���ꍇ�A����ȍ~�̓X�L�b�v
@IF /I "NG" EQU "%SOLOMON_TEST_TOTAL_STATUS%" GOTO :EOF

@REM ��build�Ŋ��ɃR���p�C���Ɏ��s���Ă���ꍇ�A����ȍ~�̓X�L�b�v
@IF /I "NG" EQU "%SOLOMON_COMPILE_TOTAL_STATUS%" GOTO :EOF

@REM �^�C�g���ݒ�
@TITLE TEST FAILED - %SOLOMON_TARGET_PROJECT%

@REM �e�X�g���s�C�x���g����
%SOLOMON_TEST_FAILED_EVENT%
