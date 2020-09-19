#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#InstallKeybdHook

global CachedTargetWindow := 0

ActivateChromeTab(index) 
{
    OutputDebug, % "Activating target window: " . CachedTargetWindow
    WinActivate, ahk_id %CachedTargetWindow%
    Send, ^%index%
}

SaveTargetWindow() 
{
    CachedTargetWindow := WinExist("A")
    OutputDebug, % "Saved target window: " . CachedTargetWindow
    MsgBox, % "Saved target window: " . CachedTargetWindow
}

#F12::SaveTargetWindow()    

global CachedOneNoteWindow := 0

#F3::
    OutputDebug, % "CachedOneNoteWindow is " . CachedOneNoteWindow
    if (!(CachedOneNoteWindow > 0)) || (!(WinExist("ahk_id " . CachedOneNoteWindow)))
    {
    
        SetTitleMatchMode 2
        CachedOneNoteWindow := WinExist("OneNote ahk_class ApplicationFrameWindow", "OneNote")
        OutputDebug, % "CachedOneNoteWindow:=" . CachedOneNoteWindow
    }
    WinActivate, ahk_id %CachedOneNoteWindow%
return

; #+F3::ActivateChromeTab("1")
#F4::ActivateChromeTab("1")

#+D::
    FormatTime, CurrentDateTime,, yyyy-MM-dd
    SendInput %CurrentDateTime%
return

#+T::
    FormatTime, CurrentDateTime,, yyyyMMdd_HHmm
    SendInput %CurrentDateTime%
return
