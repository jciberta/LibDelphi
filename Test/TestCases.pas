unit TestCases;

interface

uses
    TestFrameWork;

type
    TTestLibStrUtils = class(TTestCase)
    published
        procedure TestSplit;
    end;

implementation

uses Classes, LibStrUtils;

procedure TTestLibStrUtils.TestSplit;
var
    sl: TStringList;
begin
    Check(Split('Peter Edward Smith', #32)[0] = 'Peter', 'Error in Split');
    Check(Split('Peter Edward Smith', #32)[1] = 'Edward', 'Error in Split');
    Check(Split('Peter Edward Smith', #32)[2] = 'Smith', 'Error in Split');
    Check(Split('Peter,Edward,Smith', ',')[0] = 'Peter', 'Error in Split');
    Check(Split('Peter:Edward,Smith', ':')[0] = 'Peter', 'Error in Split');
    Check(Split('Peter:Edward,Smith', ',')[0] = 'Peter:Edward', 'Error in Split');
end;

initialization
    TestFramework.RegisterTest(TTestLibStrUtils.Suite);

end.

