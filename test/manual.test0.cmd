@REM
@REM do test
@REM


@REM
@REM ����
@REM

@REM solomon�{��
@SET SOLOMON_TEST_SOLOMON_DIR=%~dp0..\cmd

@REM solomon�{�̂̃e�X�g�p�R�s�[�f�B���N�g��
@SET SOLOMON_TEST_SOLOMON_TEST_DIR=%~dp0test solomon
@REM ���e�X�g�ׂ̈ɈӐ}�I�ɔ��p�X�y�[�X���܂ރp�X�ɂ��Ă���B

@REM �e�X�g�f�[�^�f�B���N�g��
@SET SOLOMON_TEST_DATA_DIR=%~dp0data

@REM �e�X�g�Ɏg���_�~�[�v���W�F�N�g���f�[�^�f�B���N�g��
@SET SOLOMON_TEST_DATA_BASE_DIR=%SOLOMON_TEST_DATA_DIR%\base

@REM �e�X�g�Ɏg���_�~�[�r���h�R�}���h�f�B���N�g��
@SET SOLOMON_TEST_DATA_BUILD_DIR=%SOLOMON_TEST_DATA_DIR%\build

@REM �e�X�g�����s�����ƃf�B���N�g��()
@SET SOLOMON_TEST_TESTSHOT_DIR=%~dp0test snap
@REM ���e�X�g�ׂ̈ɈӐ}�I�ɔ��p�X�y�[�X���܂ރp�X�ɂ��Ă���B

@REM �e�X�g���ʃf�B���N�g��
@SET SOLOMON_TEST_RESULT_DIR=%~dp0result


@REM
@REM ������
@REM

@REM auto.test.cmd �̎��s���ʂł��� result �܂ŏ����Ȃ��悤�� clear.test.cmd �͎g��Ȃ��B
RMDIR /S /Q "%~dp0test solomon"
RMDIR /S /Q "%~dp0test snap"

@REM �e�X�g�p��solomon�{�̂��R�s�[
robocopy "%SOLOMON_TEST_SOLOMON_DIR%" "%SOLOMON_TEST_SOLOMON_TEST_DIR%" /MIR >NUL


@REM
@REM �{��
@REM

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO SET SOLOMON_AUTO_BUILD=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\YYYY\MM\DD\hhmmss.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\auto.build.cmd" %*
