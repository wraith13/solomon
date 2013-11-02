@REM
@REM テストに失敗
@REM

@REM テストメッセージ本文の出力
@IF EXIST "%~dpnx1" CALL "%SOLOMON_HILITE_TYPE_CMD%" "%~dpnx1"

@REM メッセージ出力
@ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_BUILD_HEAD% のテストに失敗

@REM テストに失敗したステータスをセット
@SET SOLOMON_TEST_STATUS=NG

@REM 別buildで既にテストに失敗している場合、これ以降はスキップ
@IF /I "NG" EQU "%SOLOMON_TEST_TOTAL_STATUS%" GOTO :EOF

@REM 別buildで既にコンパイルに失敗している場合、これ以降はスキップ
@IF /I "NG" EQU "%SOLOMON_COMPILE_TOTAL_STATUS%" GOTO :EOF

@REM タイトル設定
@TITLE TEST FAILED - %SOLOMON_TARGET_PROJECT%

@REM テスト失敗イベント処理
%SOLOMON_TEST_FAILED_EVENT%
