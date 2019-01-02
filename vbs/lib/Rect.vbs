'Namespace myvb
Option Explicit

    'Rects
    Function isInRect(x, y, L, T, R, B)
        Dim inX, inY 'as Boolean
        'Dim inX = False
        'Dim inY = False
        inX = L <= x And x <= R
        inY = T <= y And y <= B
        isInRect = true And inX And inY
    End Function

'End Namespace