unit MyUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, jpeg, Unit30zad, Unit40zad,
  Unit50zad, UnitResult;

type
  TfrmMain = class(TForm)
    pagecontrolMain: TPageControl;
    tabsheetHome: TTabSheet;
    tabsheetTest: TTabSheet;
    labelName: TLabel;
    bitbtnClose: TBitBtn;
    panelBottom: TPanel;
    imgFonHome: TImage;
    tabsheetDiscription: TTabSheet;
    bitbtnStart: TBitBtn;
    bitbtnHome: TBitBtn;
    labelPredmet: TLabel;
    panelPredmet: TPanel;
    btnMatem: TButton;
    btnRussYa: TButton;
    btnBio: TButton;
    btnBelYa: TButton;
    btnFizika: TButton;
    btnHimiya: TButton;
    btnIstorBel: TButton;
    panelTestirovanie: TPanel;
    labelAbitur: TLabel;
    editAbitur: TEdit;
    labelUserBlank: TLabel;
    radbtnRandom: TRadioButton;
    radbtnDownload: TRadioButton;
    labelPredmetName: TLabel;
    btnResult: TButton;
    labelResult: TLabel;
    Image1: TImage;
    bitbtnInstruction: TBitBtn;
    memoInstruction: TMemo;
    labelInstruction: TLabel;
    procedure bitbtnInstructionClick(Sender: TObject);
    procedure btnIstorBelClick(Sender: TObject);
    procedure btnHimiyaClick(Sender: TObject);
    procedure btnFizikaClick(Sender: TObject);
    procedure btnBioClick(Sender: TObject);
    procedure btnBelYaClick(Sender: TObject);
    procedure btnRussYaClick(Sender: TObject);
    procedure btnResultClick(Sender: TObject);
    procedure btnMatemClick(Sender: TObject);
    procedure bitbtnHomeClick(Sender: TObject);
    procedure bitbtnStartClick(Sender: TObject);
    procedure bitbtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}


procedure TfrmMain.bitbtnHomeClick(Sender: TObject);
begin
  pagecontrolMain.ActivePage:=tabsheetHome;
end;

procedure TfrmMain.bitbtnInstructionClick(Sender: TObject);
begin
  pagecontrolMain.ActivePage:=tabsheetDiscription;
end;

procedure TfrmMain.bitbtnStartClick(Sender: TObject);
begin
  pagecontrolMain.ActivePage:=tabsheetTest;
  CreateResult;
end;

procedure TfrmMain.bitbtnCloseClick(Sender: TObject);
Var Res: Integer;
begin
  Res := MessageDlg('Close the program? Your results will not saved.', mtWarning, [mbYes, mbNo], 0);
  if Res = mrYes then
  begin
    if (FloatToStr(Ball)) <> '0' then
      SaveResult;
    frmMain.Close;
  end;
end;

procedure TfrmMain.btnMatemClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='Математика';
end;

procedure TfrmMain.btnRussYaClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='Русский язык';
end;

procedure TfrmMain.btnBelYaClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='Белорусский язык';
end;

procedure TfrmMain.btnBioClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='Биология';
end;

procedure TfrmMain.btnFizikaClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='Физика';
end;

procedure TfrmMain.btnHimiyaClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='Химия';
end;

procedure TfrmMain.btnIstorBelClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='История Беларуси';
end;

procedure TfrmMain.btnResultClick(Sender: TObject);
begin
  n:=strtoint(editAbitur.Text);
  if radbtnRandom.Checked = true then
  begin
    if labelPredmetName.Caption='Математика' then
    begin
      predm:='Математика';
      GeneraciyaBlanka30(BUser);
      BlankInFile30(BUser,'Пользователь');
      Testirovanie30;
    end;
    if labelPredmetName.Caption='Физика' then
    begin
      predm:='Физика';
      GeneraciyaBlanka30(BUser);
      BlankInFile30(BUser,'Пользователь');
      Testirovanie30;
    end;
    if labelPredmetName.Caption='Русский язык' then
    begin
      predm:='Русский язык';
      GeneraciyaBlanka40(BUser40);
      BlankInFile40(BUser40,'Пользователь');
      Testirovanie40;
    end;
    if labelPredmetName.Caption='Белорусский язык' then
    begin
      predm:='Белорусский язык';
      GeneraciyaBlanka40(BUser40);
      BlankInFile40(BUser40,'Пользователь');
      Testirovanie40;
    end;
    if labelPredmetName.Caption='Химия' then
    begin
      predm:='Химия';
      GeneraciyaBlanka50(BUser50);
      BlankInFile50(BUser50,'Пользователь');
      Testirovanie50;
    end;
    if labelPredmetName.Caption='Биология' then
    begin
      predm:='Биология';
      GeneraciyaBlanka50(BUser50);
      BlankInFile50(BUser50,'Пользователь');
      Testirovanie50;
    end;
    if labelPredmetName.Caption='История Беларуси' then
    begin
      predm:='История Беларуси';
      GeneraciyaBlanka50(BUser50);
      BlankInFile50(BUser50,'Пользователь');
      Testirovanie50;
    end;
  end;

  if radbtnDownload.Checked = true then
  begin
    if labelPredmetName.Caption='Математика' then
    begin
      predm:='Математика';
      DownloadFile30(BUser);
      Testirovanie30;
    end;
    if labelPredmetName.Caption='Физика' then
    begin
      predm:='Физика';
      DownloadFile30(BUser);
      Testirovanie30;
    end;
    if labelPredmetName.Caption='Русский язык' then
    begin
      predm:='Русский язык';
      DownloadFile40(BUser40);
      Testirovanie40;
    end;
    if labelPredmetName.Caption='Белорусский язык' then
    begin
      predm:='Белорусский язык';
      DownloadFile40(BUser40);
      Testirovanie40;
    end;
    if labelPredmetName.Caption='Химия' then
    begin
      predm:='Химия';
      DownloadFile50(BUser50);
      Testirovanie50;
    end;
    if labelPredmetName.Caption='Биология' then
    begin
      predm:='Биология';
      DownloadFile50(BUser50);
      Testirovanie50;
    end;
    if labelPredmetName.Caption='История Беларуси' then
    begin
      predm:='История Беларуси';
      DownloadFile50(BUser50);
      Testirovanie50;
    end;
  end;
  ShowMessage(labelPredmetName.Caption+#13#10+'Итоговый балл: '+FloatToStr(Ball));
  AddResult;
  radbtnRandom.Checked:=False; radbtnDownload.Checked:=False;
  editAbitur.Text:='';
  panelTestirovanie.Hide;
end;

end.
