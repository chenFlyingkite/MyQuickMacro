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
MacroID=c990a48a-7158-43e9-a405-596e34b1677f
Description=Main
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

[Script]
Import "D:\vbs\lib\myVB.vbs"
Import "D:\vbs\lib\Rect.vbs"
Import "D:\vbs\lib\petriDish.vbs"

//Option Explicit

'-------- parameters
Dim ln
ln = vbLf //"New line"
'-------- 

//UserVar picSim = 0.8 "圖片相似度"
//---------
//isLove = False
//isSick = False
//isHeart = False
//------ Main
//For times
//    feedAt(plantAt)
//    Delay 1000
//Next
//Call feedAt(2)
//Call feedMore(2, 3)
'SayString "Time GO = "& DateTime.UtcNow.TotalMilliseconds & ln

Dim anx(10, 2)
Dim sims(10)
Dim i, j, picSim

For i = 0 To UBound(sims)-1
	sims(i) = 0.7 + 0.01 * i
	anx(i, 0) = 0
	anx(i, 1) = 0
Next

For j = 0 to UBound(sims)-1
	picSim = sims(j)
	//picSim = 0.74
	SayString "J = " & j & ", sim = " & picSim & ln
	For i = 0 To 2
		'lv = isLove(i)
		'sl = isSleep(i) 
		SayString "#" & i & ", isLove  = " & ox(isLove(i)) & ln
		SayString "#" & i & ", isSleep = " & ox(isSleep(i)) & ln
		'SayString "#" & i & ", isLove = " & isLove(i)
		'SayString "--------" & ans ln
		'If (lv <> True) Then 
		'	anx(j, 0) = anx(j, 0) + 1
		'End If
		'If (sl <> True) Then 
		'	anx(j, 1) = anx(j, 1) + 1
		'End If
		'SayString "-------- " & anx(j, 0) & " -- " & anx(j, 1) & ln
	Next
	SayString "==========" & ln
Next

'------ End Main

Function isLove(x) 'As Boolean
	Dim images
	images = Array(_
	  sample & "heart01.bmp" _
	, sample & "heart02.bmp" _
	)
	isLove = hasImages(x, picSim, images)
End Function

Function isSleep(x) 'As Boolean
	Dim images
	images = Array(_
	  sample & "sleep01.bmp" _
	, sample & "sleep02.bmp" _
	)
	isSleep = hasImages(x, picSim, images)
End Function

/*
// x = 0, 1, 2
Function isLove2(x)
    dx = cup_dx
	fx = cup_lx + x * dx
	fy = cup_ly
	gx = fx + dx
	gy = cup_ry
	SayString "Find (" & fx & ", " & fy & ") - (" & gx & ", " & gy & ")" & ln
	//SayString "fx = " & fx & ", fy = " & fy & ln
	//SayString "gx = " & gx & ", gy = " & gy & ln & ln
	
	FindPic fx, fy, gx, gy, "D:\vbs\petriDish\heart01.bmp", picSim, hx, hy
	SayString "L : hx = " & hx & ", hy = " & hy & ln
	
	FindPic fx, fy, gx, gy, "D:\vbs\petriDish\heart02.bmp", picSim, kx, ky
	SayString "L : kx = " & kx & ", ky = " & ky & ln
	
	ans = isInRect(hx, hy, fx, fy, gx, gy) or isInRect(kx, ky, fx, fy, gx, gy)
	isLove2 = ox(ans)
End Function

// zzzzzzzzzz
// x = 0, 1, 2
Function isSleep2(x)
	dx = 130
	fx = 1200
	fy = 520
	gx = fx + x * dx
	gy = 680
	
	FindPic fx, fy, gx, gy, "D:\vbs\bmp\睡覺01.bmp", picSim, hX, hY
	SayString "Z : hx = " & hx & ", hy = " & hy & ln
	isSleep2 = ox(isInRect(hx, hy, fx, fy, gx, gy))
End Function

// x = 0, 1, 2
// sim = image similarity, .1 ~ 0.99
// images = paths array
Function hasImages(x, sim, images)
    w = cup_dx
	fx = cup_lx + x * w
	fy = cup_ly
	gx = fx + w
	gy = cup_ry
	SayString "Find (" & fx & ", " & fy & ") ~ (" _
	          & gx & ", " & gy & ")" & ln
	//SayString "fx = " & fx & ", fy = " & fy & ln
	//SayString "gx = " & gx & ", gy = " & gy & ln & ln
	ans = false
	For Each image In images
		FindPic fx, fy, gx, gy, image, sim, hx, hy
		//FindPic fx, fy, gx, gy, "D:\vbs\petriDish\heart01.bmp", picSim, hx, hy
		SayString "L : hx = " & hx & ", hy = " & hy _
		          & ", in " & image & ln
		ans = ans or isInRect(hx, hy, fx, fy, gx, gy)
	Next	
	
	hasImages = ans
End Function

/*

// 變數 = 宣告式
// Left  = 1270, 620
// Mid   = 1400, 620
// Right = 1530, 620
// 餵食指定培養皿, x : L=0, M=1, R=2 
Sub feedAt(x)
	// tx = target's x position
	tx = cup0_x + cup_dx * x
	Call feed(food_x, food_y, tx, cup0_y)
End Sub

// 滑鼠從(sx, sy)點一次然後到(tx, ty)點一次
Sub feed(sx, sy, tx, ty)==
	MoveTo sx, sy
	LeftClick 1
	Delay 100
	MoveTo tx, ty
	LeftClick 1
	Delay 100
End Sub
*/
