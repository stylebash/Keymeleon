/** Config file for Keymeleon
 * 
 * OG Author: stylebash
 * Contact: https://github.com/stylebash
*/

; A list of hotkeys you've setup to be used for remapping in different programs.
; Why set? To keep track what we've universally set for multiple programs/applications.
;   So there won't be duplicates.
; For this particular use case, I'm chunking them by 19 items and calling each chunk "layers"
;   purely for readability on my part (the OG author) only
hotkeys := 
[
    ; layer 1:
    "F13",
    "F14",
    "F15",
    "F16",

    "F17",
    "F18",
    "F19",
    "F20",

    "F21",
    "F22",
    "F23",
    "F24",

    "^!+1",
    "^!+2",
    "^!+3",
    "^!+4",
    
    "^!+5",
    "^!+6",
    "^!+7",
    ; layer 2:
    "^!+8",
    "^!+9",
    "^!+0",
    ; conditional layer:
    "w",
    "a",
    "s",
    "d",
]

/** Start: CheatSheet config */
; Why? Because maybe you forgot where you put your shortcut keys on the keyboard/macropad and you've made a nice little graphic for it.

; Setup your cheat sheet parameters here.
; Can be left blank if you don't want to setup your cheat sheets just yet. Like so below:
; cheatSheetDirectory := ''
; cheatSheetFileExtension := ''
; cheatSheetImageToggle := 0 ; hide cheat sheet GUI

; otherwise, create the folder 'cheatsheets' in the same directory as this script and add your image files there.
cheatSheetDirectory := '\cheatsheets\'
cheatSheetFileExtension := '.png'
CHEAT_SHEET_IMAGE_TOGGLE := 0

/** End: CheatSheet config */