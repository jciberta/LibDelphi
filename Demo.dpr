program Demo;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  LibSysUtils in 'LibSysUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
