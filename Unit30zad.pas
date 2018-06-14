unit Unit30zad;

interface

Uses
   SysUtils, Windows;

const m=30;                                               //К-во заданий в бланке
      p=18;                                               //К-во заданий А-части

Type TRec=record
     str:string[10];
     Num:integer;
     end;
     TM=array [1..m] of TRec;

Var BUser:TM;
    n,j:integer;
    Ball,Summa,SummaCoeff,temp:real;
    f:textfile;
    predm:string;

procedure Testirovanie30;
procedure GeneraciyaBlanka30(var Arr:TM);
procedure BlankInFile30(var Arr:TM; s:string);
procedure DownloadFile30(var Arr:TM);

implementation

const Mnozh1:array[1..4]of integer=(35,27,13,23);
      Mnozh2:array[1..4]of integer=(87,75,61,93);
      Mnozh3:array[1..4]of integer=(144,109,221,195);

Type TCoeffRec=record
     str:string[12];
     Num:real;
     end;                                                 
     TCoeff=array [1..m] of TCoeffRec;

Var BOtvet,B,BCount:TM;
    BCoeff:TCoeff;
    i,k:integer;

procedure GeneraciyaBlanka30(var Arr:TM);
begin
	for k:=1 to m do
    Arr[k].str:='N '+inttostr(k);
  for k:=1 to 18 do
	  Arr[k].Num:=Random(4)+1;
  for k:=18 to 21 do
  begin
    j:=Random(4)+1;
	  Arr[k].Num:=Mnozh1[j];
  end;
  for k:=22 to 25 do
  begin
    j:=Random(4)+1;
	  Arr[k].Num:=Mnozh2[j];
  end;
  for k:=26 to m do
  begin
    j:=Random(4)+1;
    Arr[k].Num:=Mnozh3[j];
  end;
end;

procedure BlankInFile30(var Arr:TM; s:string);
begin
  if predm='Математика' then
    assignfile(f,'Результаты(30зад)Математика/'+s+'.txt');
  if predm='Физика' then
    assignfile(f,'Результаты(30зад)Физика/'+s+'.txt');
  rewrite(f);
  for k:=1 to m do
    writeln(f,Arr[k].str:4,' ',Arr[k].Num:3);
  closefile(f);
end;

procedure BlankInFileReal30(var Arr:TCoeff; s:string);
begin
  if predm='Математика' then
    assignfile(f,'Результаты(30зад)Математика/'+s+'.txt');
  if predm='Физика' then
    assignfile(f,'Результаты(30зад)Физика/'+s+'.txt');
  rewrite(f);
  for k:=1 to m do
    writeln(f,Arr[k].str:4,' ',Arr[k].Num:3:4);
  closefile(f);
end;

procedure CountOtvetov30(var Arr:TM);
begin
  for k:=1 to m do
	begin
    BCount[k].str:='Верно '+'N '+inttostr(k);
    if Arr[k].Num=BOtvet[k].Num then
      inc(BCount[k].Num);
	end;
end;

procedure CoefficientZadaniya30(var Arr:TCoeff);
begin
  for k:=1 to m do
  begin
    Arr[k].str:='Коэфф. '+'N '+inttostr(k);
    temp:=1-(BCount[k].Num/(n+1));
    if temp > 0.9 then
      Arr[k].Num:=0.9;
    if temp < 0.1 then
      Arr[k].Num:=0.1;
    if (temp>=0.1)and(temp<=0.9) then
      Arr[k].Num:=temp;
  end;
end;

procedure VsegoBallov30(var Arr:TM);
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

procedure Abitur30;
begin
  for i:=1 to n do
  begin
    GeneraciyaBlanka30(B);
    BlankInFile30(B,'бланк '+inttostr(i));
    CountOtvetov30(B);
  end;
  CountOtvetov30(BUser);
end;

procedure DownloadFile30(var Arr:TM);
begin
  if predm='Математика' then
    assignfile(f,'Download/Download30mat.txt');
  if predm='Физика' then
    assignfile(f,'Download/Download30fiz.txt');
  reset(f);
  for k:=1 to m do
  begin
    readln(f,Arr[k].Num);
  end;
  closefile(f);
end;

procedure Ochistka30(var Arr:TM);
begin
  for k:=1 to m do
    Arr[k].Num:=0;
end;

procedure Testirovanie30;
begin
  GeneraciyaBlanka30(BOtvet);
  BlankInFile30(BOtvet,'Ответы');
  Abitur30;
  BlankInFile30(BCount,'Количество');
  CoefficientZadaniya30(BCoeff);
  BlankInFileReal30(BCoeff,'Коэффициенты');
  VsegoBallov30(BUser);
  Ochistka30(BCount);
end;

end.
