'Namespace myvb
Option Explicit

    Const ln = vbCrLf '����
    'Const ln = vbCrLf '����, vbCr, vbLf, vbNewLine

    Function ox(b)
        If b Then 
            ox = "o"
        Else 
            ox = "x"
        End If
    End Function


    Sub lln()
        'SayString vbLf
        SayString ln
    End Sub

'End Namespace