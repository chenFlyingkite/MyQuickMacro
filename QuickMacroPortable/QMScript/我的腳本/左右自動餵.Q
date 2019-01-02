[General]
SyntaxVersion=2
BeginHotkey=122
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=fd7646ba-2781-47e6-9206-c54fb72b6414
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
FindPic 0,0,1600,900,"C:\Users\Flyingkite\Pictures\楓之谷\培養皿\bmp\愛心01.bmp",0.7,heartX,heartY
If heartX > 0 And heartY > 0 Then 
ElseIf heartX > 100 And heartY > 100 Then
End If
FindPic 0,0,1600,900,"C:\Users\Flyingkite\Pictures\楓之谷\培養皿\bmp\愛心02.bmp",0.7,heartX,heartY
If heartX> 0 And heartY> 0 Then
End If
FindPic 0,0,1600,900,"C:\Users\Flyingkite\Pictures\楓之谷\培養皿\bmp\睡覺01.bmp",0.7,sleepX,sleepY
If sleepX> 0 And sleepY> 0 Then
End If
FindPic 0,0,1600,900,"C:\Users\Flyingkite\Pictures\楓之谷\培養皿\bmp\生病02.bmp",0.9,sickX,sickY
If sickX> 0 And sickY> 0 Then
End If
