#SingleInstance force
#IfWinActive,ahk_class D3 Main Window Class
#MaxHotkeysPerInterval 20000
#KeyHistory 0
ListLines Off
If not A_IsAdmin
{
try {
Run *RunAs "%A_ScriptFullPath%"
}
ExitApp
}
SetKeyDelay,20
SetMouseDelay,20
v_Enable=0
l_Enable=0
$XButton2::
{
v_Enable:=!v_Enable
If (v_Enable=0)
{
Gosub CloseAHK
}
Else
{
SetTimer, Label1, off
SetTimer, Label2, 150
SetTimer, Label3, 150
SetTimer, Label4, 150
SetTimer, MouseLButton, 30
SetTimer, MouseRButton, off
Send {x down}
}
}
Return
~*RButton::
{
Gosub RDownDetection
}
Return
~*RButton Up::
{
Gosub RUpDetection
}
Return
RDownDetection:
{
If (v_Enable==0)
{
Gosub CloseAHK
}
Else If (v_Enable==1)
{
Click Right
Click Right
Click Right
Click Right
Click Right
Click Right
Click Right
Click Right
Click Right
SetTimer, Label1, 30
}
Return
}
RUpDetection:
{
If (v_Enable==0)
{
Gosub CloseAHK
}
Else If (v_Enable==1)
{
SetTimer, Label1, off
}
Return
}
~LButton::
{
If (v_Enable==0)
{
Gosub CloseAHK
}
Else If (v_Enable==1)
{
l_Enable:=!l_Enable
If (l_Enable==0)
{
SetTimer, MouseLButton, 30
}
Else If (l_Enable==1)
{
SetTimer, MouseLButton, 2500
}
}
}
Return
~Enter::
~T::
~S::
~I::
~M::
{
Gosub CloseAHK
}
Return
Label1:
{
Send {1}
Return
}
Label2:
{
Send {2}
Return
}
Label3:
{
Send {3}
Return
}
Label4:
{
Send {4}
Return
}
MouseLButton:
{
Click
If IfWinNotActive,暗黑破坏神III or IfWinNotActive,暗黑破壞神III or IfWinNotActive,Diablo III
{
Gosub CloseAHK
}
Return
}
MouseRButton:
{
Click Right
If IfWinNotActive,暗黑破坏神III or IfWinNotActive,暗黑破壞神III or IfWinNotActive,Diablo III
{
Gosub CloseAHK
}
Return
}
CloseAHK:
{
SetTimer, Label1, off
SetTimer, Label2, off
SetTimer, Label3, off
SetTimer, Label4, off
SetTimer, MouseLButton, off
SetTimer, MouseRButton, off
Send {x up}
h_Enable=0
Return
}