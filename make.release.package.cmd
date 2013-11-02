@REM
@REM �����[�X�p�b�P�[�W�̍쐬
@REM

@REM
@REM ���ϐ��̏�����
@REM

@SET SOLOMON_DIR=%~dp0cmd\
@SET SOLOMON_RELEASE_DIR=%~dp0release
@SET SOLOMON_LIBCMD_DIR=%SOLOMON_DIR%libcmd
@SET SOLOMON_SUBCMD_DIR=%SOLOMON_DIR%subcmd
@SET SOLOMON_CONFIG_DIR=%SOLOMON_DIR%conf
@SET SOLOMON_CONFIG_CMD=%SOLOMON_CONFIG_DIR%\config.cmd
@SET SOLOMON_CONFIG_LOCALHOST_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.cmd
@SET SOLOMON_CONFIG_LOCALHOST_USER_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.%USERNAME%.cmd

@REM
@REM SOLOMON���ʐݒ�t�@�C���̓ǂݍ���
@REM

@REM solomon\conf\config.cmd �̓ǂݍ���
@IF NOT EXIST "%SOLOMON_CONFIG_CMD%" COLOR 0C&ECHO CONFIG-ERROR: �ݒ�t�@�C�� "%SOLOMON_CONFIG_CMD%" �����݂��܂���B&GOTO :EOF
@CALL "%SOLOMON_CONFIG_CMD%"

@REM solomon\conf\config.%COMPUTERNAME%.cmd ������ꍇ�͂�������ǂݍ���
@IF EXIST "%SOLOMON_CONFIG_LOCALHOST_CMD%" CALL "%SOLOMON_CONFIG_LOCALHOST_CMD%"

@REM solomon\conf\config.%COMPUTERNAME%.%USERNAME%.cmd ������ꍇ�͂�������ǂݍ���
@IF EXIST "%SOLOMON_CONFIG_LOCALHOST_USER_CMD%" CALL "%SOLOMON_CONFIG_LOCALHOST_USER_CMD%"


@REM
@REM �o�͐�f�B���N�g���̍쐬
@REM

@IF NOT EXIST "%SOLOMON_RELEASE_DIR%" MKDIR "%SOLOMON_RELEASE_DIR%"


@REM
@REM �o�͐�p�X�̍쐬
@REM

@CALL "%SOLOMON_LIBCMD_DIR%\timestamp.cmd" YYYYMMDDhhmmss
@SET SOLOMON_RELEASE_ZIP=%SOLOMON_RELEASE_DIR%\solomon-%LIBCMD_TIMESTAMP%.zip


@REM
@REM �T���v���v���W�F�N�g���̃X�i�b�v�V���b�g�폜
@REM

@RMDIR /S /Q "%~dp0sample\prime.factor.project\snapshot"
@RMDIR /S /Q "%~dp0sample\prime.factor.project\testsnap"


@REM
@REM �p�b�P�[�W�쐬
@REM

@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0LICENSE_1_0.txt" >NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0readme.txt" >NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0history.txt" >NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0cmd" >NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0sample" >NUL

@ECHO �����[�X�p�p�b�P�[�W %SOLOMON_RELEASE_ZIP% ���쐬���܂����B
@ECHO.
@ECHO �܂܂��ׂ��t�@�C�����܂܂�Ă��邱�ƂƊ܂܂��ׂ��łȂ��t�@�C�����܂܂�Ă��Ȃ����Ƃ��f�B���N�g��������r�c�[���Ń`�F�b�N������ŁA readme.txt �ɋL�ڂ���Ă���o�[�W�����ԍ��̍̔ԃ��[���ɂ��������ă��l�[�����Ă��������B
@ECHO.
@ECHO history.txt ��ҏW���Y��Ă���ꍇ�͐������ҏW������ł��̃R�}���h���ēx���s���ă����[�X�p�p�b�P�[�W���쐬�������Ă��������B
