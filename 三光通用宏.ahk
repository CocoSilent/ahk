#SingleInstance force
#IfWinActive, ahk_class D3 Main Window Class


SetKeyDelay,50
SetMouseDelay,50

bStart:=false

~F2:: 
if(bStart=false){
bStart:=true
;SetTimer, Skill1, 600  
SetTimer, Skill2, 610  
SetTimer, Skill3, 620  
SetTimer, Skill4, 630  
SetTimer, ForceMove, 50    
SetTimer, MouseLButton, 50
}
else{
bStart:=false
;SetTimer  Skill1,off
SetTimer  Skill2,Off
SetTimer  Skill3,Off
SetTimer  Skill4,Off
SetTimer  ForceMove,Off
SetTimer  MouseLButton,Off
}
Return 


Skill1:
{
ControlSend ,,{1},�����ƻ���III 
Return
}

Skill2:
{
ControlSend ,,{2},�����ƻ���III 
Return
}

Skill3:
{
ControlSend ,,{3},�����ƻ���III 
Return
}

Skill4:
{
ControlSend ,,{4},�����ƻ���III 
Return
}

ForceMove:
{
ControlSend ,,{x},�����ƻ���III 
Return
}

MouseLButton:
{
Click    ;������
Return
}