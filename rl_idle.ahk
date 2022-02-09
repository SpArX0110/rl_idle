1.1
version := 1.1

#SingleInstance force  

#Persistent
Menu, Tray, Tip , F1: start script`nF2: stop script`nF3: close script

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 1

URLDownloadToFile, https://raw.githubusercontent.com/SpArX0110/rl_idle/main/rl_idle.ahk, update.txt
FileReadLine, update, update.txt, 1
FileDelete, update.bat

if (update <= version ) {
  FileDelete, update.txt
  return
ExitApp
  return
} else {
	FileDelete, update.txt
 Gui, Add, Text, vtext, NEW UPDATE FOUND!`nDo you want to update?
 Gui, Add, Button, h21 w60 gYes, YES    
 Gui, Add, Button, xp+65 h21 w60 gNo, No
gui, show
return
}

Yes:
{
gui, destroy
file_exists := 0
FileDelete, version.txt
FileDelete, update.txt
FileDelete, rl_idle.exe
FileAppend,
(
taskkill rl_idle.exe
del rl_idle.exe
curl -LJO https://github.com/SpArX0110/rl_idle/releases/download/rl_idle/rl_idle.exe
start rl_idle.exe
EXIT /B
), update.bat
run update
ExitApp
return
}

No:
Gui destroy
return

SetKeyDelay, 100, 100
SetTitleMatchMode, 1

F1::
Loop{	
if not WinExist("Rocket League")
{
	MsgBox, Rocket League is not running!
    Reload
}
	
ControlSend, ahk_parent, x, Rocket League
Sleep, 1000
}

F2::
Reload

F3::
ExitApp