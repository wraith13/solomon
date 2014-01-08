@REM
@REM ディレクトリーのミラーコピー
@REM

@REM ※本来、このcmd内でのリトライは不要だが扱っている対象がアンチウィルスソフトに目を付けられやすい
@REM 　プログラムのファイルであることからか環境によってはディレクトリの削除もコピーも無駄にけっこう
@REM 　高い頻度で失敗することがある為、失敗したことがわかった場合は自動的にリトライを行う。

@SETLOCAL

@SET SOLOMON_REMOVE_DIR_TRY_COUNT=0
:RMDIR
@SET /A SOLOMON_REMOVE_DIR_TRY_COUNT=%SOLOMON_REMOVE_DIR_TRY_COUNT%+1
@RMDIR /S /Q "%~dpnx2" >NUL 2>NUL
@IF exist "%~dpnx2" ECHO %SOLOMON_MESSAGE_PREFIX%[error] "%~dpnx2"ディレクトリーを削除できませんでした。&@CALL "%SOLOMON_LIBCMD_DIR%\sleep.cmd" 1000&ECHO %SOLOMON_MESSAGE_PREFIX%[retry] "%~dpnx2"の削除をリトライします。(%SOLOMON_REMOVE_DIR_TRY_COUNT%回目)&GOTO RMDIR
@IF /I "1" NEQ "%SOLOMON_REMOVE_DIR_TRY_COUNT%" ECHO %SOLOMON_MESSAGE_PREFIX%[recovered] "%~dpnx2"ディレクトリーを削除できました。

@REM ※本来、下のrobocopyコマンドだけでうまくいって欲しいところなのだが、コピー元とコピー先で
@REM 　更新日時、サイズ、属性が同一のファイルが上書きされないという仕様/問題がある為、コピー前に
@REM 　コピー先を消してしまう。なお、このrobocopyの挙動を回避する為に存在していた /is という
@REM 　オプションは現行のrobocopyでは機能しない模様。
@REM 　
@REM 　また、コピー先を予め削除しておかないとミラー(robocopy)の失敗時にいくらリトライを
@REM 　繰り返しても成功しないケースがあり、この観点からも事前にコピー先を削除しておく必要
@REM 　がある。加えて、コピー先を正常に削除できている場合にミラーに失敗する例はいまの所は
@REM 　観測されていない。

@SET SOLOMON_MIRROR_DIR_TRY_COUNT=0
:ROBOCOPY
@SET /A SOLOMON_MIRROR_DIR_TRY_COUNT=%SOLOMON_MIRROR_DIR_TRY_COUNT%+1
@robocopy "%~dpnx1" "%~dpnx2" /MIR >NUL
@IF /I "1" NEQ "%ERRORLEVEL%" ECHO %SOLOMON_MESSAGE_PREFIX%[error] "%~dpnx1"から"%~dpnx2"へ、ミラーできませんでした。&@CALL "%SOLOMON_LIBCMD_DIR%\sleep.cmd" 1000&ECHO %SOLOMON_MESSAGE_PREFIX%[retry] "%~dpnx1"から"%~dpnx2"へのミラーをリトライします。(%SOLOMON_MIRROR_DIR_TRY_COUNT%回目)&GOTO ROBOCOPY
@IF /I "1" NEQ "%SOLOMON_MIRROR_DIR_TRY_COUNT%" ECHO %SOLOMON_MESSAGE_PREFIX%[recovered] "%~dpnx1"から"%~dpnx2"へ、ミラーできました。

@ENDLOCAL
