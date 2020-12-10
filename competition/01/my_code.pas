PROGRAM Dragons_Fantasies;

TYPE matrix = array [0..99, 0..99] of integer;

PROCEDURE in_matrix(var x: matrix; n, m: byte);
Var i, j: byte;
Begin
    writeln('Введите значения матрицы:', #13#10);
    for i:= 0 to n do
    begin
        for j:= 0 to m do
        begin
            write('[', i:2, 'x', j:2, ']: ');
            read(x[i, j]);
        end;
        writeln();
    end;
End;

PROCEDURE ou_matrix(x: matrix; n, m: byte);
Var i, j: byte;
Begin
    writeln('Введённый массив:', #13#10);
    for i:= 0 to n do
    begin 
        for j:= 0 to m do
            write(x[i, j]:4, ' ');
        writeln();
    end;
End;

FUNCTION find_row(x: matrix; n, m: byte): integer;
Var sum: integer;
    flg: boolean;
    multi: longint;
    i, j: byte;
Begin
    flg:= true;
    i:= 0;

    while flg and (i < n) do
    begin 
        sum:= 0;
        multi:= 1;

        for j:= 0 to m do
        begin
            sum += x[i, j];
            multi *= x[i, j];
        end;

        if sum < multi then flg:= false
        else i += 1;
    end;

    if flg then find_row:= -1
    else find_row:= i;
End;

FUNCTION count_odd(x: matrix; n, m: byte): shortint;
Var j, count: byte;
Begin
    count:= 0;
    for j:= 0 to m do
        if (x[n, j] mod 2 <> 0) then 
            count += 1;

    count_odd:= count;
End;

VAR B: matrix;
    n, m: byte;
    row: shortint;

BEGIN
    repeat
        write('Введите количество строк и столбцов соответственно(от 2 до 100): ');
        readln(n, m)
    until (n >= 2) and (n <= 100) and (m >= 2) and (m <= 100);
    n -= 1;
    m -= 1;

    in_matrix(B, n, m);
    ou_matrix(B, n, m);

    row:= find_row(B, n, m);
    if row = -1 then
        writeln('Все суммы больше')
    else
        writeln('Номер первой строки: ', row, #13#10, 'Кол-во нечётных элементов: ', count_odd(B, n, m));

END.
