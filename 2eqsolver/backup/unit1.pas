unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, e2eq;

type

  { TForm1 }

  TForm1 = class(TForm)
    buttonSolve: TButton;
    e2eq1: Te2eq;
    inputA: TEdit;
    inputB: TEdit;
    inputC: TEdit;
    procedure inputBChange(Sender: TObject);
    procedure inputAChange(Sender: TObject);
    procedure buttonSolveClick(Sender: TObject);
    procedure inputCChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.inputAChange(Sender: TObject);
begin

end;

procedure TForm1.inputBChange(Sender: TObject);
begin

end;

procedure TForm1.buttonSolveClick(Sender: TObject);
 var
   a: integer;
   b: integer;
   c: integer;
begin

     a:= StrToInt(inputA.Text);
     b:= StrToInt(inputB.Text);
     c:= StrToInt(inputC.Text);
     if (e2eq1.solver(a,b,c)) then
         showMessage('S = {' +  FloatToStr(e2eq1.getX1()) + ' , ' + FloatToStr(e2eq1.getX2()) + '}')
     else
       ShowMessage( 'S = {}');
end;

procedure TForm1.inputCChange(Sender: TObject);
begin

end;

end.

