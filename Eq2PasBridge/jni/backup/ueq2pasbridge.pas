unit ueq2pasbridge;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, {SysUtils,} jni, jnihelper, e2eq;
  
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
    eq2Solver.solver(a,b,c);
    Result:= eq2Solver.getFdelta();
end;
  
function TNoGUIAndroidModule1.getX(delta: single; b: integer; c: integer
  ): TDynArrayOfSingle;
var
  x: TDynArrayOfSingle;
begin
    SetLength(x,2); //aloca x
    x.


end;
  

  
end.
