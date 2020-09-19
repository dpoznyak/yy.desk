#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows, On
#UseHook  On
#InputLevel, 0
#SingleInstance
~#RControl UP:: DoReturnFocus()
DoReturnFocus() {
	WinGet, active_id, ID, A
	WinGetClass, OutputVar, ahk_id %active_id%
	OutputDebug, Class with focus = %OutputVar%, err = %ErrorLevel%
	if (OutputVar = "WorkerW") {
		OutputDebug, Switching focus...
		Send !{Esc}
	}
}