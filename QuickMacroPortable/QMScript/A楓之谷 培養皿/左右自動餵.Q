[General]
MacroID=4c0c69e7-1a2d-487b-aca6-2ae1be98edda
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
Description=左右自動餵
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]
【功能說明】
拿東西給左邊餵一次
過一段時間再餵右邊

【使用說明】
<說明您的腳本應該怎麼去用>
舉例：按熱鍵一下，即可模擬點擊滑鼠左鍵一次。

[Script]
For 60
// Moon to left
MoveTo 360, 490
LeftClick 1
Delay 200
MoveTo 1280, 580
LeftClick 1
Delay 1000
// Sun to right
MoveTo 360, 530
LeftClick 1
Delay 200
MoveTo 1520, 580
LeftClick 1
Delay 600000
Next
