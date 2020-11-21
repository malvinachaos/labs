PROGRAM Why_the_Heavy_is_dead;

USES sysutils;

TYPE twodim = array of array of integer;

VAR a: twodim;
    matfile, otxt: text;
    i, beg, m, n:integer;
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

FUNCTION fnd(var x: twodim; beg, m, n: integer): integer;
Var i, j, sum: integer;
    flg: boolean;
Begin
    flg:= true;
    i:= beg + 1;

    while flg and (i < m) do
    begin
        sum:= 0;

        for j:= 0 to n do
            sum:= sum + x[i, j];

        if sum < 0 then flg:= false
        else i:= i + 1;
    end;

    if flg then fnd:= -1
    else fnd:= i;
End;

BEGIN
    fexist:= FileExists(argv[1]);
    aexist:= paramcount = 2;

    if fexist and aexist then
    begin
        assign(matfile, argv[1]);
        assign(otxt, argv[2]);
        rewrite(otxt);

        repeat
            write('Введите размерность матрицы A(сначала кол-во строк, потом столбцов, от 2 до 50): ');
            readln(m, n);
        until (m >= 2) and (m <= 50) and (n >= 2) and (n <= 50);
        n:= n - 1;
        m:= m - 1;
        i:= 0;
        beg:= 0;

        matrix_i(matfile, a, m, n);
        writeln(otxt, 'Номера строк матрицы, чьи суммы меньше нуля:');

        beg:= fnd(a, beg, m, n);
        if beg = -1 then writeln(otxt, 'Не найдено');

        while (i < m) and (beg <> -1) do
        begin 
            write(otxt, beg:4);
            i:= i + 1;
            beg:= fnd(a, beg, m, n);
        end;

        close(otxt);
    end
    else if not aexist then writeln('Использование:', #13#10, './main file.txt out.txt')
    else if not fexist then writeln('Файла ', argv[1], ' не существует');

END.
