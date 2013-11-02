@REM
@REM build
@REM


@REM solomon は最初に %SOLOMON_TARGET_DIR% を %SOLOMON_SNAPSHOT_MASTER_DIR% にコピーします。
@REM 各コンパイル＆テストを実行する際に毎回 %SOLOMON_SNAPSHOT_MASTER_DIR% を %SOLOMON_TESTSHOT_DIR% にコピーし、
@REM カレントディレクトリも %SOLOMON_TESTSHOT_DIR% にセットした状態でこのcmdを呼び出します。
@REM
@REM %SOLOMON_TESTSHOT_DIR% はコンパイル＆テストを行うテンポラリーなディレクトリという位置づけなので
@REM このcmdを実行中に生成されたファイルで必要なものは適宜他のディレクトリへコピーしてください。
@REM ( 複数のビルドが実行される場合、次のビルドを実行する為に即初期化されます。 )


@REM
@REM コンパイル
@REM

★ここでコンパイルを実行する処理を記述してください。

★ここでコンパイルが成功したか判断する処理を記述してください。
@IF ★成功していたら★ (CALL "%SOLOMON_COMPILE_SUCCESS_CMD%") ELSE CALL "%SOLOMON_COMPILE_FAILED_CMD%" ★エラーメッセージが格納されたファイル(省略可)★ & GOTO :EOF

★ここでコンパイル時に警告が出ていなかったか判断する処理を記述してください。
@IF ★警告が出ていたら★ CALL "%SOLOMON_COMPILE_WARNED_CMD%" ★警告メッセージが格納されたファイル(省略可)★

★[必要に応じて]ここでコンパイル結果をtestshotからコピーする処理を記述してください。


@REM
@REM テスト
@REM

★ここでテストを実行する処理を記述してください。

★[必要に応じて]ここでテスト結果をtestshotからコピーする処理を記述してください。

★ここでテストが成功したか判断する処理を記述してください。
@IF ★成功していたら★ (CALL "%SOLOMON_TEST_SUCCESS_CMD%") ELSE CALL "%SOLOMON_TEST_FAILED_CMD%" ★テストメッセージが格納されたファイル(省略可)★ & GOTO :EOF

