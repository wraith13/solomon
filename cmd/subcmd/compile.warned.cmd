@REM
@REM �R���p�C���Ōx��
@REM

@REM �x���{���̏o��
@IF EXIST "%~dpnx1" CALL "%SOLOMON_HILITE_TYPE_CMD%" "%~dpnx1"

@REM ���b�Z�[�W�o��
@ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_BUILD_HEAD% �̃R���p�C���Ōx��

@REM �R���p�C���Ɏ��s�����X�e�[�^�X���Z�b�g
@SET SOLOMON_WARN_STATUS=NG

@REM ��build�Ŋ��ɃR���p�C���Ōx�����łĂ���ꍇ�A����ȍ~�̓X�L�b�v
@IF /I "NG" EQU "%SOLOMON_WARN_TOTAL_STATUS%" GOTO :EOF

@REM ��build�Ŋ��ɃR���p�C���Ɏ��s���Ă���ꍇ�A����ȍ~�̓X�L�b�v
@IF /I "NG" EQU "%SOLOMON_COMPILE_TOTAL_STATUS%" GOTO :EOF

@REM ��build�Ŋ��Ƀe�X�g�Ɏ��s���Ă���ꍇ�A����ȍ~�̓X�L�b�v
@IF /I "NG" EQU "%SOLOMON_TEST_TOTAL_STATUS%" GOTO :EOF

@REM �^�C�g���ݒ�
@TITLE COMPILE WARNED - %SOLOMON_TARGET_PROJECT%

@REM �R���p�C�����s�C�x���g����
%SOLOMON_COMPILE_WARNED_EVENT%
