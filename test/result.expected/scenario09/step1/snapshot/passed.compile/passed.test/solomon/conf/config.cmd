@REM
@REM solomon config
@REM

@REM 
@REM ���[�J���}�V���ŗL�̐ݒ���s�������ꍇ�� solomon\conf\config.%COMPUTERNAME%.cmd
@REM �ōs���Ă��������B
@REM 


@REM solomon\cmd\main.cmd �̃p�X
@SET SOLOMON_MAIN_CMD=%~dp0..\..\..\..\test solomon\main.cmd

@REM �v���W�F�N�g��(�R���\�[���E�B���h�E�̃^�C�g���ɕ\������܂�)
@SET SOLOMON_TARGET_PROJECT=TEST PROJECT

@REM �X�i�b�v�V���b�g���B��Ώۂ̃f�B���N�g��
@SET SOLOMON_TARGET_DIR=%~dp0..\..

@REM �R���p�C������уe�X�g�����s����R�}���h�����݂���f�B���N�g��(%SOLOMON_TARGET_DIR%����̑��Ύw��B%SOLOMON_TARGET_DIR%���̃f�B���N�g���ł���K�v������܂��B)
@SET SOLOMON_BUILD_CMD_DIR=\solomon\build

@REM �R���p�C������уe�X�g�����s����R�}���h�̃��X�g(�g���q�� .cmd ����菜�����X�y�[�X��؂�Ŏw�肵�܂��B�ȗ������ %SOLOMON_BUILD_CMD_DIR% �f�B���N�g���ɑ��݂���S�Ă� *.cmd �t�@�C�����w�肵���̂Ɠ����ɂȂ�܂��B)
@SET SOLOMON_BUILD_CMD_LIST=

@REM �R���p�C�����s��Ȃ��v���W�F�N�g(TRUE�ɂ���ƃR���p�C���̐��ۂɂ��X�i�b�v�V���b�g�쐬���s���Ȃ��Ȃ�܂��B)
@SET SOLOMON_NO_COMPILE=FALSE

@REM �e�X�g���s��Ȃ��v���W�F�N�g(TRUE�ɂ���ƃe�X�g�̐��ۂɂ��X�i�b�v�V���b�g�쐬���s���Ȃ��Ȃ�܂��B)
@SET SOLOMON_NO_TEST=FALSE


@REM 
@REM ����ȍ~�̐ݒ�� solomon\conf\config.cmd �ōs���܂����A�v���W�F�N�g
@REM �ŗL�̐ݒ���{�������ꍇ�ɂ����ōs���Ă��������B
@REM solomon\conf\config.cmd ��肱����̐ݒ肪�D�悳��܂��B
@REM 


@REM �O��R���p�C���Ɏ��s����build���Ɏ��s����
@REM SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=TRUE

@REM �O��e�X�g�Ɏ��s����build���Ɏ��s����
@REM SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=TRUE

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��
@REM SET SOLOMON_SNAPSHOT_DIR=%SOLOMON_TARGET_DIR%\..\snapshot

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(master)
@REM SET SOLOMON_SNAPSHOT_MASTER_DIR=%SOLOMON_TARGET_DIR%\master

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(�Ō�ɃR���p�C���Ɏ��s�������̃X�i�b�v�V���b�g)
@REM SET SOLOMON_SNAPSHOT_MISSED_COMPILE_DIR=%SOLOMON_TARGET_DIR%\missed.compile

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(�Ō�ɃR���p�C���ɐ����������̃X�i�b�v�V���b�g)
@REM SET SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR=%SOLOMON_TARGET_DIR%\passed.compile

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(�Ō�Ƀe�X�g�Ɏ��s�������̃X�i�b�v�V���b�g)
@REM IF "TRUE" EQU "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_MISSED_TEST_DIR=%SOLOMON_SNAPSHOT_DIR%\missed.test
@REM IF "TRUE" NEQ "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_MISSED_TEST_DIR=%SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR%\missed.test

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(�Ō�Ƀe�X�g�ɐ����������̃X�i�b�v�V���b�g)
@REM IF "TRUE" EQU "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_PASSED_TEST_DIR=%SOLOMON_SNAPSHOT_DIR%\passed.test
@REM IF "TRUE" NEQ "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_PASSED_TEST_DIR=%SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR%\passed.test

@REM �X�i�b�v�V���b�g���q�X�g���[�ō쐬
@REM SET SOLOMON_SNAPSHOT_HISTORY=FALSE

@REM �X�i�b�v�V���b�g�̃q�X�g���[�f�B���N�g������
@REM SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\YYYY\MM\DD\hhmmss

@REM �ŏI�f�B���N�g���ւ̃V���[�g�J�b�g�t�@�C���̖��O
@REM SET SOLOMON_SNAPSHOT_HISTORY_SHORTCUT_NAME=�ŏI��

@REM solomon�̍�ƃf�[�^�̕ۑ���f�B���N�g��
@REM SET SOLOMON_DATA_DIR=%SOLOMON_SNAPSHOT_DIR%\solomon.data

@REM �R���p�C�����e�X�g�����s�����ƃf�B���N�g��
@REM SET SOLOMON_TESTSHOT_DIR=%SOLOMON_TARGET_DIR%\..\testsnap

@REM �S�ẴR���p�C���ƃe�X�g�ɐ����������Ɏ��s����鏈��
@REM SET SOLOMON_ALL_SUCCEEDED_EVENT=@COLOR 0A

@REM �R���p�C���Ɏ��s�������Ɏ��s����鏈��
@REM SET SOLOMON_COMPILE_FAILED_EVENT=@COLOR 0C

@REM �e�X�g�Ɏ��s�������Ɏ��s����鏈��( ��ɃR���p�C���̎��s���������Ă���ꍇ�͌Ăяo����܂���B )
@REM SET SOLOMON_TEST_FAILED_EVENT=@COLOR 0E

@REM �R���p�C���Ɏ��s���Ă��������p������( �����̃r���h���ݒ肳��Ă���ꍇ�ɂ݈̂Ӗ�������܂� )
@REM SET SOLOMON_IGNORE_COMPILE_NG=FALSE

@REM �����R���p�C�����e�X�g
@REM SET SOLOMON_AUTO_BUILD=FALSE

@REM �����R���p�C�����e�X�g�ł̊Ď��Ώۃt�@�C���t�B���^�[( dir �R�}���h�̈����Ƃ��Ďg�p����܂��B )
@REM SET SOLOMON_AUTO_BUILD_WATCH_FILTER=

@REM �����R���p�C�����e�X�g�ł̊Ď��|�[�����O�Ԋu(�~���b)
@REM SET SOLOMON_AUTO_BUILD_POLLING_INTERVAL=3000

@REM �����R���p�C�����e�X�g�ł̍X�V���m��̃R���p�C�����e�X�g���J�n����܂ł̃f�B���C(�~���b)
@REM SET SOLOMON_AUTO_BUILD_DELAY=1000

@REM �X�i�b�v�V���b�g�̕ۑ��R�}���h(�Ō�ɃR���p�C���Ɏ��s�������̃X�i�b�v�V���b�g)
@REM SET SOLOMON_MAKE_SNAPSHOT_MISSED_COMPILE_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM �X�i�b�v�V���b�g�̕ۑ��R�}���h(�Ō�ɃR���p�C���ɐ����������̃X�i�b�v�V���b�g) �� SOLOMON_NO_TEST �� TRUE �̏ꍇ�ɂ����Ăяo����܂���B
@REM SET SOLOMON_MAKE_SNAPSHOT_PASSED_COMPILE_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM �X�i�b�v�V���b�g�̕ۑ��R�}���h(�Ō�Ƀe�X�g�Ɏ��s�������̃X�i�b�v�V���b�g)
@REM SET SOLOMON_MAKE_SNAPSHOT_MISSED_TEST_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM �X�i�b�v�V���b�g�̕ۑ��R�}���h(�Ō�Ƀe�X�g�ɐ����������̃X�i�b�v�V���b�g)
@REM SET SOLOMON_MAKE_SNAPSHOT_PASSED_TEST_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM 7zip�̃p�X(���̐ݒ��ύX����K�v������ꍇ�A����͕K�����[�J���}�V���ŗL�̓s���̃n�Y�Ȃ̂ŁA .\config.%COMPUTERNAME%.cmd �ŏ㏑���w�肵�Ă��������B)
@REM SET SOLOMON_7ZIP_EXE=C:\Program Files\7-Zip\7z.exe
@SET SOLOMON_BUILD_CMD_LIST="build 4"
@SET SOLOMON_BUILD_CMD_LIST="build 2"
