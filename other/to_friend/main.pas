PROGRAM by_Marina;

USES sysutils, crt;

TYPE twodim = array of array of integer;

VAR a: twodim;
    matfile, otxt: text;
    m, n, t:integer;
    aexist, fexist: boolean;

PROCEDURE matrix_i(var f: text; var x: twodim; m, n: integer);
Var i, j, c: integer;
Begin
{log} TextColor(Red);
{log} writeln('check input');
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
{log} TextColor(Cyan);
{log} writeln('row read nice');
    end;

    close(f);
End;

PROCEDURE fnd(var f: text; var x: twodim; m, n, t: integer);
Var i, j, sum, count: integer;
    flg: boolean;
    k: integer;
Begin
{log} TextColor(Red);
{log} writeln('check output', #13#10, 'Rows count: ', m, #13#10, 'Columns count: ', n);
{log} TextColor(Cyan);
    for i:= 0 to n do
    begin
        count:= 0;
        flg:= false;
{log}   k:= 1;
        for j:= 0 to m do
        begin
            if x[j,i] < t then
            begin
                count:= count + 1;
                flg:= true;
            end;
{log} if (k mod (m+1)) = 0 then writeln('[', j:2, 'x', i:2, ']')
{log} else write('[', j:2, 'x', i:2, '] ');
{log} k:= k + 1;
        end;
        if flg then writeln(f, 'Количество элементов, меньших заданному равно ', count)
        else writeln(f, 'Столбце ', i, ' нет таких элементов');
    end;
{log} TextColor(Green);
{log} writeln('Reading matrix is done well!');

    writeln(f);
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

        write('Введите число, с которым программа будет сравнивать элементы столбцов: ');
        read(t);

        matrix_i(matfile, a, m, n);
        fnd(otxt, a, m, n, t);
        close(otxt);
    end
    else if not aexist then writeln('Использование:', #13#10, './main file.txt out.txt')
    else if not fexist then writeln('Файла ', argv[1], ' не существует');

END.
