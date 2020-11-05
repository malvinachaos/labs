PROGRAM by_Marina;

USES sysutils;

TYPE one = array of integer;

VAR xf, otxt: text;
    n, t1, t2: integer;
    a: one;
    fexist: boolean;
    argexist: boolean;
    outexist: boolean;


PROCEDURE arr_i(var f: text; var x: one; n: integer);
Var i: integer;
Begin 
    reset(f);
    setlength(x, n);

    for i:= 0 to n do
        read(f, x[i]);

    close(f);
End;


PROCEDURE arr_o(var f: text; var x: one; n: integer);
Var i: integer;
Begin 
    for i:= 0 to n do
        write(f, x[i], ' ');
    writeln(f, #13#10);
End;


PROCEDURE find_num(var f: text; var x: one; n, t1, t2: integer);
Var i, j, num, number: integer;
    flg: boolean;
Begin
    writeln(f, 'Значения массива:', #13#10);
    arr_o(f, x, n);
    j:= 0;
    i:= 0;
    flg:= true;

    while (i < n) and flg do
    begin
        if x[i] > t2 then
        begin
            j:= i;
            flg:= false;
        end;
        i:= i + 1;
    end;

    number:= 32767;

    for i:= j to n do
        if (x[i] > t1) and (number > x[i]) then
        begin
            number:= x[i];
            num:= i + 1;
        end;

    if (number <> 32767) then writeln(f, 'Номер последнего минимального элемента: ', num)
    else writeln(f, 'Увы, таких чисел не нашлось');

    writeln(f, #13#10, #13#10);

End;

BEGIN
	fexist:= FileExists(argv[1]);
    outexist:= FileExists(argv[2]);
    argexist:= (argv[1] <> '') and (argv[2] <> '');

    if fexist and argexist then
    begin
        assign(xf, argv[1]);
        assign(otxt, argv[2]);

        if outexist then 
            append(otxt)
        else 
            rewrite(otxt);

        repeat
            write('Введите количетво элементов массива от 2 до 50: ');
            readln(n);
        until (n > 2) and (n < 50);
        n:= n - 1;

        write('Введите значения для t1 и t2 соответственно: ');
        readln(t1, t2);

        arr_i(xf, a, n);
        find_num(otxt, a, n, t1, t2);

        close(otxt);
    end
    else if (not fexist) then writeln('Файла ', argv[1], ' не существует')
    else writeln('Использование:', #13#10, './main file_1.txt out.txt');

END.
