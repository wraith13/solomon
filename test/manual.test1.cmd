@REM
@REM do test
@REM


@REM
@REM 準備
@REM

@REM solomon本体
@SET SOLOMON_TEST_SOLOMON_DIR=%~dp0..\cmd

@REM solomon本体のテスト用コピーディレクトリ
@SET SOLOMON_TEST_SOLOMON_TEST_DIR=%~dp0test solomon
@REM ※テストの為に意図的に半角スペースを含むパスにしている。

@REM テストデータディレクトリ
@SET SOLOMON_TEST_DATA_DIR=%~dp0data

@REM テストに使うダミープロジェクト元データディレクトリ
@SET SOLOMON_TEST_DATA_BASE_DIR=%SOLOMON_TEST_DATA_DIR%\base

@REM テストに使うダミービルドコマンドディレクトリ
@SET SOLOMON_TEST_DATA_BUILD_DIR=%SOLOMON_TEST_DATA_DIR%\build

@REM テストを実行する作業ディレクトリ()
@SET SOLOMON_TEST_TESTSHOT_DIR=%~dp0test snap
@REM ※テストの為に意図的に半角スペースを含むパスにしている。

@REM テスト結果ディレクトリ
@SET SOLOMON_TEST_RESULT_DIR=%~dp0result


@REM
@REM 初期化
@REM

@REM auto.test.cmd の実行結果である result まで消さないように clear.test.cmd は使わない。
RMDIR /S /Q "%~dp0test solomon"
RMDIR /S /Q "%~dp0test snap"

@REM テスト用にsolomon本体をコピー
robocopy "%SOLOMON_TEST_SOLOMON_DIR%" "%SOLOMON_TEST_SOLOMON_TEST_DIR%" /MIR >NUL


@REM
@REM 本体
@REM

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO SET SOLOMON_AUTO_BUILD=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\YYYY\MM\DD\hhmmss.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" %*
