[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=f1ca1105-298d-4aff-beba-1c51b4ca1770
Description=寵物說話
Enable=1
AutoRun=0
[Repeat]
Type=1
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]
【功能說明】
說
趴下
說吧
^說
^趴下
【使用說明】
<說明您的腳本應該怎麼去用>
舉例：按熱鍵一下，即可模擬點擊滑鼠左鍵一次。

[Script]
KeyPress "Down", 1
KeyPress "Enter", 1
Delay 3000
/*
SayString "說"
KeyPress "Enter", 1
Delay 2000
SayString "趴下"
KeyPress "Enter", 1
Delay 2000
SayString "說吧"
KeyPress "Enter", 1
Delay 2000
*/
