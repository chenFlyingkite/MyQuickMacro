Option Explicit

Sub mouseDrag(sx, sy, tx, ty)
    Const px = 50
    Const py = 10
    MoveTo sx + px, sy + py
    LeftDown 1
    Delay 20
    MoveTo tx + px, ty + py
    Delay 20
    LeftUp 1
End Sub