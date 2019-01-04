'Namespace myvb
    'Namespace dish
    
    Option Explicit
        
        '-----------------
        'Feed petri dish of $plantAt repeatly for $times times
        Sub feedMore(plantAt, times)
            Dim i
            For i = 1 to times
                'MoveTo 1300, 100
                feedAt(plantAt)
                Delay 400
                Call clickOKIfExist()
                Delay 100
            Next
        End Sub
        
        '-----------------
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
            lg "Find images in " & ltrb(fx, fy, gx, gy) & ln
            ans = false
            For Each image In images
                FindPic fx, fy, gx, gy, image, sim, hx, hy
                lg "At " & xy(hx, hy) & " is image " & image & ln
                ans = ans or isInRect(hx, hy, fx, fy, gx, gy)
            Next
            
            hasImages = ans
        End Function
        
        '-----------------
        Sub clickOKIfExist()
            Dim fx, fy, gx, gy
            ' w = 40% ~ 60%
            ' h = 35% ~ 60%
            fx = window_l + window_w * 0.4
            gx = window_l + window_w * 0.6
            fy = window_t + window_h * 0.35
            gy = window_t + window_h * 0.6
            lg "Click OK if exist in " & ltrb(fx, fy, gx, gy) & ln
            clickImageOK fx, fy, gx, gy
        End Sub
        
        '-----------------
        Function clickImageOK(x0, y0, x1, y1)
            Dim ans, hx, hy
            ans = isImageOK(x0, y0, x1, y1)
            If ans(0) Then
                hx = ans(1)
                hy = ans(2)
                Call clickAt(hx + 20, hy + 8)
            Else
                'MoveTo 1000, 900
            End If
        End Function

        '-----------------
        Function isImageOK(x0, y0, x1, y1)
            Dim image, hx, hy, sim
            Dim ans(3)
            sim = 0.8
            image = sample & "ok.bmp"
            FindPic x0, y0, x1, y1, image, sim, hx, hy
            lg "OK @ " & xy(hx, hy) & " in " & image & ln
            ans(0) = isInRect(hx, hy, x0, y0, x1, y1)
            ans(1) = hx
            ans(2) = hy
            isImageOK = ans
        End Function


        'Feed the petri dish of x, where x : L=0, M=1, R=2 
        Sub feedAt(x)
            'tx = target's x position
            Dim tx
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
        
        Function ltrb(l, t, r, b)
            ltrb = xy(l, t) & " ~ " & xy(r, b)
        End Function
        
        Function xy(x, y)
            xy = "(" & x & ", " & y & ")"
        End Function
        
        Sub lg(s)
            'MsgBox s
            'SayString s
        End Sub
    'End Namespace
'End Namespace
