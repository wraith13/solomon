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

CALL "%~dp0clear.test.cmd"

@REM �e�X�g�p��solomon�{�̂��R�s�[
robocopy "%SOLOMON_TEST_SOLOMON_DIR%" "%SOLOMON_TEST_SOLOMON_TEST_DIR%" /MIR >NUL


@REM
@REM �{�� - scenario00
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E�R���p�C�����e�X�g�̌��ʂɉ����Ċe��X�i�b�v�V���b�g���쐬����邱�Ƃ̃`�F�b�N
@REM �@�E�R���p�C��or�e�X�g�Ɏ��s�����r���h���K�؂ɗD�悵�Ď��s����Ă��邱�Ƃ̃`�F�b�N( snapshot\solomon.data\status.cmd �ɂ��m�F)

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step0" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=TRUE>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step1" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step2" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step3" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step4" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=TRUE>> "%SOLOMON_TEST_TESTSHOT_DIR%\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step5" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step6" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step7" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step8" /MIR >NUL


@REM
@REM �{�� - scenario01
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E�R���p�C���Ɏ��s�����r���h���D�悵�Ď��s���� *�Ȃ�* ���Ƃ̃`�F�b�N( snapshot\solomon.data\status.cmd �ɂ��m�F)

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario01\step0" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario01\step1" /MIR >NUL


@REM
@REM �{�� - scenario02
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E�e�X�g�Ɏ��s�����r���h���D�悵�Ď��s���� *�Ȃ�* ���Ƃ̃`�F�b�N( snapshot\solomon.data\status.cmd �ɂ��m�F)

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario02\step0" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario02\step1" /MIR >NUL


@REM
@REM �{�� - scenario03
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E�R���p�C���Ɏ��s�����r���h����уe�X�g�Ɏ��s�����r���h���D�悵�Ď��s���� *�Ȃ�* ���Ƃ̃`�F�b�N( snapshot\solomon.data\status.cmd �ɂ��m�F)

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario03\step0" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM ECHO @SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario03\step1" /MIR >NUL


@REM
@REM �{�� - scenario04
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E�R���p�C���̐��ۂɉ������X�i�b�v�V���b�g���쐬���� *�Ȃ�* ���Ƃ̃`�F�b�N

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_NO_COMPILE=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario04\step0" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_NO_COMPILE=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--x.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario04\step1" /MIR >NUL

@REM
@REM �{�� - scenario05
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E�e�X�g�̐��ۂɉ������X�i�b�v�V���b�g���쐬���� *�Ȃ�* ���Ƃ̃`�F�b�N

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_NO_TEST=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario05\step0" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_NO_TEST=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario05\step1" /MIR >NUL


@REM
@REM �{�� - scenario06
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E�r���h�����s���� *�Ȃ�* ���Ƃ̃`�F�b�N

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_NO_COMPILE=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_NO_TEST=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario06\step0" /MIR >NUL


@REM
@REM �{�� - scenario07
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E *������* �w�肳�ꂽ�r���h���������s����邱�Ƃ̃`�F�b�N( snapshot\result\* �ɂ��m�F)
@REM �@�E�R���p�C�����e�X�g�̌��ʂɉ����Ċe��X�i�b�v�V���b�g���쐬���� *�Ȃ�* ���Ƃ̃`�F�b�N

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 4"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario07\step0" /MIR >NUL

@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 2"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario07\step1" /MIR >NUL

@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 1"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario07\step2" /MIR >NUL

@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 3"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario07\step3" /MIR >NUL


@REM
@REM �{�� - scenario08
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E *������* �w�肳�ꂽ�r���h���������s����邱�Ƃ̃`�F�b�N( snapshot\result\* �ɂ��m�F)
@REM �@�E�R���p�C�����e�X�g�̌��ʂɉ����Ċe��X�i�b�v�V���b�g���쐬���� *�Ȃ�* ���Ƃ̃`�F�b�N

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 2" "build 3"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario08\step0" /MIR >NUL



@REM
@REM �{�� - scenario09
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E *�ݒ�t�@�C����* �w�肳�ꂽ�r���h���������s����邱�Ƃ̃`�F�b�N( snapshot\result\* �ɂ��m�F)
@REM �@�E�R���p�C�����e�X�g�̌��ʂɉ����Ċe��X�i�b�v�V���b�g���쐬����邱�Ƃ̃`�F�b�N

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 4">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario09\step0" /MIR >NUL

@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 2">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario09\step1" /MIR >NUL

@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 1">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario09\step2" /MIR >NUL

@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 3">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario09\step3" /MIR >NUL


@REM
@REM �{�� - scenario10
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E *�ݒ�t�@�C����* �w�肳�ꂽ�r���h���������s����邱�Ƃ̃`�F�b�N( snapshot\result\* �ɂ��m�F)
@REM �@�E�R���p�C�����e�X�g�̌��ʂɉ����Ċe��X�i�b�v�V���b�g���쐬����邱�Ƃ̃`�F�b�N

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 2" "build 3">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario10\step0" /MIR >NUL


@REM
@REM �{�� - scenario11
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E�e��X�i�b�v�V���b�g�� *�����f�B���N�g����* �쐬����邱�Ƃ̃`�F�b�N

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\00>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step0" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\01>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step1" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\02>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step2" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\03>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step3" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\04>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step4" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\05>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step5" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\06>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step6" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\07>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step7" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\08>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM �ŏI��.lnk�̍폜(�R�s�[���邱�ƂŃ����N�悪�������Ȃ��Ȃ�̂�)
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\missed.compile\�ŏI��.lnk"
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\passed.compile\passed.test\�ŏI��.lnk"
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\passed.compile\missed.test\�ŏI��.lnk"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step8" /MIR >NUL


@REM
@REM �{�� - scenario12
@REM

@REM �E���̃e�X�g�V�i���I�̃`�F�b�N�|�C���g
@REM �@�E�e��X�i�b�v�V���b�g�� *����ZIP��* �쐬����邱�Ƃ̃`�F�b�N

@REM �e�X�g���s�f�B���N�g��������
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\00.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step0" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\01.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario0v8\step1" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\02.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step2" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\03.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step3" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\04.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step4" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\05.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step5" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\06.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step6" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\07.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM ���ʂ̑Ҕ�/�R�s�[
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step7" /MIR >NUL

@REM �e�X�g���s�f�B���N�g��������
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\08.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM ���s
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM �ŏI��.lnk�̍폜(�R�s�[���邱�ƂŃ����N�悪�������Ȃ��Ȃ�̂�)
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\missed.compile\�ŏI��.lnk"
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\passed.compile\passed.test\�ŏI��.lnk"
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\passed.compile\missed.test\�ŏI��.lnk"
@REM ���ʂ̑Ҕ�/�R�s�[
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step8" /MIR >NUL


