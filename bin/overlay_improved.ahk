;Take note, you need to set PATH_OVERLAY to your dx9_overlay.dll in GetProcAddress function (below the comment wall)
#NoEnv 
 
;If we allow a configurable PATH_OVERLAY, Autohotkey will not be able to preload our functions before runtime.
;For performance, the original author finds the function addresses of everything at the start of the script
;To match this behavior without globals means ideally all of the function addresses will be made static
;But static expressions are evaluated before runtime/autoexec section, so the business of loading dx9_overlay.dll
;must be done in a function, including resolving PATH_OVERLAY, to ensure it is ready for GetProcAddress.
;An alternative is to declare each function address static, and check if it needs to be looked up at runtime, but this adds
;an if-then branch to every function call...
;A final option is to just let AHK look up function addresses, while we preload dx_overlay.dll. (LoadLibrary being the long call
;we'd like to avoid having AHK do, since it will pair it with FreeLibrary after each DllCall)
 
;I chose the first option as it took minimal code changes, and keeps similar performance compared to the original.
;Which leads to this somewhat awkward situation, where you need to set PATH_OVERLAY in the body of this function...
GetProcAddress(fn)
{
	static PATH_OVERLAY := RelToAbs(A_ScriptDir, "bin\dx9_overlay.dll")
	static hModule 
	if (!hModule)
	{
		hModule := DllCall("LoadLibrary", Str, PATH_OVERLAY)
		if(hModule == -1 || hModule == 0)
		{
			MsgBox, 48, Error, The dll-file couldn't be found!
			ExitApp
		}
	}
	return DllCall("GetProcAddress", UInt, hModule, AStr, fn)	
}
 
Init()
{ ;What are the chances of this being called more than once?
	static Init_func := GetProcAddress("Init")
	res := DllCall(Init_func)
	return res
}
 
SetParam(str_Name, str_Value)
{
	static SetParam_func := GetProcAddress("SetParam")
	res := DllCall(SetParam_func, AStr, str_Name, AStr, str_Value)
	;return res  SetParam returns void
}
 
;Cool note: Seems you can change the text color inline with {RRGGBB}
;Ex: "This is {FF0000}red"
TextCreate(Font, fontsize, bold, italic, x, y, color, text, shadow, show)
{
	static TextCreate_func := GetProcAddress("TextCreate")
	res := DllCall(TextCreate_func,AStr,Font,Int,fontsize,UChar,bold,UChar,italic,Int,x,Int,y,UInt,color,AStr,text,UChar,shadow,UChar,show)
	return res
}
 
TextDestroy(id)
{
	static TextDestroy_func := GetProcAddress("TextDestroy")
	res := DllCall(TextDestroy_func,Int,id)
	return res
}
 
TextSetShadow(id, shadow)
{
	static TextSetShadow_func := GetProcAddress("TextSetShadow")
	res := DllCall(TextSetShadow_func,Int,id,UChar,shadow)
	return res
}
 
TextSetShown(id, show)
{
	static TextSetShown_func := GetProcAddress("TextSetShown")
	res := DllCall(TextSetShown_func,Int,id,UChar,show)
	return res
}
 
TextSetColor(id,color)
{
	static TextSetColor_func := GetProcAddress("TextSetColor")
	res := DllCall(TextSetColor_func,Int,id,UInt,color)
	return res
}
 
TextSetPos(id,x,y)
{
	static TextSetPos_func := GetProcAddress("TextSetPos")
	res := DllCall(TextSetPos_func,Int,id,Int,x,Int,y)
	return res
}
 
TextSetString(id,Text)
{
	static TextSetString_func := GetProcAddress("TextSetString")
	res := DllCall(TextSetString_func,Int,id,AStr,Text)
	return res
}
 
TextUpdate(id,Font,Fontsize,bold,italic)
{
	static TextUpdate_func := GetProcAddress("TextUpdate")
	res := DllCall(TextUpdate_func,Int,id,AStr,Font,int,Fontsize,UChar,bold,UChar,italic)
	return res
}	
 
BoxCreate(x,y,width,height,Color,show)
{
	static BoxCreate_func := GetProcAddress("BoxCreate")
	res := DllCall(BoxCreate_func,Int,x,Int,y,Int,width,Int,height,UInt,Color,UChar,show)
	return res
}
 
BoxDestroy(id)
{
	static BoxDestroy_func := GetProcAddress("BoxDestroy")
	res := DllCall(BoxDestroy_func,Int,id)
	return res
}
 
BoxSetShown(id,Show)
{
	static BoxSetShown_func := GetProcAddress("BoxSetShown")
	res := DllCall(BoxSetShown_func,Int,id,UChar,Show)
	return res
}
 
BoxSetBorder(id,height,Show)
{
	static BoxSetBorder_func := GetProcAddress("BoxSetBorder")
	res := DllCall(BoxSetBorder_func,Int,id,Int,height,Int,Show)
	return res
}
 
 
BoxSetBorderColor(id,Color)
{
	static BoxSetBorderColor_func := GetProcAddress("BoxSetBorderColor")
	res := DllCall(BoxSetBorderColor_func,Int,id,UInt,Color)
	return res
}
 
BoxSetColor(id,Color)
{
	static BoxSetColor_func := GetProcAddress("BoxSetColor")
	res := DllCall(BoxSetColor_func,Int,id,UInt,Color)
	return res
}
 
BoxSetHeight(id,height)
{
	static BoxSetHeight_func := GetProcAddress("BoxSetHeight")
	res := DllCall(BoxSetHeight_func,Int,id,Int,height)
	return res
}
 
BoxSetPos(id,x,y)
{
	static BoxSetPos_func	:= GetProcAddress("BoxSetPos")
	res := DllCall(BoxSetPos_func,Int,id,Int,x,Int,y)
	return res
}
 
BoxSetWidth(id,width)
{
	static BoxSetWidth_func := GetProcAddress("BoxSetWidth")
	res := DllCall(BoxSetWidth_func,Int,id,Int,width)
	return res
}
 
LineCreate(x1,y1,x2,y2,width,color,show)
{
	static LineCreate_func := GetProcAddress("LineCreate")
	res := DllCall(LineCreate_func,Int,x1,Int,y1,Int,x2,Int,y2,Int,Width,UInt,color,UChar,show)
	return res
}
 
LineDestroy(id)
{
	static LineDestroy_func := GetProcAddress("LineDestroy")
	res := DllCall(LineDestroy_func,Int,id)
	return res
}
 
LineSetShown(id,show)
{
	static LineSetShown_func := GetProcAddress("LineSetShown")
	res := DllCall(LineSetShown_func,Int,id,UChar,show)
	return res
}
 
LineSetColor(id,color)
{
	static LineSetColor_func := GetProcAddress("LineSetColor")
	res := DllCall(LineSetColor_func,Int,id,UInt,color)
	return res
}
 
LineSetWidth(id, width)
{
	static LineSetWidth_func := GetProcAddress("LineSetWidth")
	res := DllCall(LineSetWidth_func,Int,id,Int,width)
	return res
}
 
LineSetPos(id,x1,y1,x2,y2)
{
	static LineSetPos_func := GetProcAddress("LineSetPos")
	res := DllCall(LineSetPos_func,Int,id,Int,x1,Int,y1,Int,x2,Int,y2)
	return res
}
 
ImageCreate(path, x, y, rotation, align, show)
{
	static ImageCreate_func := GetProcAddress("ImageCreate")
	res := DllCall(ImageCreate_func, AStr, path, Int, x, Int, y, Int, rotation, Int, align, UChar, show)
	return res
}
 
ImageDestroy(id)
{
	static ImageDestroy_func := GetProcAddress("ImageDestroy")
	res := DllCall(ImageDestroy_func,Int,id)
	return res
}
 
ImageSetShown(id,show)
{
	static ImageSetShown_func := GetProcAddress("ImageSetShown")
	res := DllCall(ImageSetShown_func,Int,id,UChar,show)
	return res
}
 
ImageSetAlign(id,align)
{
	static ImageSetAlign_func := GetProcAddress("ImageSetAlign")
	res := DllCall(ImageSetAlign_func,Int,id,Int,align)
	return res
}
 
ImageSetPos(id, x, y)
{
	static ImageSetPos_func := GetProcAddress("ImageSetPos")
	res := DllCall(ImageSetPos_func,Int,id,Int,x, Int, y)
	return res
}
 
ImageSetRotation(id, rotation)
{
	static ImageSetRotation_func := GetProcAddress("ImageSetRotation")
	res := DllCall(ImageSetRotation_func,Int,id,Int, rotation)
	return res
}
 
DestroyAllVisual()
{
	static DestroyAllVisual_func := GetProcAddress("DestroyAllVisual")
	res := DllCall(DestroyAllVisual_func)
	return res 
}
 
ShowAllVisual()
{
	static ShowAllVisual_func := GetProcAddress("ShowAllVisual")
	res := DllCall(ShowAllVisual_func)
	return res
}
 
HideAllVisual()
{
	static HideAllVisual_func := GetProcAddress("HideAllVisual")
	res := DllCall(HideAllVisual_func )
	return res
}
 
GetFrameRate()
{
	static GetFrameRate_func := GetProcAddress("GetFrameRate")
	res := DllCall(GetFrameRate_func )
	return res
}

SetCalculationRatio(width, height)
{
	static SetCalculationRatio_func := GetProcAddress("SetCalculationRatio")
	res := DllCall(SetCalculationRatio_func, Int, width, Int, height)
	return res
}

GetScreenSpecs(ByRef width, ByRef height)
{ ;If he can get the screen size, why limit coordinates to 800x600?
	static GetScreenSpecs_func := GetProcAddress("GetScreenSpecs")
	res := DllCall(GetScreenSpecs_func, IntP, width, IntP, height)
	return res
}
 
RelToAbs(root, dir, s = "\") {
	pr := SubStr(root, 1, len := InStr(root, s, "", InStr(root, s . s) + 2) - 1)
		, root := SubStr(root, len + 1), sk := 0
	If InStr(root, s, "", 0) = StrLen(root)
		StringTrimRight, root, root, 1
	If InStr(dir, s, "", 0) = StrLen(dir)
		StringTrimRight, dir, dir, 1
	Loop, Parse, dir, %s%
	{
		If A_LoopField = ..
			StringLeft, root, root, InStr(root, s, "", 0) - 1
		Else If A_LoopField =
			root =
		Else If A_LoopField != .
			Continue
		StringReplace, dir, dir, %A_LoopField%%s%
	}
	Return, pr . root . s . dir
}