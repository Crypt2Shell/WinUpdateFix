Func WindowsUpdate()
    ; Run WindowsUpdate Troubleshooter
    Run("cmd /c WindowsUpdate.diagcab")

	; Wait for cmd.exe to open WindowsUpdate Troubleshooter
	; and close it, after the Window shows up.
	Local $WindowsUpdate = WinWait("[CLASS:NativeHWNDHost]", "")
	If ProcessExists("cmd.exe") Then
		ProcessClose("cmd.exe")
	EndIf

	; Select "Windows Update"
	ControlSend($WindowsUpdate,"","[CLASS:SysListView32; INSTANCE:1]", "{SPACE}")

	Do
		; Wait for Text / Button: Next
		WinWait("[CLASS:NativeHWNDHost]", "&Weiter", 3)
		; Click Next
		ControlClick($WindowsUpdate, "", "[CLASS:Button; INSTANCE:1]")
	Until ControlGetHandle($WindowsUpdate, "", "[CLASS:Button; INSTANCE:7]")

	; Close the Program
	WinWait("[CLASS:NativeHWNDHost]", "Schließen")
	ControlClick($WindowsUpdate, "", "[CLASS:Button; INSTANCE:3]")
EndFunc

; start WindowsUpdate Troubleshooter
; Important: You have to run this Script as Administrator!
WindowsUpdate()