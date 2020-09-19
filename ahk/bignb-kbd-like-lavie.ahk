#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#InstallKeybdHook
SendLevel, 1
#InputLevel, 1

Volume_Down::Send {Home}
Volume_Up::Send {End}
sc108::Send {PgUp}
sc109::Send {PgDn}