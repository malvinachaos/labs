PROGRAM by_Marina;

USES sysutils;

TYPE onedim = array of integer;

VAR Af, Cf, out: text;
    A, C: onedim;
    n, num: integer;
    fexists: boolean;
    allargs: boolean;

FUNCTION pow(x: integer): integer;
Begin
    pow:= x*x;
End;

PROCEDURE arr_i(var f: text; var x: onedim; n: integer);
Var i: integer;
Begin
    reset(f);
    setlength(x, n+1);

    for i:= 0 to n do
        read(f, x[i]);

    close(f);
End;

PROCEDURE arr_o(var f: text; x: onedim; n: integer);
Var i: integer;
Begin
    for i:= 0 to n do
        write(f, x[i], ' ');
End;

FUNCTION  find_num(x: onedim; y: onedim; n: integer):integer;
Var i, num, mini, chibi: integer;
Begin
    num:= -1;
    mini:= pow(x[0]) - pow(y[0]);
    for i:= 1 to n do
    begin
        chibi:= pow(x[i]) - pow(y[i]);
        if (chibi < mini) then
        begin
            mini:= chibi;
            num:= i+1;
        end;
    end;
    
    find_num:= num;
End;

BEGIN
    fexists:= FileExists(argv[1]) and FileExists(argv[2]);
    allargs:= (argv[1] <> '') and (argv[2] <> '') and (argv[3] <> '');

    if allargs and fexists then
    begin
        assign(Af, argv[1]);
        assign(Cf, argv[2]);
        assign(out, argv[3]);
        rewrite(out);

        repeat
            write('Введите количество элементов(больше 2, но меньше 30): ');
            readln(n);
        until((2 < n) and (n < 50));
        n:= n - 1;

        arr_i(Af, A, n);
        write(out, 'Значения массива A:', #13#10);
        arr_o(out, A, n);

        arr_i(Cf, C, n);
        write(out, #13#10, #13#10, 'Значения массива C:', #13#10);
        arr_o(out, C, n);

        write(out, #13#10, #13#10, 'Номер наименьшего из значений A^2 - C^2:', #13#10);
        
        num:= find_num(A, C, n);
        
        if num < 1 then writeln(out, 'Таких чисел нет')
        else writeln(out, num);

        close(out);
    end
    else if (not allargs) then writeln(#13#10, 'Использование:', #13#10,
        './main file1.txt file2.txt out_file.txt')
    else if (not fexists) then writeln(#13#10, 'Один или оба файла не существуют')
END.
