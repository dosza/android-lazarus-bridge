unit e2eq;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  uedeltanegativo,LResources;

type

  { Te2eq }

  Te2eq = class(TComponent)
  private
         Fa: integer;
         Fb: integer;
         Fc: integer;
         Fdelta: real;
         isSolver: boolean;
  protected

  public

        constructor  Create(AOwner: TComponent);
        function getFdelta():real;
        function getX1():real;
        function getX2():real;

  published
        function solver(a : integer; b : integer ; c: integer ):boolean;

  end;

procedure Register;

implementation

procedure Register;
begin
  {$I e2eq_icon.lrs}
  RegisterComponents('Misc',[Te2eq]);
end;

{ Te2eq }

function Te2eq.getFDelta(): real;
begin
  Result:= Fdelta;
end;

constructor Te2eq.Create(AOwner: TComponent);
begin
  //equivalente ao super do java
  inherited Create(AOwner);
end;

function Te2eq.solver(a: integer; b: integer; c: integer): boolean;
var
  sqrtDelta: real;
begin
  Fa:= a;
  Fb:= b;
  Fc:= c;
  Result:= false;
  FDelta:= b*b - 4*a*c;
  if (fDelta>= 0) then
  begin
    sqrtDelta:= sqrt(Fdelta);
    result:= True;
  end
  else
     raise EdeltaNegativo.Create('Delta < 0 não tem solução');
  end;
  function Te2eq.getX1():real;
  begin
      Result := ( sqrt(Fdelta) -Fb)/(2*Fa);
  end;
  function Te2eq.getX2():real;
  begin
    Result := ( sqrt(FDelta) + Fb)/(2*Fa);
  end;

end.
