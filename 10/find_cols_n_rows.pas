PROGRAM this_is_not_a_trick;

USES sysutils, crt;

TYPE matrix = array of array of integer;

VAR a: matrix;
    itxt, otxt: text;
    m, n, num: integer;
    fexi, aexi: boolean;

PROCEDURE in_arr(var f: text; var x: matrix; row, col: integer);
Var i, j, c: integer;
Begin
    reset(f);
{log} TextColor(Red);

    for i:= 0 to row do
    begin
        for j:= 0 to col do
        begin
            read(f, x[i, j]);
{log} write('[', i, 'x', j, ']');
        end;
        if i < row then
        begin
            while not seekeoln(f) do read(f, c);
{log} writeln();
        end;
    end;

    close(f);
End;

PROCEDURE ou_arr(var f: text; var x: matrix; row, col: integer);
Var i, j: integer;
Begin
    for i:= 0 to row do
    begin
        write(f, '[', i:2, ']: ');
        for j:= 0 to col do
            write(f, x[i, j], ' ');
        writeln(f);
    end;
End;

FUNCTION check_rows(var x: matrix; row, col: integer): integer;
Var i, j, num, n: integer;
    flg: boolean;
Begin
    i:= 0;
    flg:= true;
    n:= 0;

    while (i < row) and flg do
    begin
        num:= x[i, 0];
        j:= 1;
        while (j < col) and flg do
        begin
            if x[i, j] < num then 
            begin
                flg:= false;
                n:= i;
            end;
            num:= x[i, j];
            j:= j + 1;
        end;
        i:= i + 1;
    end;

    if flg then check_rows:= -1
    else check_rows:= n;
End;

BEGIN
    fexi:= FileExists(argv[1]);
    aexi:= (argv[1] <> '') and (argv[2] <> '');

    if fexi and aexi then
    begin
        assign(itxt, argv[1]);
        assign(otxt, argv[2]);
        rewrite(otxt);

        repeat
            write('Введите значения для количества строк(больше 2) и столбцов соответственно(меньше 50): ');
            readln(m, n);
        until (m >= 2) and (m <= 50) and (n >= 2) and (n <= 50);
        n:= n - 1;
        setlength(a, m, n);
        m:= m - 1;
{log}   TextColor(Cyan);
{log}   writeln('Length is correct');

        in_arr(itxt, a, m, n);
{log}   TextColor(Cyan);
{log}   writeln(#13#10, 'Reading is correct');

        writeln(otxt, 'Значения матрицы а:');
        ou_arr(otxt, a, m, n);
{log}   writeln('Writing is correct');

        num:= check_rows(a, m, n);
        if num <> -1 then writeln(otxt, 'Номер первой неупорядоченной стоки: ', num)
        else writeln(otxt, 'Все строки матрицы упорядочены по возрастанию');
{log}   writeln('Solving is correct');

        close(otxt);
{log}   writeln('???');
{log}   TextColor(White);
    end
    else if not aexi then writeln('Использование: ./program file.txt out.txt')
    else writeln('Файла ', argv[1], ' не существует');
{log}   writeln('Maybe here?');
END.
