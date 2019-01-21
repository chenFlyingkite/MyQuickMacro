[General]
SyntaxVersion=2
BeginHotkey=115
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=c2527c2c-5705-4ded-be1a-4c311b8aba20
Description=¹s­¹
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

eatSnack 
takePaiyi

'------------------------------
' Screen = 1600 x 900
Function eatSnack()
	'Find Image of snack
	Dim sim, hx, hy, image
	image = sample & "EftArea/snacks.bmp"
	sim = 0.7
	FindPic window_l, window_t, window_r, window_b, image, sim, hx, hy
	'Msgbox "Snack @ " & xy(hx, hy) & " in " & image & ln
	'Move window to good place
	'Eat snack if exist
	If hx >= 0 And hy >= 0 Then 
	    clickAt hx + 70, hy + 40
	    KeyPress "Enter", 1
	    Delay 100
	    KeyPress "Enter", 1
	End If
End Function

'------------------------------
' Screen = 1600 x 900
Function takePaiyi()
	'Find Image of snack
	Dim sim, hx, hy, image, i
	image = sample & "EftArea/paiyi.bmp"
	sim = 0.7
	FindPic window_l, window_t, window_r, window_b, image, sim, hx, hy
	'Msgbox "Pai Yi @ " & xy(hx, hy) & " in " & image & ln
	'Move window to good place
	'Eat snack if exist
	If hx >= 0 And hy >= 0 Then 
	    Dim px, py
	    px = hx + 50
	    py = hy + 40
	    clickAt px, py
	    enterDelay 3, 250
	    KeyPress "Right", 1
	    Delay 250
	    enterDelay 3, 250
	    Delay 1500
	    clickAt px, py
	    enterDelay 5, 250
	End If
End Function