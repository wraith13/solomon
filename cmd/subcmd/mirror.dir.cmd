@REM
@REM �f�B���N�g���[�̃~���[�R�s�[
@REM

@RMDIR /S /Q "%~dpnx2" >NUL
@REM ���{���A����robocopy�R�}���h�����ł��܂������ė~�����Ƃ���Ȃ̂����A�R�s�[���ƃR�s�[���
@REM �@�X�V�����A�T�C�Y�A����������̃t�@�C�����㏑������Ȃ��Ƃ����d�l/��肪����ׁA�R�s�[���
@REM �@�����Ă��܂��B�Ȃ��A����robocopy�̋������������ׂɑ��݂��Ă��� /is �Ƃ����I�v�V������
@REM �@���s��robocopy�ł͋@�\���Ȃ��͗l�B

@robocopy "%~dpnx1" "%~dpnx2" /MIR >NUL
