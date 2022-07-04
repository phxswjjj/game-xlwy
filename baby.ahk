AppTitle := "驯龙物语"
UniqueID := WinExist(AppTitle)
if not UniqueID {
    OutputDebug, "[%AppTitle%] not found"
    return
}

FormatTime, CurrentDateTime,, HH:mm:ss

WinActivate, ahk_id %UniqueID%

return

Numpad1::   ; 停止自動
WinActivate, ahk_id %UniqueID%
MouseClick, Left, 1871, 986

Sleep, 1500

; 補捉
WinActivate, ahk_id %UniqueID%
MouseClick, Left, 1284, 984
return

Numpad2::   ; 逃跑
WinActivate, ahk_id %UniqueID%
; 主角
MouseClick, Left, 1204, 988
Sleep, 500
MouseClick, Left, 1116, 543

Sleep, 1000
; 寵物
MouseClick, Left, 1373, 984
Sleep, 500
MouseClick, Left, 1116, 543
return

Numpad3::   ; next round
WinActivate, ahk_id %UniqueID%
MouseClick, Left, 974, 867
Sleep, 1000
MouseClick, Left, 296, 353
Sleep, 500
MouseClick, Left, 296, 353
return

^!z::  ; Control+Alt+Z hotkey.
OutputDebug, "Z pressed"
OutputDebug, [%CurrentDateTime%] Stopped
ExitApp