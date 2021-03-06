@REM
@REM 履歴作成
@REM


@REM ■概要
@REM このコマンドはエクスプローラーの[送る]メニューに登録して利用することを前提としています。
@REM このコマンドはこのコマンドに送られたディレクトリやファイルを履歴ディレクトリ(.\.hisotry)に
@REM 日時別のコピーを作成します。
@REM
@REM ■登録方法
@REM [田ﾐ]キーを押下後、 shell:sendto とタイプし[Enter]キーを押下すると SendTo フォルダが表示
@REM されるので、そこにこのファイルのショートカットを作成します。(名前やアイコンは自分の好み
@REM で設定してください。)
@REM 
@REM ■設定
@REM コード中の[設定]と書かれてるブロックをコピペして ..\config\make.history.config.cmd というファイル
@REM として保存し、そこで設定を行ってください。


@SETLOCAL

@REM
@REM オプションの処理
@REM

@IF /I "/?" EQU "%1" GOTO SHOW_HELP
@IF /I "" EQU "%~dpnx1" GOTO SHOW_HELP


@REM
@REM 環境変数の初期化
@REM

@SET SOLOMON_DIR=%~dp0..\
@SET SOLOMON_LIBCMD_DIR=%SOLOMON_DIR%libcmd
@SET SOLOMON_SUBCMD_DIR=%SOLOMON_DIR%subcmd
@SET SOLOMON_CONFIG_DIR=%SOLOMON_DIR%conf
@SET SOLOMON_CONFIG_CMD=%SOLOMON_CONFIG_DIR%\config.cmd
@SET SOLOMON_CONFIG_LOCALHOST_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.cmd
@SET SOLOMON_CONFIG_LOCALHOST_USER_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.%USERNAME%.cmd
@SET SOLOMON_MAKE_HISTORY_CONFIG_CMD=%SOLOMON_CONFIG_DIR%\%~n0.config.cmd
@SET SOLOMON_MAKE_HISTORY_CONFIG_LOCALHOST_CMD=%SOLOMON_CONFIG_DIR%\%~n0.config.%COMPUTERNAME%.cmd
@SET SOLOMON_MAKE_HISTORY_CONFIG_LOCALHOST_USER_CMD=%SOLOMON_CONFIG_DIR%\%~n0.config.%COMPUTERNAME%.%USERNAME%.cmd
@SET SOLOMON_MAKE_HISTORY_ZIP_TMP=
@SET SOLOMON_MAKE_HISTORY_OPEN_PATH=

@REM
@REM SOLOMON共通設定ファイルの読み込み
@REM

@REM solomon\conf\config.cmd の読み込み
@IF NOT EXIST "%SOLOMON_CONFIG_CMD%" COLOR 0C&ECHO CONFIG-ERROR: 設定ファイル "%SOLOMON_CONFIG_CMD%" が存在しません。&GOTO :EOF
@CALL "%SOLOMON_CONFIG_CMD%"

@REM solomon\conf\config.%COMPUTERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_CONFIG_LOCALHOST_CMD%" CALL "%SOLOMON_CONFIG_LOCALHOST_CMD%"

@REM solomon\conf\config.%COMPUTERNAME%.%USERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_CONFIG_LOCALHOST_USER_CMD%" CALL "%SOLOMON_CONFIG_LOCALHOST_USER_CMD%"


@REM
@REM 設定
@REM

@REM 7-zip があってもZIPにしない指定
@SET SOLOMON_MAKE_HISTORY_DISABLED_ZIP=FALSE

@REM 履歴ディレクトリ
@SET SOLOMON_MAKE_HISTORY_DIR=.history
@REM ※この名前と同一のディレクトリおよびファイルの履歴は作成されません。
@REM 
@REM 　履歴ディレクトリのさらに履歴を作ることはディスクスペースの無駄でしかなく、一方でエクスプローラー上での
@REM 　操作で複数のファイルやディレクトリの履歴を一度に作成しようとした場合に履歴ディレクトリを含まないようにするの
@REM 　はちょっとだけ面倒なのに加え意図せずうっかりで含めてしまうことも考えられ、この名前が含まれるパスの履歴作成
@REM 　はデメリットばかりであるとの設計判断によるものです。
@REM 
@REM 　ただし、直接指定されたパスの名前のみしかチェックしない為、履歴ディレクトリの親ディレクトリや子ディレクトリ
@REM 　が指定された場合には除外されずそのまま履歴が作成されます。

@REM 履歴ディレクトリアイコンを保持するファイル
@SET SOLOMON_MAKE_HISTORY_DIR_ICON_FILE=C:\Windows\system32\SHELL32.dll

@REM 履歴ディレクトリアイコンを保持するファイル
@SET SOLOMON_MAKE_HISTORY_DIR_ICON_INDEX=20

@REM 履歴パス
@SET SOLOMON_MAKE_HISTORY_DESTINATION_FORMAT=\YYYY\MM\DD\hhmmss

@REM 最終ディレクトリへのショートカットファイルの名前
@REM SET SOLOMON_SNAPSHOT_HISTORY_SHORTCUT_NAME=最終日


@REM
@REM make.history 設定ファイルの読み込み
@REM

@REM solomon\conf\make.history.config.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_MAKE_HISTORY_CONFIG_CMD%" CALL "%SOLOMON_MAKE_HISTORY_CONFIG_CMD%"

@REM solomon\conf\make.history.config.%COMPUTERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_MAKE_HISTORY_CONFIG_LOCALHOST_CMD%" CALL "%SOLOMON_MAKE_HISTORY_CONFIG_LOCALHOST_CMD%"

@REM solomon\conf\make.history.config.%COMPUTERNAME%.%USERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_MAKE_HISTORY_CONFIG_LOCALHOST_USER_CMD%" CALL "%SOLOMON_MAKE_HISTORY_CONFIG_LOCALHOST_USER_CMD%"


@REM
@REM body
@REM

@REM ZIPにするかただのコピーにするか判定
@IF EXIST "%SOLOMON_7ZIP_EXE%" IF /I "%SOLOMON_MAKE_HISTORY_DISABLED_ZIP%" NEQ "TRUE" SET SOLOMON_MAKE_HISTORY_USE_ZIP=TRUE

@REM タイムスタンプ部分のパスを作成
@CALL "%SOLOMON_LIBCMD_DIR%\timestamp.cmd" %SOLOMON_MAKE_HISTORY_DESTINATION_FORMAT%
@SET SOLOMON_MAKE_HISTORY_DESTINATION_FORMAT_INSTANCE=%LIBCMD_TIMESTAMP%

:LOOP

@REM 履歴ディレクトリ自身の場合はスキップ
@IF /I "%~nx1" EQU "%SOLOMON_MAKE_HISTORY_DIR%" GOTO SKIP

@REM ファイルかディレクトリか判定
@SET SOLOMON_MAKE_HISTORY_IS_DIR_TARGET=FALSE
@SET SOLOMON_MAKE_HISTORY_TARGET_ATTRIB=%~a1
@IF /I "%SOLOMON_MAKE_HISTORY_TARGET_ATTRIB:~0,1%" EQU "d" SET SOLOMON_MAKE_HISTORY_IS_DIR_TARGET=TRUE

@REM 履歴ディレクトリの作成
@SET SOLOMON_MAKE_HISTORY_DESTINATION_ROOT_PATH=%~1\..\%SOLOMON_MAKE_HISTORY_DIR%
@IF NOT EXIST "%SOLOMON_MAKE_HISTORY_DESTINATION_ROOT_PATH%" MKDIR "%SOLOMON_MAKE_HISTORY_DESTINATION_ROOT_PATH%"&CALL "%SOLOMON_LIBCMD_DIR%\set.folder.icon.cmd" "%SOLOMON_MAKE_HISTORY_DESTINATION_ROOT_PATH%" "%SOLOMON_MAKE_HISTORY_DIR_ICON_FILE%" %SOLOMON_MAKE_HISTORY_DIR_ICON_INDEX%

@REM 出力先親ディレクトリの作成
@SET SOLOMON_MAKE_HISTORY_DESTINATION_PATH=%SOLOMON_MAKE_HISTORY_DESTINATION_ROOT_PATH%%SOLOMON_MAKE_HISTORY_DESTINATION_FORMAT_INSTANCE%
@CALL "%SOLOMON_LIBCMD_DIR%\regulate.path.cmd" "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%"
@SET SOLOMON_MAKE_HISTORY_DESTINATION_PATH=%LIBCMD_REGULATE_PATH%

@CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH\.."

@REM 出力先パスの作成
@IF /I "TRUE" NEQ "%SOLOMON_MAKE_HISTORY_USE_ZIP%" MKDIR "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%"

@REM 履歴作成
@IF /I "TRUE" EQU "%SOLOMON_MAKE_HISTORY_IS_DIR_TARGET%" IF /I "TRUE" EQU "%SOLOMON_MAKE_HISTORY_USE_ZIP%" ECHO %1 を "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%.zip" にコピー&CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%.zip.tmp" "%~dpnx1"
@IF /I "TRUE" NEQ "%SOLOMON_MAKE_HISTORY_IS_DIR_TARGET%" IF /I "TRUE" EQU "%SOLOMON_MAKE_HISTORY_USE_ZIP%" ECHO %1 を "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%.zip" にコピー&CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%.zip.tmp" "%~dpnx1"
@IF /I "TRUE" EQU "%SOLOMON_MAKE_HISTORY_IS_DIR_TARGET%" IF /I "TRUE" NEQ "%SOLOMON_MAKE_HISTORY_USE_ZIP%" ECHO %1 を "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%" にコピー&CALL robocopy "%~dpnx1" "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%\%~nx1" /MIR
@IF /I "TRUE" NEQ "%SOLOMON_MAKE_HISTORY_IS_DIR_TARGET%" IF /I "TRUE" NEQ "%SOLOMON_MAKE_HISTORY_USE_ZIP%" ECHO %1 を "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%" にコピー&CALL copy "%~dpnx1" "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%\%~nx1"

@REM explorerやアンチウィルスからの邪魔を防ぐ為に拡張子を .zip.tmp にしているパスの記録
@CALL "%SOLOMON_LIBCMD_DIR%\find.cmd" "%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%" %SOLOMON_MAKE_HISTORY_ZIP_TMP%
@IF /I "-1" NEQ "%LIBCMD_FIND_INDEX%" GOTO SKIP &REM ここでマッチするようなら「最終日ディレクトリ」関連も処理済みのパスなのでまとめてスキップ
@IF /I "TRUE" EQU "%SOLOMON_MAKE_HISTORY_USE_ZIP%" SET SOLOMON_MAKE_HISTORY_ZIP_TMP="%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%" %SOLOMON_MAKE_HISTORY_ZIP_TMP%

@REM 最終日ディレクトリへのショートカットファイル作成
@SET SOLOMON_MAKE_HISTORY_SHORTCUT_FILE_PATH=%SOLOMON_MAKE_HISTORY_DESTINATION_ROOT_PATH%\%SOLOMON_SNAPSHOT_HISTORY_SHORTCUT_NAME%.lnk
@SET SOLOMON_MAKE_HISTORY_SHORTCUT_TARGET_PATH=%SOLOMON_MAKE_HISTORY_DESTINATION_PATH%\..\
@DEL %SOLOMON_MAKE_HISTORY_SHORTCUT_FILE_PATH% >NUL 2>NUL
@CALL "%SOLOMON_LIBCMD_DIR%\make.lnk.cmd" "%SOLOMON_MAKE_HISTORY_SHORTCUT_TARGET_PATH%" "%SOLOMON_MAKE_HISTORY_SHORTCUT_FILE_PATH%"

@REM 後でまとめて最終日ディレクトリをexplorerで開く為にパスを記録
@CALL "%SOLOMON_LIBCMD_DIR%\regulate.path.cmd" "%SOLOMON_MAKE_HISTORY_SHORTCUT_TARGET_PATH%"
@CALL "%SOLOMON_LIBCMD_DIR%\find.cmd" "%LIBCMD_REGULATE_PATH%" %SOLOMON_MAKE_HISTORY_OPEN_PATH%
@IF /I "-1" NEQ "%LIBCMD_FIND_INDEX%" GOTO SKIP
@SET SOLOMON_MAKE_HISTORY_OPEN_PATH="%LIBCMD_REGULATE_PATH%" %SOLOMON_MAKE_HISTORY_OPEN_PATH%

:SKIP

@REM ２つ目以降の引数があれば繰り返してすべて処理する。
@IF /I "" NEQ "%~dpnx2" SHIFT&GOTO LOOP

@REM explorerやアンチウィルスからの邪魔を防ぐ為に .zip.tmp にしている拡張子を .zip にする。
@SET LIBCMD_HEADTAIL_TAIL=%SOLOMON_MAKE_HISTORY_ZIP_TMP%
:RENAME_ZIP_LOOP
@CALL "%SOLOMON_LIBCMD_DIR%\headtail.cmd" %LIBCMD_HEADTAIL_TAIL%
@IF /I "" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO RENAME_ZIP_LOOP_END
@CALL "%SOLOMON_LIBCMD_DIR%\regulate.path.nx.cmd" "%LIBCMD_HEADTAIL_HEAD%.zip"
@RENAME "%LIBCMD_HEADTAIL_HEAD%.zip.tmp" "%LIBCMD_REGULATE_PATH_NX%"
@GOTO RENAME_ZIP_LOOP
:RENAME_ZIP_LOOP_END

@REM 最終日ディレクトリをexplorerで開く
@SET LIBCMD_HEADTAIL_TAIL=%SOLOMON_MAKE_HISTORY_OPEN_PATH%
:OPEN_FOLDERS_LOOP
@CALL "%SOLOMON_LIBCMD_DIR%\headtail.cmd" %LIBCMD_HEADTAIL_TAIL%
@IF /I "" EQU "%LIBCMD_HEADTAIL_HEAD%" GOTO :EOF
@CALL explorer "%LIBCMD_HEADTAIL_HEAD%"
@GOTO OPEN_FOLDERS_LOOP


@REM
@REM ヘルプ表示
@REM

:SHOW_HELP
@ECHO ディレクトリやファイルを履歴ディレクトリにコピーします。
@ECHO.
@ECHO %~n0[%~x0] 履歴ディレクトリにコピーするディレクトリやファイル...
@ECHO.
@ECHO 詳細はこの %~nx0 内のコメントを参照してください。
@GOTO :EOF
