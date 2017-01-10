﻿#Include %A_LineFile%\..\..\Plugin.ahk
/*
	Usage: Highlight <Code>
	Desc: Runs the inputted code through a rudimentary code highlighter
*/

Commands := {KeyNames:"Alt AppsKey Backspace Break Browser_Back Browser_Favorites Browser_Forward Browser_Home Browser_Refresh Browser_Search Browser_Stop CapsLock Control CtrlBreak Delete Down End Enter Escape F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12 F13 F14 F15 F16 F17 F18 F19 F20 F21 F22 F23 F24 Help Home Insert LAlt Launch_App1 Launch_App2 Launch_Mail Launch_Media LButton LControl Left LShift LWin MButton Media_Next Media_Play_Pause Media_Prev Media_Stop NumLock Numpad Numpad0 Numpad1 Numpad2 Numpad3 Numpad4 Numpad5 Numpad6 Numpad7 Numpad8 Numpad9 NumpadAdd NumpadAdd NumpadClear NumpadDel NumpadDiv NumpadDiv NumpadDot NumpadDown NumpadEnd NumpadEnter NumpadEnter NumpadHome NumpadIns NumpadLeft NumpadMult NumpadMult NumpadPgDn NumpadPgUp NumpadRight NumpadSub NumpadSub NumpadUp Pause PgDn PgUp PrintScreen RAlt RButton RControl Right RShift RWin ScrollLock Shift Space Tab Up Volume_Down Volume_Mute Volume_Up WheelDown WheelLeft WheelRight WheelUp XButton1 XButton2"
,Directives:"#ClipboardTimeout #CommentFlag #ErrorStdOut #EscapeChar #HotkeyInterval #HotkeyModifierTimeout #Hotstring #If #IfTimeout #IfWinActive #IfWinExist #Include #InputLevel #InstallKeybdHook #InstallMouseHook #KeyHistory #MaxHotkeysPerInterval #MaxMem #MaxThreads #MaxThreadsBuffer #MaxThreadsPerHotkey #MenuMaskKey #NoEnv #NoTrayIcon #Persistent #SingleInstance #UseHook #Warn #WinActivateForce"
,Indent:"Catch else for Finally if IfEqual IfExist IfGreater IfGreaterOrEqual IfInString IfLess IfLessOrEqual IfMsgBox IfNotEqual IfNotExist IfNotInString IfWinActive IfWinExist IfWinNotActive IfWinNotExist Loop Try while"
,BuiltIn:"A_AhkPath A_ScriptHwnd A_AhkVersion A_AppData A_AppDataCommon A_AutoTrim A_BatchLines A_CaretX A_CaretY A_ComputerName A_ControlDelay A_Cursor A_DD A_DDD A_DDDD A_DefaultMouseSpeed A_Desktop A_DesktopCommon A_DetectHiddenText A_DetectHiddenWindows A_EndChar A_EventInfo A_ExitReason A_FormatFloat A_FormatInteger A_Gui A_GuiControl A_GuiControlEvent A_GuiEvent A_GuiHeight A_GuiWidth A_GuiX A_GuiY A_Hour A_IconFile A_IconHidden A_IconNumber A_IconTip A_Index A_IPAddress1 A_IPAddress2 A_IPAddress3 A_IPAddress4 A_IsAdmin A_IsCompiled A_IsCritical A_IsPaused A_IsSuspended A_IsUnicode A_KeyDelay A_Language A_LastError A_LineFile A_LineNumber A_LoopField A_LoopFileAttrib A_LoopFileDir A_LoopFileExt A_LoopFileFullPath A_LoopFileLongPath A_LoopFileName A_LoopFileShortName A_LoopFileShortPath A_LoopFileSize A_LoopFileSizeKB A_LoopFileSizeMB A_LoopFileTimeAccessed A_LoopFileTimeCreated A_LoopFileTimeModified A_LoopReadLine A_LoopRegKey A_LoopRegName A_LoopRegSubkey A_LoopRegTimeModified A_LoopRegType A_MDAY A_Min A_MM A_MMM A_MMMM A_Mon A_MouseDelay A_MSec A_MyDocuments A_Now A_NowUTC A_NumBatchLines A_OSType A_OSVersion A_PriorHotkey A_ProgramFiles A_Programs A_ProgramsCommon A_PtrSize A_ScreenHeight A_ScreenWidth A_ScriptDir A_ScriptFullPath A_ScriptName A_Sec A_Space A_StartMenu A_StartMenuCommon A_Startup A_StartupCommon A_StringCaseSense A_Tab A_Temp A_ThisFunc A_ThisHotkey A_ThisLabel A_ThisMenu A_ThisMenuItem A_ThisMenuItemPos A_TickCount A_TimeIdle A_TimeIdlePhysical A_TimeSincePriorHotkey A_TimeSinceThisHotkey A_TitleMatchMode A_TitleMatchModeSpeed A_UserName A_WDay A_WinDelay A_WinDir A_WorkingDir A_YDay A_YEAR A_YWeek A_YYYY true false"
,Commands:"AutoTrim BlockInput Click ClipWait Control ControlClick ControlFocus ControlGet ControlGetFocus ControlGetPos ControlGetText ControlMove ControlSend ControlSetText CoordMode DetectHiddenText DetectHiddenWindows Drive DriveGet DriveSpaceFree Edit EnvAdd EnvDiv EnvGet EnvMult EnvSet EnvSub EnvUpdate FileAppend FileCopy FileCopyDir FileCreateDir FileCreateShortcut FileDelete FileEncoding FileInstall FileGetAttrib FileGetShortcut FileGetSize FileGetTime FileGetVersion FileMove FileMoveDir FileOpen FileRead FileReadLine FileRecycle FileRecycleEmpty FileRemoveDir FileSelectFile FileSelectFolder FileSetAttrib FileSetTime FormatTime GetKeyState GroupActivate GroupAdd GroupClose GroupDeactivate Gui GuiControl GuiControlGet Hotkey ImageSearch IniDelete IniRead IniWrite Input InputBox KeyHistory KeyWait ListHotkeys ListLines ListVars #LTrim Menu MouseClick MouseClickDrag MouseGetPos MouseMove MsgBox OnClipboardChange OutputDebug Pause PixelGetColor PixelSearch PostMessage Process Progress Random RegDelete RegRead RegWrite Reload Run RunAs RunWait Sleep Send SendRaw SendInput SendPlay SendLevel SendMessage SendMode SetCapslockState SetControlDelay SetDefaultMouseSpeed SetEnv SetFormat SetKeyDelay SetMouseDelay SetNumlockState SetScrollLockState SetRegView SetStoreCapslockMode SetTitleMatchMode SetWinDelay SetWorkingDir Shutdown Sort SoundBeep SoundGet SoundGetWaveVolume SoundPlay SoundSet SoundSetWaveVolume SplashImage SplashTextOn SplashTextOff SplitPath StatusBarGetText StatusBarWait StringCaseSense StringGetPos StringLeft StringLen StringLower StringMid StringReplace StringRight StringSplit StringTrimLeft StringTrimRight StringUpper SysGet ToolTip Transform TrayTip Trim UrlDownloadToFile WinActivate WinActivateBottom WinClose WinGetActiveStats WinGetActiveTitle WinGetClass WinGet WinGetPos WinGetText WinGetTitle WinHide WinKill WinMaximize WinMenuSelectItem WinMinimize WinMinimizeAll WinMinimizeAll Undo WinMove WinRestore WinSet WinSetTitle WinShow WinWait WinWaitActive WinWaitClose WinWaitNotActive"
,Functions:"Abs Asc ACos ASin ATan Ceil Chr ComObjActive ComObjArray ComObjConnect ComObjCreate ComObjEnwrap ComObjError ComObjFlags ComObjGet ComObjMissing ComObjParameter ComObjQuery ComObjType ComObjValue Cos DllCall Exp FileExist Floor Func GetKeyName GetKeySC GetKeyVK InStr InStr InStr IsByRef IsFunc IsLabel IsObject Ln Log Mod NumGet NumPut OnMessage RegExMatch RegExReplace RegisterCallback Round Sin Sqrt StrGet StrLen StrPut StrSplit SubStr Tan VarSetCapacity WinExist"
,Keywords:"Abort AboveNormal Add ahk_class ahk_group ahk_id ahk_pid All alnum alpha AltDown AltSubmit AltTab AltTabAndMenu AltTabMenu AltTabMenuDismiss AltUp AlwaysOnTop and AutoHDR AutoSize Background BackgroundTrans BelowNormal between BitAnd BitNot BitOr BitShiftLeft BitShiftRight BitXOr Blind bold Border Bottom Button Buttons ByRef Cancel Capacity Caption Center Check Check3 Checkbox Checked CheckedGray Choose ChooseString Clipboard ClipboardAll Close Color ComboBox ComSpec contains ControlList Count CtrlDown CtrlUp date DateTime Days DDL Default DeleteAll Delimiter Deref Destroy digit Disable Disabled DropDownList Eject Enable Enabled Error ErrorLevel Exist Expand ExStyle FileSystem First Flash Float FloatFast Focus Font FromCodePage global Grid Group GroupBox GuiClose GuiContextMenu GuiDropFiles GuiEscape GuiSize Hdr Hidden Hide High HKCC HKCR HKCU HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS HKLM HKU Hours HScroll Icon IconSmall ID IDLast Ignore ImageList in Integer IntegerFast Interrupt italic Join Label LastFound LastFoundExist Limit Lines List ListBox ListView local LocalSameAsGlobal Lock Logoff Low lower Lowercase MainWindow Margin Maximize MaximizeBox MaxSize Minimize MinimizeBox MinMax MinSize Minutes MonthCal Mouse Move Multi NA No NoActivate NoDefault NoHide NoIcon NoMainWindow norm Normal NoSort NoSortHdr NoStandard not NoTab NoTimers number Off Ok On or OwnDialogs Owner Parse Password Pic Picture Pixel Pos Pow Priority ProcessName ProgramFiles Radio Range Raw Read ReadOnly Realtime Redraw REG_BINARY REG_DWORD REG_EXPAND_SZ REG_MULTI_SZ REG_SZ Region Relative Remove Rename Report Resize Restore Retry RGB RWinDown RWinUp Screen Seconds Section Select Serial SetLabel ShiftAltTab ShiftDown ShiftUp Show Single Slider SortDesc ss Standard static Status StatusBar StatusCD strike Style Submit SysMenu Tab2 TabStop Text Theme Tile time Tip ToCodePage ToggleCheck ToggleEnable ToolWindow Top Topmost TransColor Transparent Tray TreeView TryAgain Type UnCheck underline Unicode Unlock UpDown upper Uppercase UseEnv UseErrorLevel UseUnsetGlobal UseUnsetLocal Vis VisFirst Visible VScroll Wait WaitClose WantCtrlA WantF2 WantReturn WinMinimizeAllUndo Wrap xdigit xm xp xs Yes ym yp ys"
,Flow:"Break Continue Critical Exit ExitApp Gosub Goto OnExit Pause return SetBatchLines SetTimer Suspend Thread Throw Until"}


File := RegExReplace(Plugin.Params.Remove(1), "\R", "`n")
Regexes := {"([+*!~&/<>^|=?:,.%(){}\[\]\-]+)": Chr(12)
, "m`n)^(\s*#[^\s,\R]+)": Chr(09), "\b(0x[0-9A-Fa-f]+|\d+)\b": Chr(07)}
for Regex, NewColor in Regexes
	File := RegExReplace(File, Regex, Chr(3) NewColor "$1" Chr(15))

for Type, Words in Commands
{
	if Type in Flow,Indent
		NewColor := 13
	else
		NewColor := 10
	
	StringReplace, Words, Words, %A_Space%, |, All
	File := RegExReplace(File, "i)\b(" Words ")\b", Chr(3) Chr(NewColor) "$1" Chr(15))
}

File := StrSplit(File)
Quoted := false, Commented := false
Last := "`n" ; This lets me put comments and similar on the first line in the file.
While ((Char := File.Remove(1)) != "")
{
	if (Asc(Char) == 3)
	{
		NewColor := Asc(File.Remove(1))
		if (!Quoted && !Commented)
			Out .= Chr(3) Format("{:02d}", NewColor)
	}
	else if (Asc(Char) == 15)
	{
		if (!Quoted && !Commented)
			Out .= Chr(15)
	}
	else
	{
		if (Char == "`n")
			Quoted := False, Commented := False, Out .= Chr(15)
		else if (Char == """" && !Commented)
			Quoted := !Quoted, Out .= Chr(3) "04"
		else if (Char == ";" && InStr(" `t`n", Last))
			Commented := True, Quoted := False, Out .= Chr(3) "03"
		
		Out .= Char
		
		if (Char == """" && !Commented && !Quoted)
			Out .= Chr(15)
		
		Last := Char
	}
}

Chat(Channel, PRIVMSG.Nick ": " Out)
ExitApp
