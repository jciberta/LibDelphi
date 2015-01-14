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
            'À', 'Á', 'Ä', 'Â': sText[i] := 'A';
            'È', 'É', 'Ë', 'Ê': sText[i] := 'E';
            'Ì', 'Í', 'Ï', 'Î': sText[i] := 'I';
            'Ò', 'Ó', 'Ö', 'Ô': sText[i] := 'O';
            'Ù', 'Ú', 'Ü', 'Û': sText[i] := 'U';
            'à', 'á', 'ä', 'â': sText[i] := 'a';
            'è', 'é', 'ë', 'ê': sText[i] := 'e';
            'ì', 'í', 'ï', 'î': sText[i] := 'i';
            'ò', 'ó', 'ö', 'ô': sText[i] := 'o';
            'ù', 'ú', 'ü', 'û': sText[i] := 'u';
            // Consonants
            'Ç': sText[i] := 'C';
            'ç': sText[i] := 'c';
            'Ñ': sText[i] := 'N';
            'ñ': sText[i] := 'n';
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

