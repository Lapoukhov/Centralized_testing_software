unit Unit40zad;

interface

Uses
   SysUtils, Windows, Unit30zad;

const m=40;                                               //К-во заданий в бланке
      MnozhOtvetov:array[1..5]of string[10]=('А1Б2В3Г4','А4Б3В2Г1','А2Б3В1Г4','А3Б1В2Г4','А4Б1В2Г3');

Type TRec=record
     str:string[10];
     Num:string;                                          //string
     end;
     TM40=array [1..m] of TRec;

Var BUser40:TM40;
    otvet,otvet2:string;

procedure Testirovanie40;
procedure GeneraciyaBlanka40(var Arr:TM40);
procedure BlankInFile40(var Arr:TM40; s:string);
procedure DownloadFile40(var Arr:TM40);

implementation

const MnozhRuss1:array[1..4]of string[10]=('наречие','частица','предлог','союз');
      MnozhRuss2:array[1..5]of string[10]=('сделать','книга','земля','радуга','красный');
      MnozhBel1:array[1..4]of string[10]=('злучнік','прыслоўе','дзеяслоў','лічэбнік');
      MnozhBel2:array[1..5]of string[10]=('ролі','надаецца','якія','дзеянне','прадмет');

Type TCoeffRec=record
     str:string[12];
     Num:real;
     end;
     TCoeff=array [1..m] of TCoeffRec;

Var BOtvet,B:TM40;
    BCoeff,BCount:TCoeff;                                 //BCount - real
    i,k:integer;

procedure GeneraciyaBlanka40(var Arr:TM40);
begin
	for k:=1 to m do
    Arr[k].str:='N '+inttostr(k);
  for k:=1 to 30 do
  begin
    otvet:=IntToStr(Random(4)+1);
    otvet2:=IntToStr(Random(4)+1);
    Arr[k].Num:=otvet+' '+otvet2;
  end;
  for k:=31 to 33 do
  begin
    j:=Random(4)+1;
    if predm='Русский язык' then
      Arr[k].Num:=MnozhRuss1[j];
    if predm='Белорусский язык' then
      Arr[k].Num:=MnozhBel1[j];
  end;
  for k:=34 to 36 do
  begin
    j:=Random(5)+1;
    if predm='Русский язык' then
      Arr[k].Num:=MnozhRuss2[j];
    if predm='Белорусский язык' then
      Arr[k].Num:=MnozhBel2[j];
  end;
  for k:=37 to m do
  begin
    j:=Random(5)+1;
    Arr[k].Num:=MnozhOtvetov[j];
  end;
end;

procedure BlankInFile40(var Arr:TM40; s:string);
begin
  if predm='Русский язык' then
    assignfile(f,'Результаты(40зад)Русский/'+s+'.txt');
  if predm='Белорусский язык' then
    assignfile(f,'Результаты(40зад)Белорусский/'+s+'.txt');
  rewrite(f);
  for k:=1 to m do
    writeln(f,Arr[k].str:4,' ',Arr[k].Num:3);
  closefile(f);
end;

procedure BlankInFileReal40(var Arr:TCoeff; s:string);
begin
  if predm='Русский язык' then
    assignfile(f,'Результаты(40зад)Русский/'+s+'.txt');
  if predm='Белорусский язык' then
    assignfile(f,'Результаты(40зад)Белорусский/'+s+'.txt');
  rewrite(f);
  for k:=1 to m do
    if s='Количество' then
      writeln(f,Arr[k].str:4,' ',Arr[k].Num:3:1)
    else
      writeln(f,Arr[k].str:4,' ',Arr[k].Num:3:4);
  closefile(f);
end;

procedure CountOtvetov40(var Arr:TM40);
begin
  for k:=1 to 30 do
	begin
    otvet:=Arr[k].Num;
    otvet2:=BOtvet[k].Num;
    BCount[k].str:='Верно '+'N '+inttostr(k);
    if Arr[k].Num = BOtvet[k].Num then
      BCount[k].Num:=BCount[k].Num+1
      else
        if (otvet[1] = otvet2[1])or(otvet[3] = otvet2[3])then
          BCount[k].Num:=BCount[k].Num+0.2;                    //0.2!!!
	end;
  for k:=31 to m do
  begin
    BCount[k].str:='Верно '+'N '+inttostr(k);
    if Arr[k].Num = BOtvet[k].Num then
      BCount[k].Num:=BCount[k].Num+1;
  end;
end;

procedure CoefficientZadaniya40(var Arr:TCoeff);
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

procedure VsegoBallov40(var Arr:TM40);
begin
  Ball:=0; Summa:=0; SummaCoeff:=0;
  for k :=1 to 30 do
  begin
    otvet:=Arr[k].Num;
    otvet2:=BOtvet[k].Num;
    SummaCoeff:=SummaCoeff+BCoeff[k].Num;
    if Arr[k].Num=BOtvet[k].Num then
      Summa:=Summa+BCoeff[k].Num
      else
        if(otvet[1] = otvet2[1])or(otvet[3] = otvet2[3])then
          Summa:=Summa+BCoeff[k].Num;
  end;
  for k :=31 to m do
  begin
    SummaCoeff:=SummaCoeff+BCoeff[k].Num;
    if Arr[k].Num=BOtvet[k].Num then
        Summa:=Summa+BCoeff[k].Num;
  end;
  Ball:=Summa/SummaCoeff*100;
  Ball:=trunc(Ball);
end;

procedure Abitur40;
begin
  for i:=1 to n do
  begin
    GeneraciyaBlanka40(B);
    BlankInFile40(B,'бланк '+inttostr(i));
    CountOtvetov40(B);
  end;
  CountOtvetov40(BUser40);
end;

procedure DownloadFile40(var Arr:TM40);
begin
  if predm='Русский язык' then
    assignfile(f,'Download/Download40russ.txt');
  if predm='Белорусский язык' then
    assignfile(f,'Download/Download40bel.txt');
  reset(f);
  for k:=1 to m do
  begin
    readln(f,Arr[k].Num);
  end;
  closefile(f);
end;

procedure Ochistka40(var Arr:TCoeff);
begin
  for k:=1 to m do
    Arr[k].Num:=0;
end;

procedure Testirovanie40;
begin
  GeneraciyaBlanka40(BOtvet);
  BlankInFile40(BOtvet,'Ответы');
  Abitur40;
  BlankInFileReal40(BCount,'Количество');
  CoefficientZadaniya40(BCoeff);
  BlankInFileReal40(BCoeff,'Коэффициенты');
  VsegoBallov40(BUser40);
  Ochistka40(BCount);
end;

end.
