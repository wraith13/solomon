@REM
@REM コンパイルで警告
@REM

@REM 警告本文の出力
@IF EXIST "%~dpnx1" CALL "%SOLOMON_HILITE_TYPE_CMD%" "%~dpnx1"

@REM メッセージ出力
@ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_BUILD_HEAD% のコンパイルで警告

@REM コンパイルに失敗したステータスをセット
@SET SOLOMON_WARN_STATUS=NG

@REM 別buildで既にコンパイルで警告がでている場合、これ以降はスキップ
@IF /I "NG" EQU "%SOLOMON_WARN_TOTAL_STATUS%" GOTO :EOF

@REM 別buildで既にコンパイルに失敗している場合、これ以降はスキップ
@IF /I "NG" EQU "%SOLOMON_COMPILE_TOTAL_STATUS%" GOTO :EOF

@REM 別buildで既にテストに失敗している場合、これ以降はスキップ
@IF /I "NG" EQU "%SOLOMON_TEST_TOTAL_STATUS%" GOTO :EOF

@REM タイトル設定
@TITLE COMPILE WARNED - %SOLOMON_TARGET_PROJECT%

@REM コンパイル失敗イベント処理
%SOLOMON_COMPILE_WARNED_EVENT%
