#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#InstallKeybdHook
#UseHook

F13 & j::Send, {Blind}{Left}
F13 & l::Send, {Blind}{Right}
F13 & i::Send, {Blind}{Up}
F13 & k::Send, {Blind}{Down}

F13 & u::Send, {Blind}^{Left}
F13 & o::Send, {Blind}^{Right}

F13 & `;::Send, {BackSpace}
F13 & p::Send, ^{BackSpace}

F13 & `::Send, {vkF3sc029} ; 全角半角切り替え
; ここの改行は必須！！

F13 & n::Send, {vkF3sc029} ; 全角半角切り替え
; ここの改行は必須！！

F13 & s::Send, #{Left}
F13 & f::Send, #{Right}
F13 & e::Send, #{Up}
F13 & d::Send, #{Down}

F13 & Tab::Send, !^{Tab}

F13 & m::RunActivateMinimize("WindowsTerminal.exe", "WindowsTerminal.exe")
F13 & c::RunActivateMinimize("chrome.exe", "chrome.exe")
F13 & v::RunActivateMinimize("Code.exe", "Code.exe")

RunActivateMinimize(exePass, exeName, exeOption="") {
    Process, Exist, %exeName%
    Sleep, 200
    If (ErrorLevel != 0)
        IfWinNotActive, ahk_pid %ErrorLevel%
        WinActivate, ahk_pid %ErrorLevel%
    else
        WinMinimize, ahk_pid %ErrorLevel%
    else
        Run, %exePass% %exeOption%
}
