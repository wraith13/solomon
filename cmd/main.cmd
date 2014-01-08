@REM
@REM solomon main
@REM


@SETLOCAL


@REM
@REM 環境変数の初期化1
@REM

@SET SOLOMON_DIR=%~dp0
@SET SOLOMON_MAIN_CMD_SELF=%0

@REM
@REM コマンドラインオプションの読み込み
@REM

@SET SOLOMON_ARG_BUILD_LIST=
:OPTION_LOOP
@SET SOLOMON_CURRENT_ARG=%~1
@IF /I "/auto" EQU "%~1" SET SOLOMON_ARG_AUTO_BUILD=TRUE&SHIFT&GOTO OPTION_LOOP
@IF /I "/-auto" EQU "%~1" SET SOLOMON_ARG_AUTO_BUILD=FALSE&SHIFT&GOTO OPTION_LOOP
@IF /I "/" EQU "%SOLOMON_CURRENT_ARG:~0,1%" GOTO SHOW_HELP
@IF /I "" NEQ "%~dpnx1" SET SOLOMON_DISABLED_MAKE_SNAPSHOT=TRUE&SET SOLOMON_ARG_BUILD_LIST=%SOLOMON_ARG_BUILD_LIST% "%SOLOMON_CURRENT_ARG%"&SHIFT&GOTO OPTION_LOOP

@REM
@REM 事前条件チェック
@REM

:AUTO_BUILD
@IF "" EQU "%SOLOMON_TARGET_SOLOMON_DIR%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%ERROR: SOLOMON_TARGET_SOLOMON_DIR が指定されていません。%SOLOMON_MAIN_CMD_SELF% はユーザーが直接呼び出すファイルでありません。&GOTO :EOF
@IF NOT EXIST "%SOLOMON_TARGET_SOLOMON_DIR%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%ERROR: "%SOLOMON_TARGET_SOLOMON_DIR%" が見つかりません。&GOTO :EOF


@REM
@REM 環境変数の初期化2
@REM

@SET SOLOMON_LIBCMD_DIR=%SOLOMON_DIR%libcmd
@SET SOLOMON_SUBCMD_DIR=%SOLOMON_DIR%subcmd
@SET SOLOMON_COMPILE_SUCCESS_CMD=%SOLOMON_SUBCMD_DIR%\compile.success.cmd
@SET SOLOMON_COMPILE_FAILED_CMD=%SOLOMON_SUBCMD_DIR%\compile.failed.cmd
@SET SOLOMON_TEST_SUCCESS_CMD=%SOLOMON_SUBCMD_DIR%\test.success.cmd
@SET SOLOMON_TEST_FAILED_CMD=%SOLOMON_SUBCMD_DIR%\test.failed.cmd
@SET SOLOMON_COMPILE_WARNED_CMD=%SOLOMON_SUBCMD_DIR%\compile.warned.cmd
@SET SOLOMON_MIRROR_DIR_CMD=%SOLOMON_SUBCMD_DIR%\mirror.dir.cmd
@SET SOLOMON_MAKE_SNAPSHOT_CMD=%SOLOMON_SUBCMD_DIR%\make.snapshot.cmd
@SET SOLOMON_HILITE_TYPE_CMD=%SOLOMON_SUBCMD_DIR%\hilite.type.cmd
@SET SOLOMON_CONFIG_DIR=%SOLOMON_DIR%conf
@SET SOLOMON_CONFIG_CMD=%SOLOMON_CONFIG_DIR%\config.cmd
@SET SOLOMON_CONFIG_LOCALHOST_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.cmd
@SET SOLOMON_CONFIG_LOCALHOST_USER_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.%USERNAME%.cmd


@REM
@REM SOLOMON共通設定ファイルの読み込み
@REM

@REM solomon\conf\config.cmd の読み込み
@IF NOT EXIST "%SOLOMON_CONFIG_CMD%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%CONFIG-ERROR: 設定ファイル "%SOLOMON_CONFIG_CMD%" が存在しません。&GOTO :EOF
@CALL "%SOLOMON_CONFIG_CMD%"

@REM solomon\conf\config.%COMPUTERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_CONFIG_LOCALHOST_CMD%" CALL "%SOLOMON_CONFIG_LOCALHOST_CMD%"

@REM solomon\conf\config.%COMPUTERNAME%.%USERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_CONFIG_LOCALHOST_USER_CMD%" CALL "%SOLOMON_CONFIG_LOCALHOST_USER_CMD%"


@REM
@REM プロジェクト固有設定ファイルの読み込み
@REM

@REM これらの設定ファイルはこの main.cmd が実行されるよりも先に読み込まれるが
@REM 設定の優先順位の都合上再読み込みを行う。

@REM target\solomon\conf\config.cmd の読み込み
@IF NOT EXIST "%SOLOMON_TARGET_CONFIG_CMD%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%CONFIG-ERROR: 設定ファイル "%SOLOMON_TARGET_CONFIG_CMD%" が存在しません。&GOTO :EOF
@CALL "%SOLOMON_TARGET_CONFIG_CMD%"

@REM target\solomon\conf\config.%COMPUTERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%TARGET_SOLOMON_CONFIG_LOCALHOST_CMD%" CALL "%TARGET_SOLOMON_CONFIG_LOCALHOST_CMD%"

@REM target\solomon\conf\config.%COMPUTERNAME%.%USERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_TARGET_CONFIG_LOCALHOST_USER_CMD%" CALL "%SOLOMON_TARGET_CONFIG_LOCALHOST_USER_CMD%"


@REM
@REM ...
@REM

@IF /I "" NEQ "%SOLOMON_ARG_AUTO_BUILD%" SET SOLOMON_AUTO_BUILD=%SOLOMON_ARG_AUTO_BUILD%


@REM
@REM 引数チェック
@REM

@REM SOLOMON_NO_COMPILE＋SOLOMON_NO_TESTのチェック
@IF /I "TRUE+TRUE" EQU "%SOLOMON_NO_COMPILE%+%SOLOMON_NO_TEST%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%CONFIG-ERROR: SOLOMON_NO_COMPILE と SOLOMON_NO_TEST はどちらか片方しか有効にできません。&GOTO :EOF

@REM 7zipのチェック
@IF /I "TRUE" EQU "%SOLOMON_SNAPSHOT_HISTORY%" IF /I ".zip" EQU "%SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT:~-4%" GOTO ZIP_TOOL_CHECK
@IF /I ".zip" EQU "%SOLOMON_SNAPSHOT_MISSED_COMPILE_DIR:~-4%" GOTO ZIP_TOOL_CHECK
@IF /I ".zip" EQU "%SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR:~-4%" GOTO ZIP_TOOL_CHECK
@IF /I ".zip" EQU "%SOLOMON_SNAPSHOT_MISSED_TEST_DIR:~-4%" GOTO ZIP_TOOL_CHECK
@IF /I ".zip" EQU "%SOLOMON_SNAPSHOT_PASSED_TEST_DIR:~-4%" GOTO ZIP_TOOL_CHECK
@GOTO ZIP_TOOL_CHECK_END
:ZIP_TOOL_CHECK
@IF NOT EXIST "%SOLOMON_7ZIP_EXE%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%CONFIG-ERROR: "%SOLOMON_7ZIP_EXE%"が見つかりません。7zipがインストールされていないとZIPファイル作成機能は利用できません。設定を確認してください。&GOTO :EOF
:ZIP_TOOL_CHECK_END


@REM
@REM ステータスのロード
@REM

@REM target\..\snapshot\solomon.data\status.cmd がある場合は読み込む
@SET SOLOMON_BUILD_STATUS_CMD=%SOLOMON_DATA_DIR%\status.cmd
@IF EXIST "%SOLOMON_BUILD_STATUS_CMD%" CALL "%SOLOMON_BUILD_STATUS_CMD%"


@REM 自動コンパイル＆テストでの更新検出用ファイル
@SET SOLOMON_AUTO_BUILD_PREVIOUS_DIR_TXT=%SOLOMON_DATA_DIR%\previous.dir.txt
@SET SOLOMON_AUTO_BUILD_CURRENT_DIR_TXT=%SOLOMON_DATA_DIR%\current.dir.txt


@REM
@REM ビルド開始
@REM

@TITLE BUILDING - %SOLOMON_TARGET_PROJECT%
@ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_TARGET_PROJECT% ビルド開始(%DATE% %TIME%)

@REM 開始イベント処理
%SOLOMON_BEGIN_EVENT%


@REM
@REM ソースファイルをmasterへコピー
@REM

@REM 監視ディレクトリ内(サブディレクトリを含む)の更新日時付きのファイル一覧の取得
@IF /I "TRUE" EQU "%SOLOMON_AUTO_BUILD%" CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%SOLOMON_AUTO_BUILD_PREVIOUS_DIR_TXT%\.."&CALL "%SOLOMON_SUBCMD_DIR%\make.dir.signature.cmd" "%SOLOMON_TARGET_DIR%" "%SOLOMON_AUTO_BUILD_PREVIOUS_DIR_TXT%"

@ECHO %SOLOMON_MESSAGE_PREFIX%スナップショット作成(target to master)
@CALL "%SOLOMON_MIRROR_DIR_CMD%" "%SOLOMON_TARGET_DIR%" "%SOLOMON_SNAPSHOT_MASTER_DIR%"


@REM
@REM コンパイル＆テストのループ
@REM

@SET SOLOMON_BUILD_LIST=%SOLOMON_ARG_BUILD_LIST%
@IF /I "" EQU "%SOLOMON_BUILD_LIST%" SET SOLOMON_BUILD_LIST=%SOLOMON_BUILD_CMD_LIST%
@IF /I "" EQU "%SOLOMON_BUILD_LIST%" FOR /f "DELIMS=" %%A IN ('DIR /B "%SOLOMON_SNAPSHOT_MASTER_DIR%\%SOLOMON_BUILD_CMD_DIR%\*.cmd"') DO @CALL "%SOLOMON_SUBCMD_DIR%\add.build.cmd" "%%A"
@SET SOLOMON_MASTER_BUILD_LIST=%SOLOMON_BUILD_LIST%

@REM 前回、コンパイル or テストに失敗したbuildを優先
@IF /I "TRUE" EQU "%SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_FIRST%" SET SOLOMON_BUILD_LIST=%SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_LIST% %SOLOMON_BUILD_LIST%
@IF /I "TRUE" EQU "%SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST%" SET SOLOMON_BUILD_LIST=%SOLOMON_PREVIOUS_TEST_FAILED_BUILD_LIST% %SOLOMON_BUILD_LIST%
@IF /I "TRUE" EQU "%SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST%" SET SOLOMON_BUILD_LIST=%SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_LIST% %SOLOMON_BUILD_LIST%
@CALL "%SOLOMON_LIBCMD_DIR%\distinct.cmd" %SOLOMON_BUILD_LIST%
@SET SOLOMON_BUILD_LIST=%LIBCMD_DISTINCT%


@REM
@REM フラグの初期化
@REM

@SET SOLOMON_COMPILE_TOTAL_STATUS=
@SET SOLOMON_TEST_TOTAL_STATUS=
@SET SOLOMON_WARN_TOTAL_STATUS=


@REM
@REM ビルドループ
@REM

:FOR_EACH_BUILD
@SET SOLOMON_COMPILE_STATUS=
@SET SOLOMON_TEST_STATUS=
@SET SOLOMON_WARN_STATUS=
@CALL "%SOLOMON_LIBCMD_DIR%\headtail.cmd" %SOLOMON_BUILD_LIST%
@SET SOLOMON_BUILD_HEAD=%LIBCMD_HEADTAIL_HEAD%
@SET SOLOMON_BUILD_LIST=%LIBCMD_HEADTAIL_TAIL%

@IF /I "" EQU "%SOLOMON_BUILD_HEAD%" GOTO FOR_EACH_BUILD_END

@CALL "%SOLOMON_LIBCMD_DIR%\find.cmd" "%SOLOMON_BUILD_HEAD%" %SOLOMON_MASTER_BUILD_LIST%
@IF /I "-1" EQU "%LIBCMD_FIND_INDEX%" GOTO FOR_EACH_BUILD


@REM
@REM masterからtestsnapへミラー
@REM

@ECHO %SOLOMON_MESSAGE_PREFIX%スナップショット作成(master to testsnap)

@CALL "%SOLOMON_MIRROR_DIR_CMD%" "%SOLOMON_SNAPSHOT_MASTER_DIR%" "%SOLOMON_TESTSNAP_DIR%"


@REM
@REM コンパイル＆テストの実行
@REM

@ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_BUILD_HEAD% コンパイル＆テスト開始

@REM ビルドコマンドの実行
@PUSHD "%SOLOMON_TESTSNAP_DIR%"
@IF NOT EXIST "%SOLOMON_TESTSNAP_DIR%\%SOLOMON_BUILD_CMD_DIR%\%SOLOMON_BUILD_HEAD%.cmd" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%"%SOLOMON_TESTSNAP_DIR%\%SOLOMON_BUILD_CMD_DIR%\%SOLOMON_BUILD_HEAD%.cmd" が存在しません。設定を確認してください。&GOTO :EOF
@CALL "%SOLOMON_TESTSNAP_DIR%\%SOLOMON_BUILD_CMD_DIR%\%SOLOMON_BUILD_HEAD%.cmd"
@POPD

@REM 成功の確認が取れてない場合も失敗扱いに
@IF /I "TRUE" NEQ "%SOLOMON_NO_COMPILE%" IF /I "" EQU "%SOLOMON_COMPILE_STATUS%" CALL "%SOLOMON_COMPILE_FAILED_CMD%" "%SOLOMON_SUBCMD_DIR%\message\no_call_compile_result_cmd.txt"
@IF /I "TRUE" NEQ "%SOLOMON_NO_TEST%" IF /I "OK" EQU "%SOLOMON_COMPILE_STATUS%" IF /I "" EQU "%SOLOMON_TEST_STATUS%" CALL "%SOLOMON_TEST_FAILED_CMD%" "%SOLOMON_SUBCMD_DIR%\message\no_call_test_result_cmd.txt"

@REM ステータスの更新とセーブ
@IF /I "TRUE" NEQ "%SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_FIRST%" IF /I "TRUE" NEQ "%SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST%" IF /I "TRUE" NEQ "%SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST%" GOTO UPDATE_STATUS_END

@IF /I "TRUE" NEQ "%SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_FIRST%" GOTO UPDATE_COMPILE_STATUS_END
@CALL "%SOLOMON_LIBCMD_DIR%\list.sub.cmd" "%SOLOMON_BUILD_HEAD%" %SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_LIST%
@SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_LIST=%LIBCMD_LIST_SUB%
@IF /I "NG" EQU "%SOLOMON_COMPILE_STATUS%" SET SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_LIST=%SOLOMON_PREVIOUS_COMPILE_FAILED_BUILD_LIST% "%SOLOMON_BUILD_HEAD%"
:UPDATE_COMPILE_STATUS_END

@IF /I "TRUE" NEQ "%SOLOMON_PREVIOUS_TEST_FAILED_BUILD_FIRST%" GOTO UPDATE_TEST_STATUS_END
@CALL "%SOLOMON_LIBCMD_DIR%\list.sub.cmd" "%SOLOMON_BUILD_HEAD%" %SOLOMON_PREVIOUS_TEST_FAILED_BUILD_LIST%
@SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_LIST=%LIBCMD_LIST_SUB%
@IF /I "NG" EQU "%SOLOMON_TEST_STATUS%" SET SOLOMON_PREVIOUS_TEST_FAILED_BUILD_LIST=%SOLOMON_PREVIOUS_TEST_FAILED_BUILD_LIST% "%SOLOMON_BUILD_HEAD%"
:UPDATE_TEST_STATUS_END

@IF /I "TRUE" NEQ "%SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_FIRST%" GOTO UPDATE_COMPILE_WARNED_STATUS_END
@CALL "%SOLOMON_LIBCMD_DIR%\list.sub.cmd" "%SOLOMON_BUILD_HEAD%" %SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_LIST%
@SET SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_LIST=%LIBCMD_LIST_SUB%
@IF /I "" NEQ "%SOLOMON_WARN_STATUS%" SET SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_LIST=%SOLOMON_PREVIOUS_COMPILE_WARNED_BUILD_LIST% "%SOLOMON_BUILD_HEAD%"
:UPDATE_COMPILE_WARNED_STATUS_END

@CALL "%SOLOMON_SUBCMD_DIR%\save.status.cmd"
:UPDATE_STATUS_END

@IF /I "" EQU "%SOLOMON_COMPILE_TOTAL_STATUS%" IF /I "NG" EQU "%SOLOMON_COMPILE_STATUS%" SET SOLOMON_COMPILE_TOTAL_STATUS=%SOLOMON_COMPILE_STATUS%
@IF /I "" EQU "%SOLOMON_TEST_TOTAL_STATUS%" IF /I "NG" EQU "%SOLOMON_TEST_STATUS%" SET SOLOMON_TEST_TOTAL_STATUS=%SOLOMON_TEST_STATUS%
@IF /I "" EQU "%SOLOMON_WARN_TOTAL_STATUS%" IF /I "NG" EQU "%SOLOMON_WARN_STATUS%" SET SOLOMON_WARN_TOTAL_STATUS=%SOLOMON_WARN_STATUS%

@IF /I "TRUE" NEQ "%SOLOMON_IGNORE_COMPILE_NG%" IF /I "NG" EQU "%SOLOMON_COMPILE_STATUS%" GOTO FOR_EACH_BUILD_END

@IF /I "NG" NEQ "%SOLOMON_COMPILE_STATUS%" IF /I "NG" NEQ "%SOLOMON_TEST_STATUS%" ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_BUILD_HEAD% のビルドに成功

@GOTO FOR_EACH_BUILD

:FOR_EACH_BUILD_END
@IF /I "" NEQ "%SOLOMON_COMPILE_TOTAL_STATUS%%SOLOMON_TEST_TOTAL_STATUS%%SOLOMON_WARN_TOTAL_STATUS%" GOTO MAKE_SNAPSHOT

@REM 全buildのコンパイル＆テストに成功

@REM タイトル設定
@TITLE SUCCEEDED - %SOLOMON_TARGET_PROJECT%

@REM 成功イベント処理
%SOLOMON_ALL_SUCCEEDED_EVENT%


@REM
@REM コンパイル＆テストの結果に応じてmasterからスナップショットのコピー
@REM

:MAKE_SNAPSHOT
@IF /I "TRUE" EQU "%SOLOMON_DISABLED_MAKE_SNAPSHOT%" GOTO MAKE_SNAPSHOT_END

@SET LIBCMD_TIMESTAMP=
@IF /I "TRUE" EQU "%SOLOMON_SNAPSHOT_HISTORY%" CALL "%SOLOMON_LIBCMD_DIR%\timestamp.cmd" %SOLOMON_SNAPSHOT_HISTORY_DIR_FORMAT%
@SET SOLOMON_SNAPSHOT_HISTORY_DIR=%LIBCMD_TIMESTAMP%

@IF /I "TRUE" NEQ "%SOLOMON_NO_COMPILE%" IF /I "NG" EQU "%SOLOMON_COMPILE_TOTAL_STATUS%" ECHO %SOLOMON_MESSAGE_PREFIX%スナップショット作成(master to missed.compile)&CALL "%SOLOMON_MAKE_SNAPSHOT_MISSED_COMPILE_CMD%" "%SOLOMON_SNAPSHOT_MASTER_DIR%" "%SOLOMON_SNAPSHOT_MISSED_COMPILE_DIR%"
@IF /I "TRUE" NEQ "%SOLOMON_NO_COMPILE%" IF /I "TRUE" EQU "%SOLOMON_NO_TEST%" IF /I "NG" NEQ "%SOLOMON_COMPILE_TOTAL_STATUS%" ECHO %SOLOMON_MESSAGE_PREFIX%スナップショット作成(master to passed.compile)&CALL "%SOLOMON_MAKE_SNAPSHOT_PASSED_COMPILE_CMD%" "%SOLOMON_SNAPSHOT_MASTER_DIR%" "%SOLOMON_SNAPSHOT_PASSED_COMPILE_DIR%"
@IF /I "TRUE" NEQ "%SOLOMON_NO_TEST%" IF /I "NG" NEQ "%SOLOMON_COMPILE_TOTAL_STATUS%" IF /I "NG" EQU "%SOLOMON_TEST_TOTAL_STATUS%" ECHO %SOLOMON_MESSAGE_PREFIX%スナップショット作成(master to missed.test)&CALL "%SOLOMON_MAKE_SNAPSHOT_MISSED_TEST_CMD%" "%SOLOMON_SNAPSHOT_MASTER_DIR%" "%SOLOMON_SNAPSHOT_MISSED_TEST_DIR%"
@IF /I "TRUE" NEQ "%SOLOMON_NO_TEST%" IF /I "NG" NEQ "%SOLOMON_COMPILE_TOTAL_STATUS%" IF /I "NG" NEQ "%SOLOMON_TEST_TOTAL_STATUS%" ECHO %SOLOMON_MESSAGE_PREFIX%スナップショット作成(master to passed.test)&CALL "%SOLOMON_MAKE_SNAPSHOT_PASSED_TEST_CMD%" "%SOLOMON_SNAPSHOT_MASTER_DIR%" "%SOLOMON_SNAPSHOT_PASSED_TEST_DIR%"
:MAKE_SNAPSHOT_END
@ECHO %SOLOMON_MESSAGE_PREFIX%%SOLOMON_TARGET_PROJECT% ビルド終了(%DATE% %TIME%)


@REM
@REM 自動コンパイル＆テスト
@REM

@REM 自動コンパイル＆テストが有効になっていなければ終了
@IF /I "TRUE" NEQ "%SOLOMON_AUTO_BUILD%" GOTO :EOF

@REM ファイルの更新が確認されるまで待機
@CALL "%SOLOMON_SUBCMD_DIR%\wait.until.update.cmd"

@REM 最初から再実行(各種設定ファイルの変更やこのsolomon自体の修正も考えられる為、)
@GOTO AUTO_BUILD


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO ビルドとテストを行い、その成否状況別のスナップショットを残します。
@ECHO.
@ECHO build[.cmd] [/auto]^|[/-auto] [ビルド...]
@ECHO.
@ECHO  /auto   ソースディレクトリ上のファイルが更新されると自動的にビルドとテストを実行します。(無指定時は設定ファイルで指定された挙動になります。)
@ECHO.
@ECHO  /-auto  自動的なビルドとテストを実行しません。(無指定時は設定ファイルで指定された挙動になります。)
@ECHO.
@ECHO. ビルド  指定されたビルドとテストの実行のみを行います。なお、この指定をした場合はスナップショットは作成されません。(無指定時は設定ファイルで指定された挙動になります。)
@GOTO :EOF
