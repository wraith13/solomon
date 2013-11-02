@REM
@REM リリースパッケージの作成
@REM

@REM
@REM 環境変数の初期化
@REM

@SET SOLOMON_DIR=%~dp0cmd\
@SET SOLOMON_RELEASE_DIR=%~dp0release
@SET SOLOMON_LIBCMD_DIR=%SOLOMON_DIR%libcmd
@SET SOLOMON_SUBCMD_DIR=%SOLOMON_DIR%subcmd
@SET SOLOMON_CONFIG_DIR=%SOLOMON_DIR%conf
@SET SOLOMON_CONFIG_CMD=%SOLOMON_CONFIG_DIR%\config.cmd
@SET SOLOMON_CONFIG_LOCALHOST_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.cmd
@SET SOLOMON_CONFIG_LOCALHOST_USER_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.%USERNAME%.cmd

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
@REM 出力先ディレクトリの作成
@REM

@IF NOT EXIST "%SOLOMON_RELEASE_DIR%" MKDIR "%SOLOMON_RELEASE_DIR%"


@REM
@REM 出力先パスの作成
@REM

@CALL "%SOLOMON_LIBCMD_DIR%\timestamp.cmd" YYYYMMDDhhmmss
@SET SOLOMON_RELEASE_ZIP=%SOLOMON_RELEASE_DIR%\solomon-%LIBCMD_TIMESTAMP%.zip


@REM
@REM サンプルプロジェクト内のスナップショット削除
@REM

@RMDIR /S /Q "%~dp0sample\prime.factor.project\snapshot"
@RMDIR /S /Q "%~dp0sample\prime.factor.project\testsnap"


@REM
@REM パッケージ作成
@REM

@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0LICENSE_1_0.txt" >NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0readme.txt" >NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0history.txt" >NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0cmd" >NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%SOLOMON_RELEASE_ZIP%" "%~dp0sample" >NUL

@ECHO リリース用パッケージ %SOLOMON_RELEASE_ZIP% を作成しました。
@ECHO.
@ECHO 含まれるべきファイルが含まれていることと含まれるべきでないファイルが含まれていないことをディレクトリ差分比較ツールでチェックした上で、 readme.txt に記載されているバージョン番号の採番ルールにしたがってリネームしてください。
@ECHO.
@ECHO history.txt を編集し忘れている場合は正しく編集した上でこのコマンドを再度実行してリリース用パッケージを作成し直してください。
