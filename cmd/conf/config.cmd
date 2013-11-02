@REM
@REM solomon config
@REM

@REM
@REM ���[�J���}�V���ŗL�̐ݒ���s�������ꍇ�� .\config.%COMPUTERNAME%.cmd ��
@REM �s���Ă��������B
@REM


@REM solomon�����ڏo�͂��郁�b�Z�[�W
@SET SOLOMON_MESSAGE_PREFIX=SOLOMON: 

@REM �O��R���p�C���Ɏ��s����build���Ɏ��s����
@SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=TRUE

@REM �O��e�X�g�Ɏ��s����build���Ɏ��s����
@SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=TRUE

@REM �O��R���p�C���Ōx�����o��build���Ɏ��s����
@SET SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_FIRST=TRUE

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��
@SET SOLOMON_SNAPSHOT_DIR=%SOLOMON_TARGET_DIR%\..\snapshot

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(master)
@SET SOLOMON_SNAPSHOT_MASTER_DIR=%SOLOMON_SNAPSHOT_DIR%\master

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(�Ō�ɃR���p�C���Ɏ��s�������̃X�i�b�v�V���b�g)
@SET SOLOMON_SNAPSHOT_MISSED_COMPILE_DIR=%SOLOMON_SNAPSHOT_DIR%\missed.compile

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(�Ō�ɃR���p�C���ɐ����������̃X�i�b�v�V���b�g)
@SET SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR=%SOLOMON_SNAPSHOT_DIR%\passed.compile

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(�Ō�Ƀe�X�g�Ɏ��s�������̃X�i�b�v�V���b�g)
@IF "TRUE" EQU "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_MISSED_TEST_DIR=%SOLOMON_SNAPSHOT_DIR%\missed.test
@IF "TRUE" NEQ "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_MISSED_TEST_DIR=%SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR%\missed.test

@REM �X�i�b�v�V���b�g�̕ۑ���f�B���N�g��(�Ō�Ƀe�X�g�ɐ����������̃X�i�b�v�V���b�g)
@IF "TRUE" EQU "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_PASSED_TEST_DIR=%SOLOMON_SNAPSHOT_DIR%\passed.test
@IF "TRUE" NEQ "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_PASSED_TEST_DIR=%SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR%\passed.test

@REM �X�i�b�v�V���b�g���q�X�g���[�ō쐬
@SET SOLOMON_SNAPSHOT_HISTORY=FALSE

@REM �X�i�b�v�V���b�g�̃q�X�g���[�f�B���N�g������
@SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\YYYY\MM\DD\hhmmss

@REM �ŏI�f�B���N�g���ւ̃V���[�g�J�b�g�t�@�C���̖��O
@SET SOLOMON_SNAPSHOT_HISTORY_SHORTCUT_NAME=�ŏI��

@REM solomon�̍�ƃf�[�^�̕ۑ���f�B���N�g��
@SET SOLOMON_DATA_DIR=%SOLOMON_SNAPSHOT_DIR%\solomon.data

@REM �R���p�C�����e�X�g�����s�����ƃf�B���N�g��
@SET SOLOMON_TESTSHOT_DIR=%SOLOMON_TARGET_DIR%\..\testsnap

@REM �S�Ă�(���e)�R���p�C���ƃe�X�g���J�n���鎞�Ɏ��s����鏈��
@SET SOLOMON_BEGIN_EVENT=@COLOR 07

@REM �S�ẴR���p�C���ƃe�X�g�ɐ����������Ɏ��s����鏈��
@SET SOLOMON_ALL_SUCCEEDED_EVENT=@COLOR 0A

@REM �R���p�C���Ɏ��s�������Ɏ��s����鏈��
@SET SOLOMON_COMPILE_FAILED_EVENT=@COLOR 0C

@REM �e�X�g�Ɏ��s�������Ɏ��s����鏈��( ��ɃR���p�C���̎��s���������Ă���ꍇ�͌Ăяo����܂���B )
@SET SOLOMON_TEST_FAILED_EVENT=@COLOR 0E

@REM �R���p�C���Ōx�����o�����Ɏ��s����鏈��( ��ɃR���p�C����e�X�g�̎��s���������Ă���ꍇ�͌Ăяo����܂���B )
@SET SOLOMON_COMPILE_WARNED_EVENT=@COLOR 0B

@REM �R���p�C���Ɏ��s���Ă��������p������( �����̃r���h���ݒ肳��Ă���ꍇ�ɂ݈̂Ӗ�������܂� )
@SET SOLOMON_IGNORE_COMPILE_NG=FALSE

@REM �����R���p�C�����e�X�g
@SET SOLOMON_AUTO_BUILD=FALSE

@REM �����R���p�C�����e�X�g�ł̊Ď��Ώۃt�@�C���ꗗ�擾�R�}���h
@SET SOLOMON_AUTO_BUILD_WATCH_VIEW=DIR /A:-D /S /T:W

@REM �����R���p�C�����e�X�g�ł̊Ď��Ώۃt�@�C���ꗗ�t�B���^�[
@SET SOLOMON_AUTO_BUILD_WATCH_FILTER=^| FIND /V "�󂫗̈�"

@REM �����R���p�C�����e�X�g�ł̊Ď��|�[�����O�Ԋu(�~���b)
@SET SOLOMON_AUTO_BUILD_POLLING_INTERVAL=3000

@REM �����R���p�C�����e�X�g�ł̍X�V���m��̃R���p�C�����e�X�g���J�n����܂ł̃f�B���C(�~���b)
@SET SOLOMON_AUTO_BUILD_DELAY=1000

@REM �X�i�b�v�V���b�g�̕ۑ��R�}���h(�Ō�ɃR���p�C���Ɏ��s�������̃X�i�b�v�V���b�g)
@SET SOLOMON_MAKE_SNAPSHOT_MISSED_COMPILE_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM �X�i�b�v�V���b�g�̕ۑ��R�}���h(�Ō�ɃR���p�C���ɐ����������̃X�i�b�v�V���b�g)
@SET SOLOMON_MAKE_SNAPSHOT_PASSED_COMPILE_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM �X�i�b�v�V���b�g�̕ۑ��R�}���h(�Ō�Ƀe�X�g�Ɏ��s�������̃X�i�b�v�V���b�g)
@SET SOLOMON_MAKE_SNAPSHOT_MISSED_TEST_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM �X�i�b�v�V���b�g�̕ۑ��R�}���h(�Ō�Ƀe�X�g�ɐ����������̃X�i�b�v�V���b�g)
@SET SOLOMON_MAKE_SNAPSHOT_PASSED_TEST_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM 7zip�̃p�X(���̐ݒ��ύX����K�v������ꍇ�A����͕K�����[�J���}�V���ŗL�̓s���̃n�Y�Ȃ̂ŁA .\config.%COMPUTERNAME%.cmd �ŏ㏑���w�肵�Ă��������B)
@SET SOLOMON_7ZIP_EXE=C:\Program Files\7-Zip\7z.exe
