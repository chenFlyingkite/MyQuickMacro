'http://ecaaser3.ecaa.ntu.edu.tw/weifang/HtmlTutor/vbscript/C-VBSDOCs/vbs239.htm
' VBScript reference
'http://www.ecaa.ntu.edu.tw/weifang/htmltutor/vbscript/c-vbsdocs/vbstoc.htm
' Dim expression
'http://www.ecaa.ntu.edu.tw/weifang/htmltutor/vbscript/c-vbsdocs/vbs569.htm

Option Explicit

'Const ln = vbCrLf ' new line
'Const ln = vbNewLine ' new line
'Const ln = vbLf 'vbCr, vbLf , vbCrLf , vbNewLine

' ----- Basic utility -----------------
' Bitmap image folder path
Const imgFolder = "D:/vbs/bmp/"

Function image(path)
    image = imgFolder & path
End Function

Function lg(msg)
    SayString msg & vbLf
End Function

' ----- Mouse utility -----------------
Function mouseDrag(sx, sy, tx, ty)
    Const px = 50
    Const py = 10
    MoveTo sx + px, sy + py
    LeftDown 1
    Delay 20
    MoveTo tx + px, ty + py
    Delay 20
    LeftUp 1
End Function


' x = 0, 1, 2
' sim = image similarity, .1 ~ 0.99
' images = paths array

Function hasImages(x, sim, images) 'as Boolean
    dish_w = 1
    dish0_sx = 2
    dish0_sy = 3
    dish0_sry = 4
    Dim w, fx, fy, gx, gy, hx, hy 'as double
    Dim ans, image 'as Boolean
    w = dish_w
    fx = dish0_sx + x * w
    fy = dish0_sy
    gx = fx + w
    gy = dish0_sry
    SayString "Find (" & fx & ", " & fy & ") ~ (" _
            & gx & ", " & gy & ")" & ln
    'SayString "fx = " & fx & ", fy = " & fy & ln
    'SayString "gx = " & gx & ", gy = " & gy & ln & ln
    ans = false
    For Each image In images
        FindPic fx, fy, gx, gy, image, sim, hx, hy
        SayString "L : hx = " & hx & ", hy = " & hy _
                & ", in " & image & ln
        ans = ans or isInRect(hx, hy, fx, fy, gx, gy)
    Next	
    
    hasImages = ans
End Function


'Rects
Function isInRect(x, y, L, T, R, B)
    Dim inX, inY 'as Boolean
    'Dim inX = False
    'Dim inY = False
    inX = L <= x And x <= R
    inY = T <= y And y <= B
    isInRect = true And inX And inY
End Function

' Move to (x, y), click and delay
Function clickAt(x, y)
    SaveMousePos
    MoveTo x, y
    LeftClick 1
    Delay 50
    RestoreMousePos
End Function

Function ox(b)
    If b Then 
        ox = "o"
    Else 
        ox = "x"
    End If
End Function