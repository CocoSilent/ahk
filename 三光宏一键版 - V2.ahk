#SingleInstance force
#IfWinActive, ahk_class D3 Main Window Class

SetKeyDelay,10
SetMouseDelay,10

bStart:=false
bLeft:=true

Skill1:
{
;ControlSend ,,{1},暗黑破坏神III 
Send 1
Return
}

Skill2:
{
;ControlSend ,,{2},暗黑破坏神III 
Send 2
Return
}

Skill3:
{
;ControlSend ,,{3},暗黑破坏神III 
Send 3
Return
}

Skill4:
{
;ControlSend ,,{4},暗黑破坏神III 
Send 4
Return
}

ForceMove:
{
;ControlSend ,,{x},暗黑破坏神III 
Send x
Return
}

MouseLButton:
{
Click    ;鼠标左键
Return
}

MouseRButton:
{
Click Right
Return
}

Close(){
	global
	bStart:=false
	SetTimer  Skill1,off
	SetTimer  Skill2,Off
	SetTimer  Skill3,Off
	SetTimer  Skill4,Off
	SetTimer hpQ, Off
	SetTimer  ForceMove,Off
	SetTimer  MouseLButton,Off
	Send {1 up}
	;SetTimer  MouseRButton,Off
}

Start(){
	global
	if(bStart=false){
		bStart:=true
		;SetTimer, Skill1, 210  
		SetTimer, Skill2, 220  
		SetTimer, Skill3, 230 
		SetTimer, Skill4, 240  
		SetTimer, hpQ, 240
		SetTimer, ForceMove, 20    
		SetTimer, MouseLButton, 50
	}
	else{
		Close()
	}
}

hpQ(){
	IniRead, OutputVar, config.ini, hp, x
	x=%OutputVar%
	IniRead, OutputVar, config.ini, hp, y
	y=%OutputVar%
	IniRead, OutputVar, config.ini, hp, width
	width=%OutputVar%
	IniRead, OutputVar, config.ini, hp, persent
	persent=%OutputVar%
    PixelGetColor, lifebar_color1, % x + Floor(width * persent), y, RGB

	if(lifebar_color1 = 0x000000){
		Send q
	}
}

~T::
~M::
{
Close()
}
Return


F2:: 
$XButton2:: 
	Start()
Return

F3::
$XButton1::
if(bStart=true){
	if(bLeft=true){
		bLeft:=false
		SetTimer  MouseLButton,Off
	}else{
		bLeft:=true
		SetTimer, MouseLButton, 50
	}
}
Return
	
~*RButton::
{
MourseRDown()
}	
Return

~*RButton Up::
{
MourseRUp()
}
Return 

MourseRDown()
{
global
If (bStart=false)
{
}
Else
{
Send 1
SetTimer, Skill1, 439
}
Return
}


MourseRUp()
{
global
If (bStart=false)
{
}
Else
{
SetTimer  Skill1,Off
}
Return
}