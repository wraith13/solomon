@REM
@REM �X�V���m�F�����܂őҋ@
@REM

@ECHO %SOLOMON_MESSAGE_PREFIX%�Ď��f�B���N�g�� %SOLOMON_TARGET_DIR% ���X�V�����o�����܂őҋ@

@REM �Ď����[�v
:AUTO_BUILD_POLLING

@REM �Ď��f�B���N�g����(�T�u�f�B���N�g�����܂�)�̍X�V�����t���̃t�@�C���ꗗ�̎擾
@CALL "%SOLOMON_SUBCMD_DIR%\make.dir.signature.cmd" "%SOLOMON_TARGET_DIR%" "%SOLOMON_AUTO_BUILD_CURRENT_DIR_TXT%"

@REM �O��̃R���p�C���� �Ď��f�B���N�g����(�T�u�f�B���N�g�����܂�)�̍X�V�����t���̃t�@�C���ꗗ
@FC "%SOLOMON_AUTO_BUILD_PREVIOUS_DIR_TXT%" "%SOLOMON_AUTO_BUILD_CURRENT_DIR_TXT%" >NUL

@REM �ς���Ă��Ȃ���� %SOLOMON_AUTO_BUILD_POLLING_INTERVAL% �b�ҋ@��ɍēx�m�F����
@IF "0" EQU "%ERRORLEVEL%" CALL "%SOLOMON_LIBCMD_DIR%\sleep.cmd" %SOLOMON_AUTO_BUILD_POLLING_INTERVAL%&GOTO AUTO_BUILD_POLLING

@REM �ς���Ă���� %SOLOMON_AUTO_BUILD_DELAY% �b�ҋ@��ɂ��̃o�b�`�t�@�C���𔲂���
@ECHO %SOLOMON_MESSAGE_PREFIX%�Ď��f�B���N�g�� %SOLOMON_TARGET_DIR% �̍X�V�����o�I
@CALL "%SOLOMON_LIBCMD_DIR%\sleep.cmd" %SOLOMON_AUTO_BUILD_DELAY%
