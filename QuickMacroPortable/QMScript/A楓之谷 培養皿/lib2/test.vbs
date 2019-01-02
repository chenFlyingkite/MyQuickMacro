Import "D:\vbs\lib\myVB.vbs"
'Import "D:\vbs\lib\Rect.vbs"
Include "D:\vbs\lib\Rect.vbs"

'Namespace myvb
    'Namespace dish
    
    'Option Explicit

        'Const sample = "D:/vbs/petriDish/" '"樣本圖"
        Const sample = "D:/vbs/bmp/" '"樣本圖"
        Const food_x = 360  '"食物x"
        Const food_y = 560  '"食物y"
        
        Const dish0_x  = 1210 '"皿左.上x"
        Const dish0_y  =  530 '"皿左.上y"
        Const dish_w   =  130 '"皿寬"
        Const dish_h   =  170 '"皿高"
        Const dish0_cx = 1270 '"皿左.心x"
        Const dish0_cy =  620 '"皿左.心y"
        Const dish2_rx = 1600 '"皿右.下x"
        Const dish2_ry =  710 '"皿右.下y"
        
        Const dish0_sx  = 1260 '"皿狀態左上x"
        Const dish0_sy  =  550 '"皿狀態左上y"
        Const dish0_srx = 1310 '"皿狀態右下x"
        Const dish0_sry =  610 '"皿狀態右下y"
        
        '餵食指定培養皿連續數次
        Sub feedMore(plantAt, times)
            Dim i
            For i = 1 to times
                'MoveTo 1300, 100
                feedAt(plantAt)
                Delay 400
                Call clickOKIfExist()
            Next
        End Sub
        
        ' x = 0, 1, 2
        ' sim = image similarity, .1 ~ 0.99
        ' images = paths array
        Function hasImages(x, sim, images) 'as Boolean
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
        
        Sub clickOKIfExist()
            Dim ans
            Dim fx, fy, gx, gy
            ', hx, hy 'as double
            'Dim image, sim, exist
            fx = 760
            fy = 320
            gx = 1050
            gy = 480
            clickImageOK fx, fy, gx, gy
            'ans = isImageOK(fx, fy, gx, gy)
            'SayString "exist = " & ans
            'if ans(0) Then
                'click on center of image
            '    Dim hx, hy
            '    hx = ans(1)
            '    hy = ans(2)
            '    Call clickAt(hx + 20, hy + 8)
            'Else
                'MoveTo 1000, 900
            'End If
        End Sub
        
        Function isImageOK(x0, y0, x1, y1)
            Dim image, hx, hy, sim
            Dim ans(3)
            sim = 0.8
            image = sample & "ok.bmp"
            FindPic x0, y0, x1, y1, image, sim, hx, hy
            SayString "OK : hx = " & hx & ", hy = " & hy & ", in " & image & ln
            ans(0) = isInRect(hx, hy, x0, y0, x1, y1)
            'ans(1) = hx
            'ans(2) = hy
            isImageOK = ans'isInRect(hx, hy, x0, y0, x1, y1)
        End Function

        Function clickImageOK(x0, y0, x1, y1)
            Dim image, hx, hy, sim
            sim = 0.8
            image = sample & "ok.bmp"
            FindPic x0, y0, x1, y1, image, sim, hx, hy
            SayString "COK : hx = " & hx & ", hy = " & hy & ", in " & image & ln
            If isInRect(hx, hy, x0, y0, x1, y1) Then
                Call clickAt(hx + 20, hy + 8)
            Else
                'MoveTo 1000, 900
            End If
        End Function

        'Feed the petri dish of x, where x : L=0, M=1, R=2 
        Sub feedAt(x)
            Dim tx 'as double
            'tx = target's x position
            tx = dish0_cx + dish_w * x
            Call feed(food_x, food_y, tx, dish0_cy)
        End Sub

        'Mouse click at (sx, sy) and click at (tx, ty)
        Sub feed(sx, sy, tx, ty)
            Call clickAt(sx, sy)
            Call clickAt(tx, ty)
        End Sub
        
        ' Move to (x, y), click and delay
        Sub clickAt(x, y)
            MoveTo x, y
            LeftClick 1
            Delay 50
        End Sub
'Include("C:\functions.vbs")
'WriteLog "Start of Script!"
 
    Sub Include (strFile)
        'Create objects for opening text file
        Set objFSO = CreateObject("Scripting.FileSystemObject")
        Set objTextFile = objFSO.OpenTextFile(strFile, 1)

        'Execute content of file.
        ExecuteGlobal objTextFile.ReadAll

        'CLose file
        objTextFile.Close

        'Clean up
        Set objFSO = Nothing
        Set objTextFile = Nothing
    End Sub
    'End Namespace
'End Namespace
