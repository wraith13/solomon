//	ゼロサプレスツール
function NNN(src) {
  return ("000" +src).slice(-3)
}
function NN(src) {
  return ("00" +src).slice(-2)
}

//	現在日時の取得
var now = new Date();
var year = now.getYear();
if (year < 2000) {
    year += 1900;
}
var month = now.getMonth() + 1;
var day = now.getDate();
var hour = now.getHours();
var min = now.getMinutes();
var sec = now.getSeconds();
var milli_sec = now.getMilliseconds();
var ticks = now.getTime();

//	指定された書式で出力
WScript.Echo(
	WScript.Arguments(0)
	.replace(/ticks/, ticks)
	.replace(/YYYY/, year)
	.replace(/mmm/, NNN(milli_sec))
	.replace(/MM/, NN(month))
	.replace(/DD/, NN(day))
	.replace(/hh/, NN(hour))
	.replace(/mm/, NN(min))
	.replace(/ss/, NN(sec))
	.replace(/M/, month)
	.replace(/D/, day)
	.replace(/h/, hour)
	.replace(/m/, min)
	.replace(/s/, sec));
