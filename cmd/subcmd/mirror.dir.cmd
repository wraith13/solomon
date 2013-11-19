@REM
@REM ディレクトリーのミラーコピー
@REM

@RMDIR /S /Q "%~dpnx2" >NUL
@REM ※本来、下のrobocopyコマンドだけでうまくいって欲しいところなのだが、コピー元とコピー先で
@REM 　更新日時、サイズ、属性が同一のファイルが上書きされないという仕様/問題がある為、コピー先を
@REM 　消してしまう。なお、このrobocopyの挙動を回避する為に存在していた /is というオプションは
@REM 　現行のrobocopyでは機能しない模様。

@robocopy "%~dpnx1" "%~dpnx2" /MIR >NUL
