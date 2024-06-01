{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit doszae2eq;

{$warn 5023 off : no warning about unused units}
interface

uses
  e2eq, uedeltanegativo, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('e2eq', @e2eq.Register);
end;

initialization
  RegisterPackage('doszae2eq', @Register);
end.
