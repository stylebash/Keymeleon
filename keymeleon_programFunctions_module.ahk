/** Program Functions for Keymeleon
 * 
 * OG Author: stylebash
 * Contact: https://github.com/stylebash
*/

; Remap keys according to the program it is set to.
; User only has to change and/or add the switch case values and its matching block
; User will keep cloning this function as they add new programs to remap keys
; 
; Just the tips:
; The programName in <programName>_function MUST match the ahk_exe value for this to work.
;   Meaning, case sensitive. Again, CASE SENSITIVE.
;   When in doubt, use AHK Windows spy

; AHK keys syntax legend:
; ^ - control
; ! - alt
; + - shift


; Template function
; does nothing. Just a template to copy paste
template_function(runningHotKey, activeWindow)
{
    thisFunctionIdentity := StrReplace(A_ThisFunc, "_function", "")
    
    ; activateCallingFunction() is a method found in "universal macro hotkeys.ahk"
    ; checks if we should remap the keys for the currently active window.
    if activateCallingFunction(thisFunctionIdentity, activeWindow) == true 
    {
        switch runningHotKey{       ; check what shortcut combination/hotkey was just pressed.
            case "F13":             ; shortcut combination/hotkey you want to replace
                Send "^!+z"         ; shortcut combination/hotkey you want to activate instead.
            default:
                Send runningHotKey  ; Unset, so hit the key(s) normally and execute its default behavior instead.
        }
    }

    return
}

; Pro Motion NG
pmotion_function(runningHotKey, activeWindow)
{
    thisFunctionIdentity := StrReplace(A_ThisFunc, "_function", "")
    
    if activateCallingFunction(thisFunctionIdentity, activeWindow) == true
    {
        switch runningHotKey{
            case "F13":
                Send "^!+z"
            case "F14":
                Send "m"
            case "F15":
                Send "+a"
            case "F16":
                Send "b"
            default:
                Send runningHotKey
        }
    }

    return
}

; Visual Studio code
Code_function(runningHotKey, activeWindow)
{
    thisFunctionIdentity := StrReplace(A_ThisFunc, "_function", "")

    if activateCallingFunction(thisFunctionIdentity, activeWindow) == true
    {
        switch runningHotKey{
            case "F13":
                Send "{WheelUp}"
            case "F17":
                Send "{WheelDown}"
            case "w":
                Send "w"
            default:
                Send runningHotKey
        }
    }

    return
}

; firefox
firefox_function(runningHotKey, activeWindow)
{
    thisFunctionIdentity := StrReplace(A_ThisFunc, "_function", "")

    if activateCallingFunction(thisFunctionIdentity, activeWindow) == true
    {
        switch runningHotKey{
            case "F13":
                Send "{WheelUp}"
            case "F17":
                Send "{WheelDown}"
            case "F18":
                Send "+{WheelUp}"
            case "F19":
                Send "+{WheelDown}"

            case "F14":
                Send "^{PgUp}"
            case "F15":
                Send "^{PgDn}"

            case "F16":
                Send "{Home}"
            case "F20":
                Send "{End}"
            case "F21":
                Send "^z"
            case "^!+5":
                Send "^w"
            case "^!+6":
                Send "^+t"
            default:
                Send runningHotKey
        }
    }

    return
}

; Figma
Figma_function(runningHotKey, activeWindow)
{
    thisFunctionIdentity := StrReplace(A_ThisFunc, "_function", "")

    if activateCallingFunction(thisFunctionIdentity, activeWindow) == true
    {
        switch runningHotKey{
            case "F13":
                Send "^{WheelUp}"
            case "F17":
                Send "^{WheelDown}"
            case "w":
                Send "w"
            default:
                Send runningHotKey
        }
    }

    return
}

; Crocotile 3d
crocotile3d_function(runningHotKey, activeWindow)
{
    thisFunctionIdentity := StrReplace(A_ThisFunc, "_function", "")
    
    if activateCallingFunction(thisFunctionIdentity, activeWindow) == true
    {
        arrowKeysMode := GetKeyState("CapsLock", "T")
        switch runningHotKey{
            case "w":
                if arrowKeysMode
                    Send "{Up}"
                else
                    Send "w"
            case "a":
                if arrowKeysMode
                    Send "{Left}"
                else
                    Send "a"
            case "s":
                if arrowKeysMode
                    Send "{Down}"
                else
                    Send "s"
            case "d":
                if arrowKeysMode
                Send "{Right}"
                else
                    Send "d"
            default:
                Send runningHotKey
        }
    }

    return
}