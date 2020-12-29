{Программа для Free Pascal версии (3.2.0 <=)}
USES sysutils;

CONST kv = 99;

TYPE matrix = array[0..kv] of array[0..kv] of integer;

PROCEDURE mat_i(var f: text; var x: matrix; m, n: byte);
Var i, j: byte;
Begin
    reset(f);
    for i:= 0 to m do
    begin
        for j:= 0 to n do
            read(f, x[i, j]);
        readln(f);
    end;
    close(f)
End;

PROCEDURE mat_o(var f: text; x: matrix; m, n: byte);
Var i, j: byte;
Begin
    writeln(f);
    for i:= 0 to m do
    begin
        for j:= 0 to n do
            write(f, x[i, j]:4, ' ');
        writeln(f, #13#10);
    end;
    writeln(f);
End;

FUNCTION is_main(x: matrix; m, n: byte): boolean;
Var i, j: byte;
    k: byte = 0;
    l: byte = 0;
    max: integer;
Begin
    max:= x[0, 0];
    for i:= 0 to m do
        for j:= 0 to n do
            if x[i, j] > max then 
            begin
                max:= x[i, j];
                k:= i;
                l:= j;
            end;

    if k = l then is_main:= true
    else is_main:= false;

End;

FUNCTION below_diagonal(x: matrix; num: integer; m, n: byte): boolean;
Var i: byte = 1;
    j: byte;
    flg: boolean = false;
Begin

    while (i <= m) and (not flg) do
    begin
        j:= 0;
        while (j < i) and (not flg) do
            if (x[i, j] mod num = 0) then flg:= true
            else j+= 1;
        i+= 1;
    end;

    below_diagonal:= flg;
End;


VAR itxt, otxt: text;
    a: matrix;
    row, col, i: byte;
    num: integer;
    ch: array[1..2] of char = ('A', 'B');
    aexi, fexi: boolean;

BEGIN
    aexi:= paramcount = 3;
    fexi:= fileexists(argv[1]) and fileexists(argv[2]);

    if aexi and fexi then
    begin
        assign(otxt, argv[3]);
        rewrite(otxt);
        for i:= 1 to 2 do
        begin
            assign(itxt, argv[i]);

            repeat
                write('Введите размерность матрицы(кол-во строк и столбцов соотв-но) ', ch[i], ' от 3 до 100: ');
                readln(row, col);
            until (row >= 2) and (row <= 100) and (col >= 2) and (col <= 100);
            
            row -= 1;
            col -= 1;
            mat_i(itxt, a, row, col);

            writeln(otxt, 'Матрица ', ch[i], ': ');
            mat_o(otxt, a, row, col);
            if is_main(a, row, col) then
            begin
                write('Введите число: ');
                readln(num);
                if below_diagonal(a, num, row, col) then
                    writeln(otxt, 'В этой матрице есть элемент, кратный вашему числу')
                else writeln(otxt, 'В этой матрице нет элемента, кратного вашему числу');
            end
            else writeln(otxt, 'В этой матрице наибольший элемент не лежит на главной диагонали', #13#10);
            
            writeln(otxt, #13#10);
        end;

        close(otxt);
    end
    else writeln('Вы ввели неправильно аргументы или имена не существующих файлов');

END.
