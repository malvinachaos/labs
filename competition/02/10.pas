//Проверить, все ли строки матрицы содержат хотя бы один отрицательный элемент. Если не все, найти номер первой строки, где нет отрицательных элементов.

program lab10;
const 
  nmax = 10;

type
  mas = array[0..nmax] of real;
  matrix = array[1..nmax,1..nmax] of real;
  
var
  a: matrix;
  k, m, n, rep: integer;
  input, output: text;
  

    procedure vvod(var fx: text; ni, nj: integer; var x: matrix);
      var 
        i, j: integer;
      begin
        reset(fx);
        for i:=1 to ni do begin
          for j:=1 to nj do begin
            read(fx, x[i,j]);
          end;
        end;
        close(fx);
      end;

    function find_row(var x: matrix; ni, nj: integer): integer;
    var i, j: integer;
        flag: boolean = true;
    begin
        i:= 1;
        while (i <= ni) and flag do
        begin
            j:= 1;
            while (j <= nj) and flag do
            begin
                if x[i, j] < 0 then 
                  flag := true
                else
                  j := j + 1;
            end;
            if not flag then
            begin
              flag := true;
              i := i + 1;
            end;
        end;
        if flag then find_row:= -1
        else find_row:= i;
    end;
      

    procedure vivod_mat(var fx: text; ni, nj: integer; var x: matrix);
      var 
        i,j: integer;
        begin
          rewrite(fx);
          writeln(fx,'исходная матрица');
          for i:=1 to ni do begin
            for j:=1 to nj do begin
              write(fx, x[i,j]:5,' ');
            end;
          writeln(fx,' ');
          end;
          close(fx);
        end;
        
    
    begin
    repeat
      Assign(input, ParamStr(1));
      Assign(output, ParamStr(2));
      repeat
        write('введите количество строк матрицы: ');
        readln(m);
        write('введите количество столбцов матрицы: ');
        readln(n);
      until (m >= 2) and (m <= 10) and (n >= 2) and (n <= 10);
      
      
      
      vvod(input, m, n, a);
      vivod_mat(output, m, n, a);
      k := find_row(a, m, n);
      append(output);
      writeln(output);
      if k <> -1 then 
        writeln(output, 'Номер первой строки, в которой все элементы положительны: ', k)
      else 
        writeln(output, 'Все строки матрицы матрицы содержат хотя бы один отрицательный элемент');
      close(output);
      Write('Чтобы повторить тест введите 0, иначе любое число: ');
      ReadLn(Rep);
    until Rep <> 0;
    
    end.
