unit LibSysUtils;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, ExtCtrls, FileCtrl, Buttons, ShlObj, Math, Jpeg, ShellAPI,
    OleCtrls, isp3, Db, DBTables, DBCtrls;

function GetCpuSpeed: Comp;
function GetCurrentUserName: string;
function GetVolumeName(DriveLetter: Char): string;
function HasCoProcessor: boolean;

implementation

uses Registry, MMSystem, DDEMAN, ClipBrd;

function GetCpuSpeed: Comp;
{ function to return the CPU clock speed only.                                     }
{ Usage: MessageDlg(Format('%.1f MHz', [GetCpuSpeed]), mtConfirmation, [mbOk], 0); }
var
    t: DWORD;
    mhi, mlo, nhi, nlo: DWORD;
    t0, t1, chi, clo, shr32: Comp;
begin
    shr32 := 65536;
    shr32 := shr32 * 65536;

    t := GetTickCount;
    while t = GetTickCount do
    begin
    end;
    asm
        DB 0FH
        DB 031H
        mov mhi,edx
        mov mlo,eax
    end;

    while GetTickCount < (t + 1000) do
    begin
    end;
    asm
        DB 0FH
        DB 031H
        mov nhi,edx
        mov nlo,eax
    end;

    chi := mhi;
    if mhi < 0 then
        chi := chi + shr32;

    clo := mlo;
    if mlo < 0 then
        clo := clo + shr32;

    t0 := chi * shr32 + clo;

    chi := nhi;
    if nhi < 0 then
        chi := chi + shr32;

    clo := nlo;
    if nlo < 0 then
        clo := clo + shr32;

    t1 := chi * shr32 + clo;

    Result := (t1 - t0) / 1E6;
end;

function GetCurrentUserName: string;
var
    Len: Cardinal;
begin
    Len := 255;
    SetLength(Result, Len - 1);
    if GetUserName(PChar(Result), Len) then
        SetLength(Result, Len - 1)
    else
        RaiseLastWin32Error;
end;

function GetVolumeName(DriveLetter: Char): string;
// From http://www.swissdelphicenter.ch/torry/showcode.php?id=153
// Does not work on Windows 8.1
var
    dummy: DWORD;
    buffer: array[0..MAX_PATH] of Char;
    oldmode: LongInt;
begin
    oldmode := SetErrorMode(SEM_FAILCRITICALERRORS);
    try
        GetVolumeInformation(PChar(DriveLetter + ':\'), buffer, SizeOf(buffer), nil, dummy, dummy, nil, 0);
        Result := StrPas(buffer);
    finally
        SetErrorMode(oldmode);
    end;
end;

function HasCoProcessor: boolean;
{$IFDEF WIN32}
var
    TheKey: hKey;
{$ENDIF}
begin
    Result := true;
{$IFNDEF WIN32}
    if GetWinFlags and Wf_80x87 = 0 then
        Result := false;
{$ELSE}
    if RegOpenKeyEx(HKEY_LOCAL_MACHINE,
        'HARDWARE\DESCRIPTION\System\FloatingPointProcessor',
        0,
        KEY_EXECUTE,
        TheKey) <> ERROR_SUCCESS then
        result := false;
    RegCloseKey(TheKey);
{$ENDIF}
end;

end.

