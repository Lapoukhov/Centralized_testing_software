unit Unit50zad;

interface

Uses
   SysUtils, Windows, Unit30zad, Unit40zad;

const m=50;                                               //�-�� ������� � ������

Type TRec=record
     str:string[10];
     Num:string;                                          //string!
     end;
     TM50=array [1..m] of TRec;

Var BUser50:TM50;

procedure Testirovanie50;
procedure GeneraciyaBlanka50(var Arr:TM50);
procedure BlankInFile50(var Arr:TM50; s:string);
procedure DownloadFile50(var Arr:TM50);

implementation

const MnozhHim1:array[1..4]of string[2]=('15','44','23','11');
      MnozhHim2:array[1..4]of string[2]=('62','71','49','27');
      MnozhHim3:array[1..4]of string[3]=('151','113','120','132');
      MnozhBio1:array[1..4]of string[2]=('47','3','78','56');
      MnozhBio2:array[1..4]of string[3]=('123','108','135','150');
      MnozhBio3:array[1..4]of string[10]=('����','��������','��������','����������');
      MnozhIst1:array[1..4]of string[10]=('������','�������','ʳ���','�������');
      MnozhIst2:array[1..4]of string[10]=('������','��������','�������','������');
      MnozhIst3:array[1..4]of string[10]=('������','��������','�������','������');

Type TCoeffRec=record
     str:string[12];
     Num:real;
     end;
     TCoeff=array [1..m] of TCoeffRec;

Var BOtvet,B:TM50;
    BCoeff,BCount:TCoeff;
    i,k:integer;

procedure GeneraciyaBlanka50(var Arr:TM50);
begin
	for k:=1 to m do
    Arr[k].str:='N '+inttostr(k);
  for k:=1 to 38 do
  begin
    otvet:=IntToStr(Random(4)+1);
    Arr[k].Num:=otvet;
  end;
  for k:=39 to 41 do
  begin
    j:=Random(4)+1;
    if predm='�����' then
      Arr[k].Num:=MnozhHim1[j];
    if predm='��������' then
      Arr[k].Num:=MnozhBio1[j];
    if predm='������� ��������' then
      Arr[k].Num:=MnozhIst1[j];
  end;
  for k:=42 to 44 do
  begin
    j:=Random(4)+1;
    if predm='�����' then
      Arr[k].Num:=MnozhHim2[j];
    if predm='��������' then
      Arr[k].Num:=MnozhBio2[j];
    if predm='������� ��������' then
      Arr[k].Num:=MnozhIst2[j];
  end;
  for k:=45 to 47 do
  begin
    j:=Random(4)+1;
    if predm='�����' then
      Arr[k].Num:=MnozhHim3[j];
    if predm='��������' then
      Arr[k].Num:=MnozhBio3[j];
    if predm='������� ��������' then
      Arr[k].Num:=MnozhIst3[j];
  end;
  for k:=48 to m do
  begin
    j:=Random(5)+1;
    Arr[k].Num:=MnozhOtvetov[j];
  end;
end;

procedure BlankInFile50(var Arr:TM50; s:string);
begin
  if predm='�����' then
    assignfile(f,'����������(50���)�����/'+s+'.txt');
  if predm='��������' then
    assignfile(f,'����������(50���)��������/'+s+'.txt');
  if predm='������� ��������' then
    assignfile(f,'����������(50���)�������/'+s+'.txt');
  rewrite(f);
  for k:=1 to m do
    writeln(f,Arr[k].str:4,' ',Arr[k].Num:3);
  closefile(f);
end;

procedure BlankInFileReal50(var Arr:TCoeff; s:string);
begin
  if predm='�����' then
    assignfile(f,'����������(50���)�����/'+s+'.txt');
  if predm='��������' then
    assignfile(f,'����������(50���)��������/'+s+'.txt');
  if predm='������� ��������' then
    assignfile(f,'����������(50���)�������/'+s+'.txt');
  rewrite(f);
  for k:=1 to m do
    if s='����������' then
      writeln(f,Arr[k].str:4,' ',Arr[k].Num:3:0)
    else
      writeln(f,Arr[k].str:4,' ',Arr[k].Num:3:4);
  closefile(f);
end;

procedure CountOtvetov50(var Arr:TM50);
begin
  for k:=1 to m do
	begin
    BCount[k].str:='����� '+'N '+inttostr(k);
    if Arr[k].Num = BOtvet[k].Num then
      BCount[k].Num:=BCount[k].Num+1;
	end;
end;

procedure CoefficientZadaniya50(var Arr:TCoeff);
begin
  for k:=1 to m do
  begin
    Arr[k].str:='�����. '+'N '+inttostr(k);
    temp:=1-(BCount[k].Num/(n+1));
    if temp > 0.9 then
      Arr[k].Num:=0.9;
    if temp < 0.1 then
      Arr[k].Num:=0.1;
    if (temp>=0.1)and(temp<=0.9) then
      Arr[k].Num:=temp;
  end;
end;

procedure VsegoBallov50(var Arr:TM50);
begin
  Ball:=0; Summa:=0; SummaCoeff:=0;
  for k :=1 to m do
  begin
    SummaCoeff:=SummaCoeff+BCoeff[k].Num;
    if Arr[k].Num=BOtvet[k].Num then
        Summa:=Summa+BCoeff[k].Num;
  end;
  Ball:=Summa/SummaCoeff*100;
  Ball:=trunc(Ball);
end;

procedure Abitur50;
begin
  for i:=1 to n do
  begin
    GeneraciyaBlanka50(B);
    BlankInFile50(B,'����� '+inttostr(i));
    CountOtvetov50(B);
  end;
  CountOtvetov50(BUser50);
end;

procedure DownloadFile50(var Arr:TM50);
begin
  if predm='�����' then
    assignfile(f,'Download/Download50him.txt');
  if predm='��������' then
    assignfile(f,'Download/Download50bio.txt');
  if predm='������� ��������' then
    assignfile(f,'Download/Download50ist.txt');
  reset(f);
  for k:=1 to m do
  begin
    readln(f,Arr[k].Num);
  end;
  closefile(f);
end;

procedure Ochistka50(var Arr:TCoeff);
begin
  for k:=1 to m do
    Arr[k].Num:=0;
end;

procedure Testirovanie50;
begin
  GeneraciyaBlanka50(BOtvet);
  BlankInFile50(BOtvet,'������');
  Abitur50;
  BlankInFileReal50(BCount,'����������');
  CoefficientZadaniya50(BCoeff);
  BlankInFileReal50(BCoeff,'������������');
  VsegoBallov50(BUser50);
  Ochistka50(BCount);
end;

end.
