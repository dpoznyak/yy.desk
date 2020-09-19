#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#InstallKeybdHook
SendLevel, 1
#InputLevel, 1



NumpadMult::
Browser_Back::
	SendInput {LWin down}{RCtrl down}{Right}
	Sleep 500
	SendInput {RCtrl up}{LWin up}
	return
	
NumpadDiv::
Browser_Forward::
	SendInput {LWin down}{RCtrl down}{Left}
	Sleep 500
	SendInput {RCtrl up}{LWin up}
	return

#InputLevel 0

#e::WinTab()

WinTab() {
	Send {RWin down}{Tab}{RWin up}
	return
}