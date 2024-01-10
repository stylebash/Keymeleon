/** Cheat Sheets module for Keymeleon
 * 
 * OG Author: stylebash
 * Contact: https://github.com/stylebash
*/

/* Start: Cheat sheet setup */

; Setup the cheat sheet image
cheatSheet(mode := 'show')
{
    static cheatSheetImage := Gui()
    imageFile := imageFileChecker() ; if it has the parentheses, it returns a string

    if imageFile == ''
        cheatSheetImage.Add("Text",, "No image was set for this program.")
    else
        cheatSheetImage.AddPicture(, imageFile)
    if mode == 'show'
    {
        cheatSheetImage.Opt("+AlwaysOnTop")
        cheatSheetImage.Show("NoActivate")
    }
    else if mode == 'hide'
    {
        cheatSheetImage.Hide()
        cheatSheetImage.Destroy
        cheatSheetImage := Gui()
    }
}

; Returns a file name
imageFileChecker()
{
    imageFile :=  A_ScriptDir cheatSheetDirectory getActiveProgram() cheatSheetFileExtension

    if not FileExist(imageFile)
        imageFile := ''

    return imageFile
}
/* End: Cheat sheet setup */

/* Start: Cheat sheet implementation */
^!#c:: {
    global CHEAT_SHEET_IMAGE_TOGGLE
    if !CHEAT_SHEET_IMAGE_TOGGLE {
        cheatSheet('show')
        CHEAT_SHEET_IMAGE_TOGGLE := 1
    }
}
^!#c Up:: {
    global CHEAT_SHEET_IMAGE_TOGGLE
    cheatSheet('hide')
    CHEAT_SHEET_IMAGE_TOGGLE := 0
}
/* End: Cheat sheet implementation */