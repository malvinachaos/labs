PROGRAM by_Marina;

USES sysutils;

TYPE onedim = array of integer;

VAR xf, otxt: text;
    x: onedim;
    n, num: integer;
    fexist, argexist: boolean;

PROCEDURE arr_i(var f: text; var x: onedim; n: integer);
Var i: integer;
Begin 
    reset(f);
    setlength(x, n-1);

    for i:= 0 to n-1 do
        read(f, x[i]);
    
    close(f);
End;

PROCEDURE arr_o(var f: text; var x: onedim; n: integer);
Var i: integer;
Begin 
    for i:= 0 to n-1 do
        write(f, x[i], ' ');
    write(f, #13#10);
End;


PROCEDURE find_num(var f: text; x: onedim; n, num: integer);
Var flg: boolean;
    i, j: integer;
Begin 
    flg:= false;
    j:= -1;
    i:= 0;

    while (not (flg) and (i < n)) do
    begin
        if (x[i] mod num) = 0 then
        begin
            flg:= true;
            j:= i + 1;
        end;
        i:= i + 1;
    end;

    if flg then
        write(f, 'В массиве есть число, кратное вашему и его номер: ', j, #13#10)
    else 
        write(f, 'В массиве нет числа, кратного вашему', #13#10);

    close(f);
End;


BEGIN
    fexist:= FileExists(argv[1]);
    argexist:= (argv[1] <> '') and (argv[2] <> '');
	
    if argexist and fexist then
    begin
        repeat
            write('Введите количество элементов массива(от 2 до 50): ');
            readln(n);
        until (n > 2) and (n < 50);

        write('Введите значение, по которому прорамма будет искать кратные ему в массиве: ');
        readln(num);

        assign(xf, argv[1]);
        assign(otxt, argv[2]);
        rewrite(otxt);

        arr_i(xf, x, n);
        write(otxt, 'Значения массива: ', #13#10);
        arr_o(otxt, x, n);
        find_num(otxt, x, n, num);
    end
    else if (not fexist) then
        writeln('Файла ', argv[1], ' не существует')
    else if (not argexist) then
        writeln('Использование: ./main in_file.txt out_file.txt');


END.
