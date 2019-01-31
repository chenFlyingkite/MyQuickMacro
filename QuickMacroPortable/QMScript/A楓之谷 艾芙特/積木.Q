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
MacroID=c07b7bed-fbf7-42e4-8a53-76906b793e49
Description=ฟnค์
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

pokeLego 
Delay 1000
takePaiyi

'------------------------------
' Screen = 1600 x 900
Function pokeLego()
	'Find Image of Lego
	Dim sim, hx, hy, image
	image = sample & "EftArea/blocks.bmp"
	sim = 0.7
	FindPic window_l, window_t, window_r, window_b, image, sim, hx, hy
	'Msgbox "Block @ " & xy(hx, hy) & " in " & image & ln
	'Poke Lego if exist
	If hx >= 0 And hy >= 0 Then 
	    clickAt hx + 40, hy + 40
	    Delay 200
	    enterDelay 2, 250
	End If
End Function

'------------------------------
' Screen = 1600 x 900
Function takePaiyi()
	'Find Image of snack
	Dim sim, hx, hy, image, i
	image = sample & "EftArea/paiyi.bmp"
	sim = 0.8
	FindPic window_l, window_t, window_r, window_b, image, sim, hx, hy
	'Msgbox "Pai Yi @ " & xy(hx, hy) & " in " & image & ln
	'Resolve Pai Yi
	If hx >= 0 And hy >= 0 Then 
	    Dim px, py
	    px = hx + 50
	    py = hy + 40
	    clickAt px, py
	    Delay 200
	    enterDelay 3, 250
	    KeyPress "Right", 1
	    Delay 200
	    enterDelay 2, 250
	    Delay 1200
	    clickAt px, py
	    Delay 100
	    enterDelay 5, 250
	End If
End Function