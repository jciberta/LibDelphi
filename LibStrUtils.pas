unit LibStrUtils;

interface

uses
    Classes, SysUtils;

function Split(sText: string; cDelimiter: Char): TStringList;

implementation

function Split(sText: string; cDelimiter: Char): TStringList;
var
    ListOfStrings: TStringList;
begin
    ListOfStrings := TStringList.Create;
    ListOfStrings.Delimiter := cDelimiter;
    ListOfStrings.DelimitedText := sText;
    Result := ListOfStrings;
end;

end.

