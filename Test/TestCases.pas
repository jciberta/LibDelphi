unit TestCases;

interface

uses
    TestFrameWork;

type
    TTestLibStrUtils = class(TTestCase)
    published
        procedure TestReplaceSpecialChars;
        procedure TestSplit;
    end;

implementation

uses Classes, LibStrUtils;

procedure TTestLibStrUtils.TestReplaceSpecialChars;
begin
    Check(ReplaceSpecialChars('Français') = 'Francais', 'Error in ReplaceSpecialChars 1');
    Check(ReplaceSpecialChars('Cafè') = 'Cafe', 'Error in ReplaceSpecialChars 2');
end;

procedure TTestLibStrUtils.TestSplit;
var
    sl: TStringList;
begin
    Check(Split('Peter Edward Smith', #32)[0] = 'Peter', 'Error in Split 1');
    Check(Split('Peter Edward Smith', #32)[1] = 'Edward', 'Error in Split 2');
    Check(Split('Peter Edward Smith', #32)[2] = 'Smith', 'Error in Split 3');
    Check(Split('Peter,Edward,Smith', ',')[0] = 'Peter', 'Error in Split 4');
    Check(Split('Peter:Edward,Smith', ':')[0] = 'Peter', 'Error in Split 5');
    Check(Split('Peter:Edward,Smith', ',')[0] = 'Peter:Edward', 'Error in Split 6');
end;

initialization
    TestFramework.RegisterTest(TTestLibStrUtils.Suite);

end.

