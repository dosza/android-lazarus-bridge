unit uedeltanegativo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
    EdeltaNegativo = class (Exception)
      public
        constructor Create( myMessage : string);
end;

implementation
     constructor EdeltaNegativo.Create( myMessage : string);
     begin
          inherited Create(myMessage);
     end;

end.

