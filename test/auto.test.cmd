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

CALL "%~dp0clear.test.cmd"

@REM テスト用にsolomon本体をコピー
robocopy "%SOLOMON_TEST_SOLOMON_DIR%" "%SOLOMON_TEST_SOLOMON_TEST_DIR%" /MIR >NUL


@REM
@REM 本体 - scenario00
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・コンパイル＆テストの結果に応じて各種スナップショットが作成されることのチェック
@REM 　・コンパイルorテストに失敗したビルドが適切に優先して実行されていることのチェック( snapshot\solomon.data\status.cmd による確認)

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step0" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=TRUE>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step1" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step2" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step3" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step4" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=TRUE>> "%SOLOMON_TEST_TESTSHOT_DIR%\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step5" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step6" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step7" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario00\step8" /MIR >NUL


@REM
@REM 本体 - scenario01
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・コンパイルに失敗したビルドが優先して実行され *ない* ことのチェック( snapshot\solomon.data\status.cmd による確認)

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario01\step0" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario01\step1" /MIR >NUL


@REM
@REM 本体 - scenario02
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・テストに失敗したビルドが優先して実行され *ない* ことのチェック( snapshot\solomon.data\status.cmd による確認)

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario02\step0" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario02\step1" /MIR >NUL


@REM
@REM 本体 - scenario03
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・コンパイルに失敗したビルドおよびテストに失敗したビルドが優先して実行され *ない* ことのチェック( snapshot\solomon.data\status.cmd による確認)

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario03\step0" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM ECHO @SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=FALSE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario03\step1" /MIR >NUL


@REM
@REM 本体 - scenario04
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・コンパイルの成否に応じたスナップショットが作成され *ない* ことのチェック

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_NO_COMPILE=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario04\step0" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_NO_COMPILE=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--o.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\--x.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario04\step1" /MIR >NUL

@REM
@REM 本体 - scenario05
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・テストの成否に応じたスナップショットが作成され *ない* ことのチェック

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_NO_TEST=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario05\step0" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_NO_TEST=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oo-.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario05\step1" /MIR >NUL


@REM
@REM 本体 - scenario06
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・ビルドが実行され *ない* ことのチェック

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_NO_COMPILE=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_NO_TEST=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario06\step0" /MIR >NUL


@REM
@REM 本体 - scenario07
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・ *引数で* 指定されたビルドだけが実行されることのチェック( snapshot\result\* による確認)
@REM 　・コンパイル＆テストの結果に応じて各種スナップショットが作成され *ない* ことのチェック

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 4"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario07\step0" /MIR >NUL

@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 2"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario07\step1" /MIR >NUL

@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 1"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario07\step2" /MIR >NUL

@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 3"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario07\step3" /MIR >NUL


@REM
@REM 本体 - scenario08
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・ *引数で* 指定されたビルドだけが実行されることのチェック( snapshot\result\* による確認)
@REM 　・コンパイル＆テストの結果に応じて各種スナップショットが作成され *ない* ことのチェック

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET ...>> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd" "build 2" "build 3"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario08\step0" /MIR >NUL



@REM
@REM 本体 - scenario09
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・ *設定ファイルで* 指定されたビルドだけが実行されることのチェック( snapshot\result\* による確認)
@REM 　・コンパイル＆テストの結果に応じて各種スナップショットが作成されることのチェック

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 4">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario09\step0" /MIR >NUL

@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 2">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario09\step1" /MIR >NUL

@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 1">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario09\step2" /MIR >NUL

@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 3">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario09\step3" /MIR >NUL


@REM
@REM 本体 - scenario10
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・ *設定ファイルで* 指定されたビルドだけが実行されることのチェック( snapshot\result\* による確認)
@REM 　・コンパイル＆テストの結果に応じて各種スナップショットが作成されることのチェック

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_BUILD_CMD_LIST="build 2" "build 3">> "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario10\step0" /MIR >NUL


@REM
@REM 本体 - scenario11
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・各種スナップショットが *履歴ディレクトリで* 作成されることのチェック

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\00>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step0" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\01>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step1" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\02>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step2" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\03>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step3" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\04>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step4" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\05>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step5" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\06>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step6" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\07>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step7" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\07\08>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 最終日.lnkの削除(コピーすることでリンク先が正しくなくなるので)
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\missed.compile\最終日.lnk"
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\passed.compile\passed.test\最終日.lnk"
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\passed.compile\missed.test\最終日.lnk"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario11\step8" /MIR >NUL


@REM
@REM 本体 - scenario12
@REM

@REM ・このテストシナリオのチェックポイント
@REM 　・各種スナップショットが *履歴ZIPで* 作成されることのチェック

@REM テスト実行ディレクトリ初期化
robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\00.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step0" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\01.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario0v8\step1" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\02.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step2" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\03.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step3" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\04.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step4" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\05.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\oox.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step5" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\06.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step6" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\07.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\x--.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 結果の待避/コピー
@REM robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step7" /MIR >NUL

@REM テスト実行ディレクトリ初期化
@REM robocopy "%SOLOMON_TEST_DATA_BASE_DIR%" "%SOLOMON_TEST_TESTSHOT_DIR%" /MIR >NUL
@REM conf
@REM ECHO @SET SOLOMON_SNAPSHOT_HISTORY=TRUE>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
ECHO @SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\2010\01\08\08.zip>>"%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\conf\config.cmd"
@REM build
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 1.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 2.cmd" >NUL
copy "%SOLOMON_TEST_DATA_BUILD_DIR%\ooo.cmd" "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build\build 3.cmd" >NUL
@REM 実行
CALL "%SOLOMON_TEST_TESTSHOT_DIR%\src\solomon\build.cmd"
@REM 最終日.lnkの削除(コピーすることでリンク先が正しくなくなるので)
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\missed.compile\最終日.lnk"
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\passed.compile\passed.test\最終日.lnk"
DEL "%SOLOMON_TEST_TESTSHOT_DIR%\snapshot\passed.compile\missed.test\最終日.lnk"
@REM 結果の待避/コピー
robocopy "%SOLOMON_TEST_TESTSHOT_DIR%" "%SOLOMON_TEST_RESULT_DIR%\scenario12\step8" /MIR >NUL


