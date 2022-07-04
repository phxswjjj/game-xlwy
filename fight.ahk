AppTitle := "驯龙物语"
UniqueID := WinExist(AppTitle)
if not UniqueID {
    OutputDebug, "[%AppTitle%] not found"
    return
}

FightImage := "images\fight.jpg"
TaskImage := "images\task.jpg"
Task2Image := "images\task2.jpg"

WinActivate, ahk_id %UniqueID%

KeepRunning := true
FormatTime, CurrentDateTime,, HH:mm:ss
OutputDebug, [%CurrentDateTime%] running

ElapsedMins := 0
SetTimer, StopWatch, 60000

While (KeepRunning) {
    IfWinNotActive, ahk_id %UniqueID%
    {
        Sleep, 100
        Continue
    }
    ; WinActivate, ahk_id %UniqueID%
    ImageSearch, FoundX, FoundY, 1594, 547, 1927, 673, *100 %FightImage%
    FormatTime, CurrentDateTime,, HH:mm:ss
    if ErrorLevel {
        if (ElapsedMins >= 5) {
            ImageSearch, FoundX, FoundY, 176, 414, 265, 481, *100 %TaskImage%
            if ErrorLevel {
                OutputDebug, [%CurrentDateTime%] Task(1) Image not found.
                ImageSearch, FoundX, FoundY, 176, 414, 265, 481, *100 %Task2Image%
            }
            if ErrorLevel {
                OutputDebug, [%CurrentDateTime%] Task Image not found.
                Sleep, 60000
                if (ElapsedMins >= 10) {
                    OutputDebug, [%CurrentDateTime%] ExitApp.
                    ExitApp
                }
            } else {
                MouseGetPos, MouseX, MouseY
                MouseClick, Left, 176 + 50, 414 + 50
                MouseMove, MouseX, MouseY
                Sleep, 3000
            }
        }
    }
    else {
        ; OutputDebug, [%CurrentDateTime%] Image was found.

        GoSub, ResetTimer
        SetTimer, StopWatch, 60000

        MouseGetPos, MouseX, MouseY
        MouseClick, Left, 1594 + 50, 547 + 50
        MouseMove, MouseX, MouseY
        Sleep, 3000
        Continue
    }
    Sleep, 1000
}

FormatTime, CurrentDateTime,, HH:mm:ss
OutputDebug, [%CurrentDateTime%] Stopped
ExitApp

ResetTimer:
    SetTimer, StopWatch, Off
    ElapsedMins := 0
    Return

StopWatch:
    ElapsedMins += 1
    ; OutputDebug, %ElapsedMins%
    Return

^!z::  ; Control+Alt+Z hotkey.
OutputDebug, "Z pressed"
KeepRunning := false
Return
