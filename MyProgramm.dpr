program MyProgramm;

uses
  Forms,
  MyUnit in 'MyUnit.pas' {frmMain},
  Unit30zad in 'Unit30zad.pas',
  Unit40zad in 'Unit40zad.pas',
  Unit50zad in 'Unit50zad.pas',
  UnitResult in 'UnitResult.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÏÑ "ÖÒ"';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
