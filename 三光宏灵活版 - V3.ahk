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

Close(){
	global
	bStart:=false
	;SetTimer  Skill1,off
	SetTimer  Skill2,Off
	SetTimer  Skill3,Off
	SetTimer  Skill4,Off
	SetTimer  ForceMove,Off
	SetTimer  MouseLButton,Off
}

Start(){
	global
	if(bStart=false){
		bStart:=true
		;SetTimer, Skill1, 210  
		SetTimer, Skill2, 220  
		SetTimer, Skill3, 230 
		SetTimer, Skill4, 240
		SetTimer, ForceMove, 20  
		if(bLeft){
		SetTimer, MouseLButton, 50
		}
	}
	else{
		Close()
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
SetTimer  ForceMove,Off
SetTimer  ForceMove,Off
SetTimer  MouseLButton,Off
SetTimer  MouseLButton,Off
;SetTimer, ForceMove, 20 
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
SetTimer, ForceMove, 20 
if(bLeft){
	SetTimer, MouseLButton, 50
}
}
Return
}