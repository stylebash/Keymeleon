/** Keymeleon
 * Version 1.0
 * Remap shortcut keys relative to the open foreground window program.
 * Using the power of AutoHotkey v2.x
 * 
 * Author: stylebash
 * Contact: https://github.com/stylebash
*/

#SingleInstance
#Requires AutoHotkey v2.0
#Include keymeleon_config.ahk

#Include keymeleon_programFunctions_module.ahk
#Include keymeleon_cheatSheets_module.ahk

/*
Start: Main body of logic to be executed on load
*/

; Call all the hotkeys in the array
for index, value in hotkeys
{
    try
        Hotkey "$" . value, catchHotKeys
    catch
        MsgBox "Main loop failed."
    ; continue
}

/*
End: Main body of script to be executed on load
*/


/*
Start: Essential functions to make this script work.
*/

; Try running the hotkey
catchHotKeys(thisHotkey)
{
    activeWindow := getActiveProgram('window')
    programName := getActiveProgram()
    detachedHotKeyHook := StrReplace(thisHotkey, "$", "")
    filteredHotKey := alphaCharsCaseSetter(detachedHotKeyHook)
    runFunction(programName, filteredHotKey, activeWindow)
}

; Retrieve currently open program details
getActiveProgram(mode := 'name')
{
    activeWindow := WinGetProcessName("A")
    if mode == 'window'
        return activeWindow
    else if mode == 'name'
        return StrReplace(activeWindow, ".exe", "")
}
  
; Call a dynamically named function inside, passing the params
runFunction(programName, hotKeyParam, activeWindow)
{
    try
    {
        %programName%_function(hotKeyParam, activeWindow)

        /* start: v2 future code. don't worry about it. */
        ; template_function(%programName%_config, hotKeyParam, activeWindow)
        /* end: v2 future code. don't worry about it. */
        
        return true
    }
    catch
    {
        ; No custom hotkey for this program/application.
        ; Send in raw key press instead
        Send hotKeyParam
    }

    return
}

/* start: v2 future code. don't worry about it. */
; template_function(configArray, runningHotKey, activeWindow)
; {
;     thisFunctionIdentity := StrReplace(A_ThisFunc, "_function", "")
    
;     ; activateCallingFunction() is a method found in "universal macro hotkeys.ahk"
;     ; checks if we should remap the keys for the currently active window.
;     if activateCallingFunction(thisFunctionIdentity, activeWindow) == true 
;     {
;         switch runningHotKey{       ; check what shortcut combination/hotkey was just pressed.
;             for key, value in configArray
;             {
;                 ; MsgBox value[1] ; the hotkey that will be remapped.
;                 if Type(value[2]) == "Array" ; paired array value is a nested array  ; the hotkey that will be sent
;                 {
;                     Send value[2][1] ; output nested array value at index 1
;                     if value[2].Has(2) ; the nested array has an index 2
;                         MsgBox value[2][2] ; output nested array value at index 2
;                 }
;                 else ; paired array value is not an array
;                 {
;                     Send value[2] ; output array value at index 2
;                 }
;             }
;             case "F13":             ; shortcut combination/hotkey you want to replace
;                 Send "^!+z"         ; shortcut combination/hotkey you want to activate instead.
;             default:
;                 Send runningHotKey  ; Unset, so hit the key(s) normally and execute its default behavior instead.
;         }
;     }

;     return
; }
/* end: v2 future code. don't worry about it. */

; Allow case to be preserved if runningHotKey is alpha characters only.
alphaCharsCaseSetter(runningHotKey)
{
    if IsAlpha(runningHotKey) ; runningHotKey is an alpha case? 
    {
        capsLockIsOn := GetKeyState("CapsLock", "T")
        if capsLockIsOn == true ; caps lock is on?
            runningHotKey := StrUpper(runningHotKey) ; yes
        if capsLockIsOn == false ; caps lock is off?
            runningHotKey := StrLower(runningHotKey) ; yes
    }

    return runningHotKey
}

; Check if the currently active window matches the program the function calling this is set to.
; a <program_name>_function always corresponds to a specific program application.
;   example: pmotion.exe
activateCallingFunction(programName, activeWindow)
{
    if activeWindow == programName ".exe"
        return true

    return false
}

/*
End: Essential functions to make this script work.
*/


; Terminate the script / equivalent to choosing "Exit" from the script's tray menu
; Changeable to something else, on preference
; Ctrl+Alt+Win + x
^!#x::
{
    MsgBox "Closing Universal Macro Hotkeys script"
    ExitApp
}

; Press a hotkey to reload the script. 
; Changeable to something else, on preference
; Ctrl+Alt+Win+ r
^!#r::
{
    MsgBox "Reloading Universal Macro Hotkeys script"
    Reload
}

; Maybe you want to type normally and don't want any hotkeys from accidentally activating
; Toggles suspending the script.
; Changeable to something else, on preference
; Ctrl+Alt+Win+ s
#SuspendExempt
^!#s::Suspend
#SuspendExempt False