[General]
SyntaxVersion=2
BeginHotkey=81
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=1a1e8fa7-0cad-44db-8191-7e79c793331b
Description=²Õ¶¤OK
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
'Import "D:\vbs\lib\mouse.vbs"

'clickAt 993, 676
clickOK

Sub clickOK
	'Find Image of snack
	Dim sim, hx, hy, image
	image = sample & "o.bmp"
	sim = 0.2
	FindPic 980, 665, 1000, 710, image, sim, hx, hy
	'Msgbox "OK @ " & xy(hx, hy) & " in " & image & ln
	If hx >= 0 And hy >= 0 Then 
		clickAt hx + 5, hy + 5
	End If	
End Sub
