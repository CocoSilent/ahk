/*
键位 
1 黑洞 
2 黑人 
3 魔法武器
4 风暴护甲 
鼠标左键 奥数洪流 
鼠标右键 传送 
*/ 


#SingleInstance force
#IfWinActive, ahk_class D3 Main Window Class

SetKeyDelay,-1
SetMouseDelay,-1

bStart:=false
bLeft:=true
bBlack:=false

Skill1:
{
;ControlSend ,,{1},暗黑破坏神III 
Send 1
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
if(bBlack=true){
Click    ;鼠标左键
}
Return
}

Close(){
	global
	bStart:=false
	SetTimer  Skill1,off
	SetTimer  ForceMove,Off
	SetTimer  MouseLButton,Off
}

Start(){
	global
	if(bStart=false){
		bStart:=true
		bBlack:=false
		Send 3
		sleep 50
		Send 4
		sleep 50
		SetTimer, Skill1, 3000  
		SetTimer, ForceMove, 20 
		if(bLeft=true){		
			SetTimer, MouseLButton, 50
		}
	}
	else{
		Close()
	}
}

ChangeBlack(){
	global
	bBlack := false
	SetTimer, Skill1, 3000 
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

$2::  
{ 
    send 2
    if (bStart=true) 
    {
		if(bBlack=false){
			bBlack := true
			SetTimer  Skill1,off
			SetTimer  ForceMove,Off
			sleep 650
			send 2
			sleep 100
			SetTimer, Skill1, 298 
			SetTimer, ForceMove, 20 
			SetTimer, ChangeBlack, -20000  
		} 
    }
}
Return 

$*RButton::
if(bBlack=true){
	send 3
}else{
	Click Right
}
Return