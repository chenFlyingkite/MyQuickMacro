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
MacroID=4c568b27-9ef7-4478-a461-c04c7846f279
Description=神魔直播自動領獎
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[Script]
'Import "D:\\vbs\mouse.vbs"
' SVN
Import "D:/Github/MyQuickMacro/vbs/lib/mouse.vbs"
' Copy path
'Import "D:/vbs/lib/mouse.vbs"

'- Define constants
// SW = Screen Width, SH = Screen Height
Const SW = 1920
Const SH = 1080

While true
    'image size = 45 x 24
    Dim iw, ih
    iw = 45
    ih = 24
    
    ' Find pic in all screen, click at center if exists
    ' "D:/vbs/bmp/tos/got.bmp"
    FindPic 0, 0, SW, SH, image("tos/got.bmp"), 0.7, hx, hy
    'lg "got @ (" & hx & ", " & hy & ")"    
    'MsgBox "got @ (" & hx & ", " & hy & ")"
    If hx >= 0 AND hy >= 0 Then 
        clickAt hx + iw / 2, hy + ih / 2
    End If
    
    Delay 5000 

    ' Find pic, click at center if exists
    ' "D:/vbs/bmp/tos/close.bmp"
    FindPic 0, 0, SW, SH, image("tos/close.bmp"), 0.7, hx, hy
    'lg "close @(" & hx & ", " & hy & ")"
    'MsgBox "close @(" & hx & ", " & hy & ")"
    If hx >= 0 AND hy >= 0 Then 
        clickAt hx + iw / 2, hy + ih / 2
    End If
    
    ' Delay
    Delay 5000
        
Wend

'--- Show screen size
Sub screen
    Dim sw, sh
    sw = Plugin.GetSysInfo.GetScreenResolutionX 
    sh = Plugin.GetSysInfo.GetScreenResolutionY
    MsgBox "Screen = " & sw & " x " & sh
End Sub

