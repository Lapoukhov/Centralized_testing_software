unit UnitResult;

interface

Uses
   SysUtils, Windows, Unit30zad;

procedure CreateResult;
procedure AddResult;
procedure SaveResult;

implementation

Type
     TZap = record
       Name:string;
       ResultBall:string;
     end;
     TSP = ^ TSS;
     TSS = record
       INF:TZAP;
       ADR:TSP;
     end;

Var head,temp:TSP;
    fileResult:textfile;
    str:string;

procedure CreateResult;
begin
  New(head);
  head^.ADR:=nil;
  temp:=head;
end;

procedure AddResult;
begin
  New(temp^.adr);
  temp:=temp^.adr;
  temp^.adr:=nil;
  with temp^.INF do
  begin
    Name:=predm;
    ResultBall:=FloatToStr(Ball);
  end;
end;

procedure SaveResult;
begin
  str:=DateToStr(Date);
  assignfile(fileResult,'История тестирований/'+str+'.txt');
  rewrite(fileResult);
  temp:=head^.adr;
  while temp<>nil do
  begin
    with temp^.INF do
    begin
      writeln(fileResult,Name,' ',ResultBall);
    end;
    temp:=temp^.adr;
  end;
  closefile(fileResult);
end;

end.
