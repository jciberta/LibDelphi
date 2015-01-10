unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edtOutput: TEdit;
    Label1: TLabel;
    btnGetCurrentUserName: TButton;
    btnGetCpuSpeed: TButton;
    btnGetVolumeName: TButton;
    btnHasCoProcessor: TButton;
    procedure btnGetCurrentUserNameClick(Sender: TObject);
    procedure btnGetCpuSpeedClick(Sender: TObject);
    procedure btnGetVolumeNameClick(Sender: TObject);
    procedure btnHasCoProcessorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses LibSysUtils;

procedure TForm1.btnGetCurrentUserNameClick(Sender: TObject);
begin
    edtOutput.Text := GetCurrentUserName;
end;

procedure TForm1.btnGetCpuSpeedClick(Sender: TObject);
begin
    edtOutput.Text := FloatToStr(GetCpuSpeed) + ' MHz';
end;

procedure TForm1.btnGetVolumeNameClick(Sender: TObject);
begin
    edtOutput.Text := GetVolumeName('c');
end;

procedure TForm1.btnHasCoProcessorClick(Sender: TObject);
begin
    if HasCoProcessor then
       edtOutput.Text := 'Has CoProcessor'
    else
        edtOutput.Text := 'No CoProcessor. Windows Emulation Mode';
end;

end.
