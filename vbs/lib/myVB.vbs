'Namespace myvb

'Fail
'Dim nb
'nb = PlugIn.File.IsFileExit("D:/vbs/nb")

'If nb Then
'    Import "D:\vbs\lib\nbPos.vbs"
'Else
'    Import "D:\vbs\lib\pcPos.vbs"
'End If
'MsgBox "nb = " & nb

'Option Explicit

    'Const ln = vbCr '´«¦æ
    'Const ln = vbCrLf '´«¦æ, vbCr, vbLf, vbNewLine
    Dim ln
    ln = vbCr

    Function ox(b)
        If b Then 
            ox = "o"
        Else 
            ox = "x"
        End If
    End Function

    'Rects, (x0, y0, x1, y1 = L, T, R, B)
'    Function isInRect(x, y, x0, y0, x1, y1)
'        Dim inX, inY as Boolean
'        inX = x0 <= x And x <= x1
'        inY = y0 <= y And y <= y1
'        isInRect = inX And inY
'    End Function


    Sub lln()
        'SayString vbLf
        SayString ln
    End Sub
'End Namespace