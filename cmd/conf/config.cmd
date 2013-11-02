@REM
@REM solomon config
@REM

@REM
@REM ローカルマシン固有の設定を行いたい場合は .\config.%COMPUTERNAME%.cmd で
@REM 行ってください。
@REM


@REM solomonが直接出力するメッセージ
@SET SOLOMON_MESSAGE_PREFIX=SOLOMON: 

@REM 前回コンパイルに失敗したbuildを先に実行する
@SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST=TRUE

@REM 前回テストに失敗したbuildを先に実行する
@SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST=TRUE

@REM 前回コンパイルで警告が出たbuildを先に実行する
@SET SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_FIRST=TRUE

@REM スナップショットの保存先ディレクトリ
@SET SOLOMON_SNAPSHOT_DIR=%SOLOMON_TARGET_DIR%\..\snapshot

@REM スナップショットの保存先ディレクトリ(master)
@SET SOLOMON_SNAPSHOT_MASTER_DIR=%SOLOMON_SNAPSHOT_DIR%\master

@REM スナップショットの保存先ディレクトリ(最後にコンパイルに失敗した時のスナップショット)
@SET SOLOMON_SNAPSHOT_MISSED_COMPILE_DIR=%SOLOMON_SNAPSHOT_DIR%\missed.compile

@REM スナップショットの保存先ディレクトリ(最後にコンパイルに成功した時のスナップショット)
@SET SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR=%SOLOMON_SNAPSHOT_DIR%\passed.compile

@REM スナップショットの保存先ディレクトリ(最後にテストに失敗した時のスナップショット)
@IF "TRUE" EQU "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_MISSED_TEST_DIR=%SOLOMON_SNAPSHOT_DIR%\missed.test
@IF "TRUE" NEQ "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_MISSED_TEST_DIR=%SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR%\missed.test

@REM スナップショットの保存先ディレクトリ(最後にテストに成功した時のスナップショット)
@IF "TRUE" EQU "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_PASSED_TEST_DIR=%SOLOMON_SNAPSHOT_DIR%\passed.test
@IF "TRUE" NEQ "%SOLOMON_NO_COMPILE%" SET SOLOMON_SNAPSHOT_PASSED_TEST_DIR=%SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR%\passed.test

@REM スナップショットをヒストリーで作成
@SET SOLOMON_SNAPSHOT_HISTORY=FALSE

@REM スナップショットのヒストリーディレクトリ書式
@SET SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT=\YYYY\MM\DD\hhmmss

@REM 最終ディレクトリへのショートカットファイルの名前
@SET SOLOMON_SNAPSHOT_HISTORY_SHORTCUT_NAME=最終日

@REM solomonの作業データの保存先ディレクトリ
@SET SOLOMON_DATA_DIR=%SOLOMON_SNAPSHOT_DIR%\solomon.data

@REM コンパイル＆テストを実行する作業ディレクトリ
@SET SOLOMON_TESTSHOT_DIR=%SOLOMON_TARGET_DIR%\..\testsnap

@REM 全ての(≠各)コンパイルとテストを開始する時に実行される処理
@SET SOLOMON_BEGIN_EVENT=@COLOR 07

@REM 全てのコンパイルとテストに成功した時に実行される処理
@SET SOLOMON_ALL_SUCCEEDED_EVENT=@COLOR 0A

@REM コンパイルに失敗した時に実行される処理
@SET SOLOMON_COMPILE_FAILED_EVENT=@COLOR 0C

@REM テストに失敗した時に実行される処理( 先にコンパイルの失敗が発生している場合は呼び出されません。 )
@SET SOLOMON_TEST_FAILED_EVENT=@COLOR 0E

@REM コンパイルで警告が出た時に実行される処理( 先にコンパイルやテストの失敗が発生している場合は呼び出されません。 )
@SET SOLOMON_COMPILE_WARNED_EVENT=@COLOR 0B

@REM コンパイルに失敗しても処理を継続する( 複数のビルドが設定されている場合にのみ意味があります )
@SET SOLOMON_IGNORE_COMPILE_NG=FALSE

@REM 自動コンパイル＆テスト
@SET SOLOMON_AUTO_BUILD=FALSE

@REM 自動コンパイル＆テストでの監視対象ファイル一覧取得コマンド
@SET SOLOMON_AUTO_BUILD_WATCH_VIEW=DIR /A:-D /S /T:W

@REM 自動コンパイル＆テストでの監視対象ファイル一覧フィルター
@SET SOLOMON_AUTO_BUILD_WATCH_FILTER=^| FIND /V "空き領域"

@REM 自動コンパイル＆テストでの監視ポーリング間隔(ミリ秒)
@SET SOLOMON_AUTO_BUILD_POLLING_INTERVAL=3000

@REM 自動コンパイル＆テストでの更新検知後のコンパイル＆テストを開始するまでのディレイ(ミリ秒)
@SET SOLOMON_AUTO_BUILD_DELAY=1000

@REM スナップショットの保存コマンド(最後にコンパイルに失敗した時のスナップショット)
@SET SOLOMON_MAKE_SNAPSHOT_MISSED_COMPILE_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM スナップショットの保存コマンド(最後にコンパイルに成功した時のスナップショット)
@SET SOLOMON_MAKE_SNAPSHOT_PASSED_COMPILE_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM スナップショットの保存コマンド(最後にテストに失敗した時のスナップショット)
@SET SOLOMON_MAKE_SNAPSHOT_MISSED_TEST_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM スナップショットの保存コマンド(最後にテストに成功した時のスナップショット)
@SET SOLOMON_MAKE_SNAPSHOT_PASSED_TEST_CMD=%SOLOMON_MAKE_SNAPSHOT_CMD%

@REM 7zipのパス(この設定を変更する必要がある場合、それは必ずローカルマシン固有の都合のハズなので、 .\config.%COMPUTERNAME%.cmd で上書き指定してください。)
@SET SOLOMON_7ZIP_EXE=C:\Program Files\7-Zip\7z.exe
