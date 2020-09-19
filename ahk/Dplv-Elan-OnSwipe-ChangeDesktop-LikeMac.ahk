#NoEnv
#UseHook
SendMode Input
SetWorkingDir %A_ScriptDir%
#InstallKeybdHook
SendLevel, 1
#InputLevel, 1

EventHandle := CreateEvent("zz.ahk-helpers.taskview.toggle")


NumpadPgUp::
NumpadLeft::
!NumpadLeft UP::
Browser_Back::
	SetTimer, SwipeRight,-50
	return

SwipeRight:
;	SendInput {LWin down}{RCtrl down}{Right}{LWin up}{RCtrl up}
    SendInput {LWin down}{RCtrl down}{Right}
    Sleep 150
    SendInput {RCtrl up}{LWin up}
	return

NumpadPgDn::
NumpadRight::
!NumpadRight UP::
Browser_Forward::
	SetTimer, SwipeLeft,-50
	return

SwipeLeft:
;	SendInput {LWin down}{RCtrl down}{Left}{LWin up}{RCtrl up}
    SendInput {LWin down}{RCtrl down}{Left}
    Sleep 150
    SendInput {RCtrl up}{LWin up}
	return

#InputLevel 0

#f::WinTab()
#e::WinTab()



WinTab() {
	global EventHandle
	SetEvent(EventHandle)
	return
}

; HANDLE WINAPI CreateEvent(
;  _In_opt_ LPSECURITY_ATTRIBUTES lpEventAttributes,
;  _In_     BOOL                  bManualReset,
;  _In_     BOOL                  bInitialState,
;  _In_opt_ LPCTSTR               lpName
;);

GetLastError() {
        return DllCall("kernel32.dll\GetLastError")
}

CreateEvent(Name)
{
    r := DllCall("kernel32.dll\CreateEventW", "Ptr", 0, "Int", 0, "Int", 0, "WStr", Name)
	OutputDebug, CreateEvent handle: %r%
	if (r == 0)  {
		OutputDebug, Failed to CreateEvent %A_LastError% 	
		throw ;
	}
	return r
}

;BOOL WINAPI SetEvent(
;  _In_ HANDLE hEvent
;);

SetEvent(Handle) {
	if (!DllCall("kernel32.dll\SetEvent", "Ptr", Handle)) {
		OutputDebug, Failed to SetEvent %A_LastError% 	 (h=%Handle%)
		throw ;
	}
}