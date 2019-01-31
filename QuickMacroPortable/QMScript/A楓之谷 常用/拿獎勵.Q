[General]
SyntaxVersion=2
BeginHotkey=97
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=67484383-7f98-4b74-a727-9ed21e5a873a
Description=®³¼úÀy53
Enable=1
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

[Script]
Option Explicit
Dim nb
nb = PlugIn.File.IsFileExit("D:/vbs/nb")
If nb Then
    Import "D:\vbs\lib\nbPos.vbs"
Else
    Import "D:\vbs\lib\pcPos.vbs"
End If
Import "D:\vbs\lib\myVB.vbs"
Import "D:\vbs\lib\petriDish.vbs"
Import "D:\vbs\lib\Rect.vbs"

' Web
' http://www.tosgame.com/campaign/53
Dim x0, y0, x1
' 1st at (sx, sy)
x0 = 170
y0 = 15
x1 = 290
// ID1, tab, login, accept, return
clickAt x0, y0
clickAt 790, 475
Delay 3000
clickAt 780, 780 ' Prize
Delay 1000
clickAt 680, 690 'OK
clickAt 22, 50

// ID1, tab, login, accept, return
clickAt x1, y0
clickAt 790, 475
Delay 3000
clickAt 780, 780 ' Prize
Delay 1000
clickAt 680, 690 'OK
clickAt 22, 50 ' back

