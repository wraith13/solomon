@REM
@REM �R���p�C���Ɏ��s
@REM

@REM �G���[���b�Z�[�W�{���̏o��
@IF EXIST "%~dpnx1" CALL "%SOLOMON_HILITE_TYPE_CMD%" "%~dpnx1"

@REM ���b�Z�[�W�o��
@ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_BUILD_HEAD% �̃R���p�C���Ɏ��s

@REM �R���p�C���Ɏ��s�����X�e�[�^�X���Z�b�g
@SET SOLOMON_COMPILE_STATUS=NG

@REM ��build�Ŋ��ɃR���p�C���Ɏ��s���Ă���ꍇ�A����ȍ~�̓X�L�b�v
@IF /I "NG" EQU "%SOLOMON_COMPILE_TOTAL_STATUS%" GOTO :EOF

@REM �^�C�g���ݒ�
@TITLE COMPILE FAILED - %SOLOMON_TARGET_PROJECT%

@REM �R���p�C�����s�C�x���g����
%SOLOMON_COMPILE_FAILED_EVENT%

