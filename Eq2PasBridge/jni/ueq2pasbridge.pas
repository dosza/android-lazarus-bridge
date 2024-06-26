unit ueq2pasbridge;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, {SysUtils,} jni, jnihelper, e2eq,uedeltanegativo;
  
type

  { TNoGUIAndroidModule1 }

  TNoGUIAndroidModule1 = class(TDataModule)
    eq2Solver: Te2eq;
  private
    {private declarations}
  public
    {public declarations}
      
    function isSoluble(a: integer; b: integer; c: integer): boolean;
    function getDelta(a: integer; b: integer; c: integer): single;
    function getX(delta: single; b: integer; c: integer): TDynArrayOfSingle;
    function getX1(delta:single;b:integer;c:integer): single;
    function getX2(delta:single;b:integer;c:integer): single;

  end;

var
  jClassName: string;   //ex.  org/lamw/appnoguidemo1/AcbrJBridges1
  jClassRef: JClass;
  jVMRef: PJavaVM;
  
  NoGUIAndroidModule1: TNoGUIAndroidModule1;

  
implementation
  
{$R *.lfm}
  
function TNoGUIAndroidModule1.isSoluble(a: integer; b: integer; c: integer
  ): boolean;
begin
    //
    Result:= eq2Solver.solver(a,b,c);
end;
  
function TNoGUIAndroidModule1.getDelta(a: integer; b: integer; c: integer
  ): single;
begin
    try
       eq2Solver.solver(a,b,c);
       Result:= eq2Solver.getFdelta();
    Except
      on e: EdeltaNegativo do
      Result:= MaxInt;
    end;
end;
  
function TNoGUIAndroidModule1.getX(delta: single; b: integer; c: integer
  ): TDynArrayOfSingle;
var
  x: TDynArrayOfSingle;
begin
    SetLength(x,2); //aloca x
    x[0]:= eq2Solver.getX1();
    X[1]:= eq2Solver.getX2();
    Result:= x;


end;

function TNoGUIAndroidModule1.getX1(delta:single;b:integer;c:integer): single;
begin
    Result:= eq2Solver.getX1();
end;
function TNoGUIAndroidModule1.getX2(delta:single;b:integer;c:integer): single;
begin
    Result:= eq2Solver.getX2();
end;

  
end.
