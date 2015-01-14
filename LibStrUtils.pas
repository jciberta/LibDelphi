unit LibStrUtils;

interface

uses
    Classes, SysUtils;

function ReplaceSpecialChars(sText: string): string;
function Split(sText: string; cDelimiter: Char): TStringList;

implementation

function ReplaceSpecialChars(sText: string): string;
var
    i: integer;
begin
    for i:= 1 to Length(sText) do
    begin
        case (sText[i]) of
            // Vowels
            '�', '�', '�', '�': sText[i] := 'A';
            '�', '�', '�', '�': sText[i] := 'E';
            '�', '�', '�', '�': sText[i] := 'I';
            '�', '�', '�', '�': sText[i] := 'O';
            '�', '�', '�', '�': sText[i] := 'U';
            '�', '�', '�', '�': sText[i] := 'a';
            '�', '�', '�', '�': sText[i] := 'e';
            '�', '�', '�', '�': sText[i] := 'i';
            '�', '�', '�', '�': sText[i] := 'o';
            '�', '�', '�', '�': sText[i] := 'u';
            // Consonants
            '�': sText[i] := 'C';
            '�': sText[i] := 'c';
            '�': sText[i] := 'N';
            '�': sText[i] := 'n';
        end;
    end;
    result := sText;
end;

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

