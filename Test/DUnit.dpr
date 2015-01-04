program DUnit;

uses
  Forms,
  TestFrameWork,
  GUITestRunner,
  TestCases in 'TestCases.pas',
  LibStrUtils in '..\LibStrUtils.pas';

{$R *.res}

begin
    Application.Initialize;
    GUITestRunner.RunRegisteredTests;
end.

