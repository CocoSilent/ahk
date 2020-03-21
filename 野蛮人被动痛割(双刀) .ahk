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
Send, {RButton Down}
Return
}

Close(){
	global
	bStart:=false
	send {Shift up}
	SetTimer  Skill1,off
	SetTimer  Skill2,Off
	SetTimer  Skill3,Off
	SetTimer  Skill4,Off
	;SetTimer  ForceMove,Off
	;SetTimer  MouseLButton,Off
	SetTimer  MouseRButton,Off
	Send, {RButton Up}
	Sleep, 100
	Send, {RButton Up}
}

Start(){
	global
	if(bStart=false){
		bStart:=true
		SetTimer, Skill1, 1000  
		SetTimer, Skill2, 220  
		Gosub, Skill3
		SetTimer, Skill3, 119000 
		Gosub, Skill4
		SetTimer, Skill4, 119000  
		;SetTimer, ForceMove, 20    
		;SetTimer, MouseLButton, 50
		SetTimer, MouseRButton, 1000
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


*F2:: 
$XButton2:: 
	Start()
Return


Return 