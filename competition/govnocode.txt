program qe;

{$APPTYPE CONSOLE}
uses
  SysUtils,
  Windows;

Const kv=100;
Type
matr = array[1..kv,1..kv] of integer;
var B:matr; //Массив  (да ладно)
    flag:boolean;
    n,m,k,h:integer;
procedure InputMas(var mas:matr;const a,b:integer);
var i, j:integer;
begin
     for i:=1 to a do
       for j:=1 to b do begin
         writeln('Строка: ',i,' столбец ', j);
         readln(mas[i,j]);
       end;
end;
procedure CheckMas(const mas:matr;const a,b:integer);
var i, j:integer;
begin
     for i:=1 to a do begin
     writeln('Строка: ',i);
       for j:=1 to b do
         write(mas[i,j], ' ');
       writeln;
     end;
end;
function FindStr(const mas:matr;const a,b:integer;var nom:integer):boolean;
  var fl:boolean;
      sum,mult:integer;
      i,j:integer;
  begin
    fl:=False;i:=1;
    while (fl<>True) and (i<=a) do begin
      sum:=0; mult:=1;
      for j:=1 to b do begin
        sum:=sum+mas[i,j]; mult:=mult*mas[i,j];
      end;
      if sum<mult then begin
      fl:=True;
      nom:= i;
      end
      else i:=i+1;
    end;
    FindStr:=fl
end;
function Nechet(const mas:matr;const a,b:integer):integer;
  var i,kol:integer;
  begin
  kol:=0;
    for i:=1 to b do
      if ((mas[a,i] mod 2) <> 0) then kol:=kol+1;
  Nechet:=kol;
end;
begin
 { TODO -oUser -cConsole Main : Insert code here }
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
  writeln('Введите m и n');
  readln(m,n);
  InputMas(B,m,n);
  CheckMas(B,m,n);
  flag:=FindStr(B,m,n,k);
  if flag=True then begin
  h:=Nechet(B,k,n);
  writeln('строка:', k, ', нечетных: ',h);
  end
  else writeln('Все суммы больше');
  readln;
end.
