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
MacroID=3b01efc3-98b9-440a-b6ca-df2b6cf567ba
Description=�C���k��
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
Import "D:\vbs\lib\mouse.vbs"

'------------------------------
' Screen = 1600 x 900
Dim sim, hx, hy, image
image = sample & "MapleStory.bmp"
sim = 0.9
FindPic 0, 0, 1600, 900, image, sim, hx, hy
'Find unfocused image 
If hx <= 0 Or hy <= 0 Then 
	image = sample & "MapleStory2.bmp"
    FindPic 0, 0, 1600, 900, image, sim, hx, hy
End If
'Move window to good place

'Msgbox "MapleStory @ " & xy(hx, hy) & " in " & image & ln
If hx >= 0 And hy >= 0 Then 
    mouseDrag hx, hy, 230, 2
End If