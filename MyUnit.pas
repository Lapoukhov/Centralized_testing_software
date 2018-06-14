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
  labelPredmetName.Caption:='����������';
end;

procedure TfrmMain.btnRussYaClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='������� ����';
end;

procedure TfrmMain.btnBelYaClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='����������� ����';
end;

procedure TfrmMain.btnBioClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='��������';
end;

procedure TfrmMain.btnFizikaClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='������';
end;

procedure TfrmMain.btnHimiyaClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='�����';
end;

procedure TfrmMain.btnIstorBelClick(Sender: TObject);
begin
  panelTestirovanie.Show;
  labelPredmetName.Caption:='������� ��������';
end;

procedure TfrmMain.btnResultClick(Sender: TObject);
begin
  n:=strtoint(editAbitur.Text);
  if radbtnRandom.Checked = true then
  begin
    if labelPredmetName.Caption='����������' then
    begin
      predm:='����������';
      GeneraciyaBlanka30(BUser);
      BlankInFile30(BUser,'������������');
      Testirovanie30;
    end;
    if labelPredmetName.Caption='������' then
    begin
      predm:='������';
      GeneraciyaBlanka30(BUser);
      BlankInFile30(BUser,'������������');
      Testirovanie30;
    end;
    if labelPredmetName.Caption='������� ����' then
    begin
      predm:='������� ����';
      GeneraciyaBlanka40(BUser40);
      BlankInFile40(BUser40,'������������');
      Testirovanie40;
    end;
    if labelPredmetName.Caption='����������� ����' then
    begin
      predm:='����������� ����';
      GeneraciyaBlanka40(BUser40);
      BlankInFile40(BUser40,'������������');
      Testirovanie40;
    end;
    if labelPredmetName.Caption='�����' then
    begin
      predm:='�����';
      GeneraciyaBlanka50(BUser50);
      BlankInFile50(BUser50,'������������');
      Testirovanie50;
    end;
    if labelPredmetName.Caption='��������' then
    begin
      predm:='��������';
      GeneraciyaBlanka50(BUser50);
      BlankInFile50(BUser50,'������������');
      Testirovanie50;
    end;
    if labelPredmetName.Caption='������� ��������' then
    begin
      predm:='������� ��������';
      GeneraciyaBlanka50(BUser50);
      BlankInFile50(BUser50,'������������');
      Testirovanie50;
    end;
  end;

  if radbtnDownload.Checked = true then
  begin
    if labelPredmetName.Caption='����������' then
    begin
      predm:='����������';
      DownloadFile30(BUser);
      Testirovanie30;
    end;
    if labelPredmetName.Caption='������' then
    begin
      predm:='������';
      DownloadFile30(BUser);
      Testirovanie30;
    end;
    if labelPredmetName.Caption='������� ����' then
    begin
      predm:='������� ����';
      DownloadFile40(BUser40);
      Testirovanie40;
    end;
    if labelPredmetName.Caption='����������� ����' then
    begin
      predm:='����������� ����';
      DownloadFile40(BUser40);
      Testirovanie40;
    end;
    if labelPredmetName.Caption='�����' then
    begin
      predm:='�����';
      DownloadFile50(BUser50);
      Testirovanie50;
    end;
    if labelPredmetName.Caption='��������' then
    begin
      predm:='��������';
      DownloadFile50(BUser50);
      Testirovanie50;
    end;
    if labelPredmetName.Caption='������� ��������' then
    begin
      predm:='������� ��������';
      DownloadFile50(BUser50);
      Testirovanie50;
    end;
  end;
  ShowMessage(labelPredmetName.Caption+#13#10+'�������� ����: '+FloatToStr(Ball));
  AddResult;
  radbtnRandom.Checked:=False; radbtnDownload.Checked:=False;
  editAbitur.Text:='';
  panelTestirovanie.Hide;
end;

end.
