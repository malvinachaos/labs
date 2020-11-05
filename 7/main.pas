PROGRAM by_Marina;

USES sysutils;

TYPE twodim = array of array of integer;

VAR a: twodim;
    matfile, otxt: text;
    m, n:integer;
    aexist, fexist: boolean;

PROCEDURE matrix_i(var f: text; var x: twodim; m, n: integer);
Var i, j, c: integer;
Begin 
    reset(f);
    setlength(x, m+1, n);
    for i:= 0 to m do
    begin
        for j:= 0 to n do
        begin
            read(f, x[i, j]);
        end;
        
        if i < m then
            while not seekeoln(f) do read(f, c);
    end;

    close(f);
End;

PROCEDURE fnd(var f: text; var x: twodim; m, n: integer);
Var i, j, sum: integer;
    k: byte;
    flg: boolean;
Begin
    flg:= false;
    k:= 1;
    writeln(f, 'Номера строк матрицы:');
    for i:= 0 to m do
    begin
        sum:= 1;

        for j:= 0 to n do
            sum:= sum + x[i, j];
        
        if sum < 0 then
        begin
            flg:= true;
            write(f, i, '    ');
            if (k mod 4 = 0) then write(f, #13#10);
            k:= k + 1;
        end;
    end;

    if not flg then writeln(f, 'Не найдено');
    writeln(f);
    close(f);
End;

BEGIN
    fexist:= FileExists(argv[1]);
    aexist:= (argv[1] <> '') and (argv[2] <> '');

    if fexist and aexist then
    begin
        assign(matfile, argv[1]);
        assign(otxt, argv[2]);
        rewrite(otxt);

        repeat
            write('Введите размерность матрицы A(сначала кол-во строк, потом столбцов, от 2 до 100): ');
            readln(m, n);
        until (m >= 2) and (m <= 100) and (n >= 2) and (n <= 100);
        n:= n - 1;
        m:= m - 1;

        matrix_i(matfile, a, m, n);
        fnd(otxt, a, m, n);
    end
    else if not aexist then writeln('Использование:', #13#10, './main file.txt out.txt')
    else if not fexist then writeln('Файла ', argv[1], ' не существует');

END.
