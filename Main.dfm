object Form1: TForm1
  Left = 659
  Top = 202
  Width = 602
  Height = 442
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 35
    Height = 13
    Caption = 'Output:'
  end
  object edtOutput: TEdit
    Left = 72
    Top = 20
    Width = 489
    Height = 21
    TabOrder = 0
  end
  object btnGetCurrentUserName: TButton
    Left = 16
    Top = 64
    Width = 121
    Height = 25
    Caption = 'GetCurrentUserName'
    TabOrder = 1
    OnClick = btnGetCurrentUserNameClick
  end
  object btnGetCpuSpeed: TButton
    Left = 152
    Top = 64
    Width = 89
    Height = 25
    Caption = 'GetCpuSpeed'
    TabOrder = 2
    OnClick = btnGetCpuSpeedClick
  end
  object btnGetVolumeName: TButton
    Left = 256
    Top = 64
    Width = 97
    Height = 25
    Caption = 'GetVolumeName'
    TabOrder = 3
    OnClick = btnGetVolumeNameClick
  end
  object btnHasCoProcessor: TButton
    Left = 368
    Top = 64
    Width = 97
    Height = 25
    Caption = 'HasCoProcessor'
    TabOrder = 4
    OnClick = btnHasCoProcessorClick
  end
end
