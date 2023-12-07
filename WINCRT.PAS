{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/TPW4TPLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit WinCrt;

{$S-}

INTERFACE

Uses WinTypes;

Const
 WindowOrg:TPoint=(X:cw_UseDefault;Y:cw_UseDefault);
 WindowSize:TPoint=(X:cw_UseDefault;Y:cw_UseDefault);
 ScreenSize:TPoint=(X:80;Y:25);
 Cursor:TPoint=(X:0;Y:0);
 Origin:TPoint=(X:0;Y:0);
 InactiveTitle:PChar='(Inactif %s)';
 AutoTracking:Boolean=True;
 CheckEOF:Boolean=False;
 CheckBreak:Boolean=True;

Var
 WindowTitle:Array[0..79]of Char;

Procedure AssignCrt(Var F:Text);
Procedure ClrEol;
Procedure ClrScr;
Procedure CursorTo(X,Y:Integer);
Procedure DoneWinCrt;
Procedure InitWinCrt;
Procedure GotoXY(X,Y:Integer);
Function  KeyPressed: Boolean;
Function  ReadKey:Char;
Function  ReadBuf(Buffer:PChar;Count:Word):Word;
Procedure ScrollTo(X,Y:Integer);
Procedure TrackCursor;
Function  WhereX:Integer;
Function  WhereY:Integer;
Procedure WriteBuf(Buffer:PChar;Count:Word);
Procedure WriteChar(Ch:Char);

IMPLEMENTATION

Uses Crt;

Procedure InitWinCrt;Begin
End;

Procedure DoneWinCrt;Begin
End;

Procedure WriteBuf(Buffer:PChar;Count:Word);Begin
End;

Procedure WriteChar(Ch:Char);Begin
 Write(Ch);
End;

Function KeyPressed:Boolean;Begin
 KeyPressed:=Crt.KeyPressed;
End;

Function ReadKey:Char;Begin
 ReadKey:=Crt.ReadKey;
End;

Function ReadBuf(Buffer:PChar;Count:Word):Word;Begin
End;

Procedure GotoXY(X,Y:Integer);Begin
 Crt.GotoXY(X,Y);
End;

Function WhereX:Integer;Begin
 WhereX:=Crt.WhereX;
End;

Function WhereY:Integer;Begin
 WhereY:=Crt.WhereY;
End;

Procedure ClrScr;Begin
 Crt.ClrScr;
End;

Procedure ClrEol;Begin
 Crt.ClrEol;
End;

Procedure CursorTo(X,Y:Integer);Begin
 GotoXY(X+1,Y+1);
End;

Procedure ScrollTo(X,Y:Integer);Begin
End;

Procedure TrackCursor;Begin
End;

Procedure AssignCrt(Var F:Text);Begin
End;

END.