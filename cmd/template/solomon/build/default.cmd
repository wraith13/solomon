@REM
@REM build
@REM


@REM solomon �͍ŏ��� %SOLOMON_TARGET_DIR% �� %SOLOMON_SNAPSHOT_MASTER_DIR% �ɃR�s�[���܂��B
@REM �e�R���p�C�����e�X�g�����s����ۂɖ��� %SOLOMON_SNAPSHOT_MASTER_DIR% �� %SOLOMON_TESTSHOT_DIR% �ɃR�s�[���A
@REM �J�����g�f�B���N�g���� %SOLOMON_TESTSHOT_DIR% �ɃZ�b�g������Ԃł���cmd���Ăяo���܂��B
@REM
@REM %SOLOMON_TESTSHOT_DIR% �̓R���p�C�����e�X�g���s���e���|�����[�ȃf�B���N�g���Ƃ����ʒu�Â��Ȃ̂�
@REM ����cmd�����s���ɐ������ꂽ�t�@�C���ŕK�v�Ȃ��͓̂K�X���̃f�B���N�g���փR�s�[���Ă��������B
@REM ( �����̃r���h�����s�����ꍇ�A���̃r���h�����s����ׂɑ�����������܂��B )


@REM
@REM �R���p�C��
@REM

�������ŃR���p�C�������s���鏈�����L�q���Ă��������B

�������ŃR���p�C�����������������f���鏈�����L�q���Ă��������B
@IF ���������Ă����灚 (CALL "%SOLOMON_COMPILE_SUCCESS_CMD%") ELSE CALL "%SOLOMON_COMPILE_FAILED_CMD%" ���G���[���b�Z�[�W���i�[���ꂽ�t�@�C��(�ȗ���)�� & GOTO :EOF

�������ŃR���p�C�����Ɍx�����o�Ă��Ȃ����������f���鏈�����L�q���Ă��������B
@IF ���x�����o�Ă����灚 CALL "%SOLOMON_COMPILE_WARNED_CMD%" ���x�����b�Z�[�W���i�[���ꂽ�t�@�C��(�ȗ���)��

��[�K�v�ɉ�����]�����ŃR���p�C�����ʂ�testshot����R�s�[���鏈�����L�q���Ă��������B


@REM
@REM �e�X�g
@REM

�������Ńe�X�g�����s���鏈�����L�q���Ă��������B

��[�K�v�ɉ�����]�����Ńe�X�g���ʂ�testshot����R�s�[���鏈�����L�q���Ă��������B

�������Ńe�X�g���������������f���鏈�����L�q���Ă��������B
@IF ���������Ă����灚 (CALL "%SOLOMON_TEST_SUCCESS_CMD%") ELSE CALL "%SOLOMON_TEST_FAILED_CMD%" ���e�X�g���b�Z�[�W���i�[���ꂽ�t�@�C��(�ȗ���)�� & GOTO :EOF

