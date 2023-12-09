; ! alt
; ^ Ctrl
; + shift
#Warn

$^2::EnterPass()
$^6::setCursor()
$^7::moveCursor()
$^8::clicking()
$^9::changeStop()
$^0::ReloadScript()
!w::keepW()
~f::sendF()

;$^3::showTesting()
;$^4::changeTesting(7)

global PosX:=1234
global PosY:=658
global testing := 5
global isMsgBox:=0

sendF(){
    Loop{
        If Not GetKeyState("f", "P")
        Break
        ;Send, z
        Send "{f down}"
        Sleep 10 ; try various milliseconds
        Send "{f up}"

        Sleep 100
    }
}


	



onOffNotification()
;global Result:="No"

; showTesting(){
;     ;global testing
;     MsgBox(testing)
; }

; changeTesting(num){
;     global testing
;     testing:=num
;     return
; }

checkDefaultPos(){
    global PosX
    global PosY
    if(PosX =1234 and PosY =658){
        return true
    }
    return false
}

EnterPass() {
    Send '^a' ; Ctrl + A
    send "{del}"
    email := "kikilalabak@hotmail.co.uk"
    SendInput email
    SendInput "{Tab}"
    sleep 120
    SendInput "{Tab}"
    pass := ""
    SendInput pass
    sleep 90
    SendInput "{Enter}"
    return
}

onOffNotification(){
    global isMsgBox
    ;global Result
    Result := MsgBox('Would you like turn on messages' ,"isMsgBox", "YesNo")
    if Result = "Yes"{
        setMsg(1)
    }else{
        setMsg(0)
    }
}

CheckAndRunMsgBox(message) {
    global isMsgBox
    if (getMsg()=1) {
        MsgBox(message)
    } else {
        return
    }
}

setMsg(num){
    global isMsgBox
    isMsgBox:=num
}

getMsg(){
    global isMsgBox
    return isMsgBox
}

changeStop(){
    ;global IsStop:=1
    setStop(1)
    CheckAndRunMsgBox("CTRL+- $stop changed to " IsStop)
}

setStop(num){
    global IsStop
    IsStop :=num
}

getStop(){
    global IsStop
    return IsStop
}

setCursor(){        
    MouseGetPos &xpos, &ypos 
    global PosX := xpos
    setPosX(xpos)
    global PosY := ypos
    setPosY(ypos)
    CheckAndRunMsgBox('mouse position relative to screen:`nX: ' . getPosX() . ', Y: ' . getPosY())
}


moveCursor(){
    global PosX 
    global PosY
    if(!PosX or !PosY){
        return
    }
    CheckAndRunMsgBox( "The cursor will move to X" PosX " Y" PosY)
    MouseMove PosX, PosY
}

getPosX(){
    global PosX
    return PosX
}

getPosY(){
    global PosY
    return PosY
}

setPosX(num){
    global PosX
    PosX:=num
}

setPosY(num){
    global PosY
     PosY:=num
}


clicking(){
    global PosX 
    global PosY
    moveCursor()
    ; if(!getPosX() or !getPosY()){
    ;     Result := MsgBox('Would you like to move to X' . PosX . 'Y' . PosY . '?', "4", "YesNo")
    ; }
   
    ; if Result = "Yes"{
    ;     if (!PosX  or! PosY ){
    ;         return
    ;     }
    ;     moveCursor()
    ; }
    


    CheckAndRunMsgBox("CTRL+8 auto clicking")
    setStop(0)
    Loop {
        If (getStop() = 1){
            break
        }else{
            Click
            Sleep 120
        }
    }
}

; ==============================
; This is a division line in AHK script
; ==============================

autoF(){
    MsgBox ("CTRL+7 auto collecting materials")
    setStop(0)
    Loop {
        if (getStop() = 1)
            break
        else {
            Send "{F}"
            Sleep 99
        }
    }
}

pause(){
    MsgBox(" Paused")
    Suspend ;Suspend Hotkeys off/on
    Pause  ;Pause Script off/on
}

ReloadScript(){   
    Reload
    MsgBox("Ctrl +0 script reloaded")
    return
}

checkStatus(){
    MsgBox("The script is running...")
}

keepW(){
    CheckAndRunMsgBox (" keep w Down")
    setStop(0)
    Loop {
        if (getStop() = 1){
            send "{w up}"
            break
        }
        else {
            Send "{w down}" 
            sleep 90
        }
    }
    ;Send, {w down}
}


; ==============================
; Record
; ==============================

; #NoEnv
; #Warn
; ;SendMode Input

; F12::
;     MsgBox, % "Recorded text:`n`n" Recorder
;     Recorder =
;     Return

; #IfWinActive ahk_class Notepad
; ~$*::Recorder .= A_ThisHotkey . " "
; #IfWinActive

; ; ==============================
; ; check if working
; ; ==============================

; ; Press F1 to run the script and test if it's working


; ;==============
; ;keep walking
; ;============





; ; ==============================
; ; battle moves
; ; ==============================


; ^2::
; #NoEnv
; #Warn
; SendMode Input

; ;change nahida
; Send, 4
; Sleep, 82
; PressW()
; { 

;    Send, {w down}
; 	Send, +{Shift down}
;    Sleep, 3500 ; Wait for 3.5 seconds
;    Send, {w up}
; 	Send, +{Shift up}
; }

; ; Call the PressW function
; PressW()

; MOUSEEVENTF_MOVE := 0x0001 ; Define the MOUSEEVENTF_MOVE constant


; Send, +{e down}
; Sleep, 100
; Loop 3 {
;     ; Move the mouse cursor to the left
;     mouse_event(MOUSEEVENTF_MOVE, -300, 0, 0, 0)
;     Sleep, 82
    
;     ; Move the mouse cursor to the right
;     mouse_event(MOUSEEVENTF_MOVE, 300, 0, 0, 0)
;     Sleep, 82
; }
; Sleep, 100
; Send, {e up}

; ; Define the mouse_event function to simulate mouse events
; mouse_event(flags, x := 0, y := 0, data := 0, extra_info := 0) {
;     DllCall("mouse_event", "UInt", flags, "UInt", x, "UInt", y, "UInt", data, "UInt", extra_info)
; }

