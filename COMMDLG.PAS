{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/TPW4TPLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit COMMDLG;

INTERFACE

Uses WinTypes;

Const
 ofn_ReadOnly=$00000001;
 ofn_OverWritePrompt=$00000002;
 ofn_HideReadOnly=$00000004;
 ofn_NoChangeDir=$00000008;
 ofn_ShowHelp=$00000010;
 ofn_EnableHook=$00000020;
 ofn_EnableTemplate=$00000040;
 ofn_EnableTemplateHandle=$00000080;
 ofn_NoValidate=$00000100;
 ofn_AllowMultiSelect=$00000200;
 ofn_ExtentionDifferent=$00000400;
 ofn_PathMustExist=$00000800;
 ofn_FileMustExist=$00001000;
 ofn_CreatePrompt=$00002000;
 ofn_ShareAware=$00004000;
 ofn_NoReadOnlyReturn=$00008000;
 ofn_NoTextFileCreate=$00010000;
 ofn_ShareFallThrough=2;
 ofn_ShareNoWarn=1;
 ofn_ShareWarn=0;
 cc_RGBInit=$00000001;
 cc_FullOpen=$00000002;
 cc_PreventFullOpen=$00000004;
 cc_ShowHelp=$00000008;
 cc_EnableHook=$00000010;
 cc_EnableTemplate=$00000020;
 cc_EnableTemplateHandle=$00000040;
 fr_Down=$00000001;
 fr_WholeWord=$00000002;
 fr_MatchCase=$00000004;
 fr_FindNext=$00000008;
 fr_Replace=$00000010;
 fr_ReplaceAll=$00000020;
 fr_DialogTerm=$00000040;
 fr_ShowHelp=$00000080;
 fr_EnableHook=$00000100;
 fr_EnableTemplate=$00000200;
 fr_NoUpDown=$00000400;
 fr_NoMatchCase=$00000800;
 fr_NoWholeWord=$00001000;
 fr_EnableTemplateHandle=$00002000;
 fr_HideUpDown=$00004000;
 fr_HideMatchCase=$00008000;
 fr_HideWholeWord=$00010000;
 cf_ScreenFonts=$00000001;
 cf_PrinterFonts=$00000002;
 cf_Both=cf_ScreenFonts or cf_PrinterFonts;
 cf_ShowHelp=$00000004;
 cf_EnableHook=$00000008;
 cf_EnableTemplate=$00000010;
 cf_EnableTemplateHandle=$00000020;
 cf_InitToLogfontStruct=$00000040;
 cf_UseStyle=$00000080;
 cf_Effects=$00000100;
 cf_Apply=$00000200;
 cf_AnsiOnly=$00000400;
 cf_NoVectorFonts=$00000800;
 cf_NoOEMFonts=cf_NoVectorFonts;
 cf_NoSimulations=$00001000;
 cf_LimitSize=$00002000;
 cf_FixedPitchOnly=$00004000;
 cf_WYSIWYG=$00008000;
 cf_ForceFontExist=$00010000;
 cf_ScalableOnly=$00020000;
 cf_TTOnly=$00040000;
 cf_NoFaceSel=$00080000;
 cf_NoStyleSel=$00100000;
 cf_NoSizeSel=$00200000;
 Simulated_FontType=$8000;
 Printer_FontType=$4000;
 Screen_FontType=$2000;
 Bold_FontType=$0100;
 Italic_FontType=$0200;
 Regular_FontType=$0400;
 wm_ChooseFont_GetLogfont=wm_User+1;
 LBSelChString='commdlg_LBSelChangedNotify';
 ShareViString='commdlg_ShareViolation';
 FileOKString='commdlg_FileNameOK';
 ColorOKString='commdlg_ColorOK';
 SetRGBString='commdlg_SetRGBColor';
 FindMsgString='commdlg_FindReplace';
 HelpMsgString='commdlg_help';
 cd_LBSelNoItems=-1;
 cd_LBSelChange=0;
 cd_LBSELSUB=1;
 cd_LBSelAdd=2;
 pd_AllPages=$00000000;
 pd_Selection=$00000001;
 pd_PageNums=$00000002;
 pd_NoSelection=$00000004;
 pd_NoPageNums=$00000008;
 pd_Collate=$00000010;
 pd_PrintToFile=$00000020;
 pd_PrintSetup=$00000040;
 pd_NoWarning=$00000080;
 pd_ReturnDC=$00000100;
 pd_ReturnIC=$00000200;
 pd_ReturnDefault=$00000400;
 pd_ShowHelp=$00000800;
 pd_EnablePrintHook=$00001000;
 pd_EnableSetupHook=$00002000;
 pd_EnablePrintTemplate=$00004000;
 pd_EnableSetupTemplate=$00008000;
 pd_EnablePrintTemplateTHandle=$00010000;
 pd_EnableSetupTemplateTHandle=$00020000;
 pd_UseDevModeCopies=$00040000;
 pd_DisablePrintToFile=$00080000;
 pd_HidePrintToFile=$00100000;
 dn_DefaultPrn=$0001;
 cderr_DialogFailure=$FFFF;
 cderr_GeneralCodes=$0000;
 cderr_StructSize=$0001;
 cderr_Initialization=$0002;
 cderr_NoTemplate=$0003;
 cderr_NoHInstance=$0004;
 cderr_LoadStrFailure=$0005;
 cderr_FindResFailure=$0006;
 cderr_LoadResFailure=$0007;
 cderr_LockResFailure=$0008;
 cderr_MemAllocFailure=$0009;
 cderr_MemLockFailure=$000A;
 cderr_NoHook=$000B;
 cderr_RegisterMsgFail=$000C;
 pderr_PrinterCodes=$1000;
 pderr_SetupFailure=$1001;
 pderr_ParseFailure=$1002;
 pderr_RetDefFailure=$1003;
 pderr_LoadDrvFailure=$1004;
 pderr_GetDevModeFail=$1005;
 pderr_InitFailure=$1006;
 pderr_NoDevices=$1007;
 pderr_NoDefaultPrn=$1008;
 pderr_DNDMMismatch=$1009;
 pderr_CreateICFailure=$100A;
 pderr_PrinterNotFound=$100B;
 pderr_DefaultDifferent=$100C;
 cferr_ChooseFontCodes=$2000;
 cferr_NoFonts=$2001;
 cferr_MaxLessThanMin=$2002;
 fnErr_FilenameCodes=$3000;
 fnErr_SubclassFailure=$3001;
 fnErr_InvalidFilename=$3002;
 fnErr_BufferTooSmall=$3003;
 frErr_FindReplaceCodes=$4000;
 frErr_BufferLengthZero=$4001;
 ccErr_ChooseColorCodes=$5000;

Type
 POpenFilename=^TOpenFilename;
 TOpenFilename=Record
  lStructSize:LongInt;
  hWndOwner:HWnd;
  hInstance:THandle;
  lpstrFilter:PChar;
  lpstrCustomFilter:PChar;
  nMaxCustFilter:LongInt;
  nFilterIndex:LongInt;
  lpstrFile:PChar;
  nMaxFile:LongInt;
  lpstrFileTitle:PChar;
  nMaxFileTitle:LongInt;
  lpstrInitialDir:PChar;
  lpstrTitle:PChar;
  Flags:LongInt;
  nFileOffset:Word;
  nFileExtension:Word;
  lpstrDefExt:PChar;
  lCustData:LongInt;
  lpfnHook:Function(Wnd:HWnd;Msg,wParam:Word;lParam:LongInt):Word;
  lpTemplateName:PChar;
 End;

 PChooseColor=^TChooseColor;
 TChooseColor=Record
  lStructSize:LongInt;
  hWndOwner:HWnd;
  hInstance:HWnd;
  rgbResult:LongInt;
  lpCustColors:PLongInt;
  Flags:LongInt;
  lCustData:Longint;
  lpfnHook:Function(Wnd:HWnd;Message,wParam:Word;lParam:LongInt):Word;
  lpTemplateName:PChar;
 End;

 PFindReplace=^TFindReplace;
 TFindReplace=Record
  lStructSize:LongInt;
  hWndOwner:HWnd;
  hInstance:THandle;
  Flags:LongInt;
  lpstrFindWhat:PChar;
  lpstrReplaceWith:PChar;
  wFindWhatLen:Word;
  wReplaceWithLen:Word;
  lCustData:LongInt;
  lpfnHook:Function(Wnd:HWnd;Msg,wParam:Word;lParam:Longint):Word;
  lpTemplateName: PChar;
 End;

 PChooseFont=^TChooseFont;
 TChooseFont=Record
  lStructSize:LongInt;
  hWndOwner:HWnd;
  hDC:HDC;
  lpLogFont:PLogFont;
  iPointSize:Integer;
  Flags:LongInt;
  rgbColors:LongInt;
  lCustData:LongInt;
  lpfnHook:Function(Wnd:HWnd;Msg,wParam:Word;lParam:LongInt):Word;
  lpTemplateName:PChar;
  hInstance:THandle;
  lpszStyle:PChar;
  nFontType:Word;
  nSizeMin:Integer;
  nSizeMax:Integer;
 End;

 PPrintDlg=^TPrintDlg;
 TPrintDlg=Record
  lStructSize:LongInt;
  hWndOwner:HWnd;
  hDevMode:THandle;
  hDevNames:THandle;
  hDC:HDC;
  Flags:Longint;
  nFromPage:Word;
  nToPage:Word;
  nMinPage:Word;
  nMaxPage:Word;
  nCopies:Word;
  hInstance:THandle;
  lCustData:Longint;
  lpfnPrintHook:Function(Wnd:HWnd;Msg,wParam:Word;lParam:LongInt):Integer;
  lpfnSetupHook:Function(Wnd:HWnd;Msg,wParam:Word;lParam:LongInt):Integer;
  lpPrintTemplateName:PChar;
  lpSetupTemplateName:PChar;
  hPrintTemplate:THandle;
  hSetupTemplate:THandle;
 End;

 PDevNames=^TDevNames;
 TDevNames=Record
  wDriverOffset:Word;
  wDeviceOffset:Word;
  wOutputOffset:Word;
  wDefault:Word;
 End;

Function ChooseColor(Var CC:TChooseColor):Bool;
Function ChooseFont(Var ChooseFond:TChooseFont):Bool;
Function CommDlgExtendedError:LongInt;
Function FindText(Var FindReplace:TFindReplace):HWnd;
Function GetOpenFileName(Var OpenFile:TOpenFilename):Bool;
Function GetSaveFileName(Var OpenFile:TOpenFilename):Bool;
Function GetFileTitle(FileName,Title:PChar;TitleSize:Word):Integer;
Function ReplaceText(Var FindReplace:TFindReplace):HWnd;
Function PrintDlg(Var PrnDlg:TPrintDlg):Boolean;

IMPLEMENTATION

Function GetOpenFileName(Var OpenFile:TOpenFilename):Bool;Begin
End;

Function GetSaveFileName(Var OpenFile:TOpenFilename):Bool;Begin
End;

Function GetFileTitle(FileName,Title:PChar;TitleSize:Word):Integer;Begin
End;

Function ChooseColor(Var CC:TChooseColor):Bool;Begin
End;

Function FindText(Var FindReplace:TFindReplace):HWnd;Begin
End;

Function ReplaceText(Var FindReplace:TFindReplace):HWnd;Begin
End;

Function ChooseFont(Var ChooseFond:TChooseFont):Bool;Begin
End;

Function PrintDlg(Var PrnDlg:TPrintDlg):Boolean;Begin
End;

Function CommDlgExtendedError:LongInt;Begin
End;

END.