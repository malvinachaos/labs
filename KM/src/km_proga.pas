PROGRAM Marina_Kalashnikova_KM_A_5a_20;

USES sysutils;

TYPE matrix = array of array of integer;

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
            write(f, x[i, j], ' ');
        writeln(f);
    end;
    writeln(f);
End;

FUNCTION main_diagonal(x: matrix; m, n: byte): integer;
Var i: byte = 1;
    j: byte = 1;
    max: integer;
Begin
    max:= x[0, 0];
    while (i <= m) and (j <= n) do
    begin
        if x[i, j] > max then max:= x[i, j];
        i += 1;
        j += 1;
    end;
    main_diagonal:= max;
End;

FUNCTION is_main(x: matrix; m, n: byte; num: integer): boolean;
Var i: byte = 0;
    j: byte = 1;
    flg: boolean = true;
Begin
    while (i <= m) and flg do
    begin
        while (j <= n) and flg do
            if (j <> i) and (x[i, j] > num) then flg:= false
            else j += 1;
        i += 1;
        j:= 0;
    end;

    is_main:= flg;
End;

FUNCTION below_diagonal(x: matrix; num: integer; m, n: byte): boolean;
Var i: byte = 0;
    j: byte = 0;
    k: byte;
    flg: boolean = false;
Begin
    while (i <= (m-1)) and (j <= n) and (not flg) do
    begin
        k:= i + 1;
        while (k <= m) and (not flg) do
        begin
            if (x[k, j] mod num = 0) then flg:= true
            else k += 1;
        end;
        i += 1;
        j += 1;
    end;

    below_diagonal:= flg;
End;


VAR itxt, otxt: text;
    a: matrix;
    row, col, i: byte;
    adia, num: integer;
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
            until (row >= 3) and (row <= 100) and (col >= 3) and (col <= 100);
            setlength(a, row, col);
            row -= 1;
            col -= 1;
            mat_i(itxt, a, row, col);
         
            adia:= main_diagonal(a, row, col);
         
            writeln(otxt, 'Матрица ', ch[i], ': ');
            mat_o(otxt, a, row, col);
            if is_main(a, row, col, adia) then
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
