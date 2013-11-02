var shell = WScript.CreateObject("WScript.Shell");
var link = shell.CreateShortcut(WScript.Arguments(1));
link.TargetPath = WScript.Arguments(0);
link.WorkingDirectory = ".";
link.Save();
