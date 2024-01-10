# Keymeleon #

Remap shortcut keys relative to the open foreground window program. Using the power of AHK v2.x

## Requirements ##
- An installation of AHK v2.x on your PC.

## Configuration ##

### Version 1 ###
  1. Open keymeleon_config.ahk
  2. Modify the hotkeys array according to your needs.
    - The values you include here are what you wish to be remapped on any program.
    - Any unset key will work as is / by default.

  3. Open keymeleon_programFunctions_module.ahk
  4. Copy-paste the example function: `template_function`.
    1. Change the functions' name into `<programName>_function`
      - example: `pmotion_function`
      - refer to AHK Window Spy `ahk_exe` Window property
      - note: the program name is case sensitive.
    2. Modify the contents of the `switch` block.
      1. the `case` value is the hotkey/shortcut key you want to remap for that specific program.
      2. within the afforementioned `case`, is a code block of its contents.
        - The value after `Send`, inside the double quotes (`""`) is the hotkey/shortcut key you want to remap to.


### Cheatsheets module ###
1. Open keymeleon_config.ahk
2. Set value for the `cheatSheetDirectory`variable
3. Set value for the `cheatSheetFileExtension`variable
4. Leave `CHEAT_SHEET_IMAGE_TOGGLE` alone. This is a constant.
5. In the same directory as **keymeleon.ahk**; Create a folder/directory with the same name as the value you've set for `cheatSheetDirectory`
6. Create an image with the same name as the program you want a cheat sheet for.
    - refer to the naming convention in the Version 1 instructions above
    - note: The GUI does not auto resize the image you've made when you toggle it to pop up. So set its size according to your displays resolution and/or your preferences.
    - make sure you've set your images' file extension the same as the value you've set for `cheatSheetDirectory`


## How to Use ##
1. Double click on / select and hit enter `keymeleon.ahk` from your file folder/windows explorer to run the script.
- Hit `Control+Alt+Windows+x` to close the script
- Hit `Control+Alt+Windows+r` to restart/reload the script
- Hit `Control+Alt+Windows+s` to suspend the script
    1. will toggle enabling/disabling any hotkey/shortcut keys you've setup.
    2. this is silent and has no popup window.

## To do ##

### Cheatsheets module ###
    - (V2) make users able to load cheat sheets online
### V2 ###
    - Users won't have to config anything in **keymeleon_programFunctions_module.ahk**
### V3 ###
    - Users won't have to touch any code.
    - All remapping config is via GUI
    - Specific Keymeleon configuration might still need some code hacking. We'll see, we'll get there when we get there.
### License ###
    - Might need to update it later, as i understand more about it.