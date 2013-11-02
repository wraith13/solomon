@REM
@REM コンパイルに失敗
@REM

@REM エラーメッセージ本文の出力
@IF EXIST "%~dpnx1" CALL "%SOLOMON_HILITE_TYPE_CMD%" "%~dpnx1"

@REM メッセージ出力
@ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_BUILD_HEAD% のコンパイルに失敗

@REM コンパイルに失敗したステータスをセット
@SET SOLOMON_COMPILE_STATUS=NG

@REM 別buildで既にコンパイルに失敗している場合、これ以降はスキップ
@IF /I "NG" EQU "%SOLOMON_COMPILE_TOTAL_STATUS%" GOTO :EOF

@REM タイトル設定
@TITLE COMPILE FAILED - %SOLOMON_TARGET_PROJECT%

@REM コンパイル失敗イベント処理
%SOLOMON_COMPILE_FAILED_EVENT%

