PROGRAM weird_sience;

USES sysutils, crt;

TYPE one = array of integer;

PROCEDURE in_array(var f: text; x: one; n: integer);
Var i: integer;
Begin
    reset(f);

    for i:= 0 to n do
        read(f, x[i]);

    close(f);
End;

PROCEDURE ou_array(var f: text; x: one; n: integer);
Var i: integer;
Begin
    for i:= 0 to n do
        write(f, x[i], ' ');
    writeln(f, #13#10);
End;

FUNCTION sinde(x: one; n, v: integer; var k: integer): integer;
Var i: integer;
    flg: boolean;
Begin
    i:= k;
    flg:= true;

    while (i < n) and flg do
        if (x[i] = v) then 
        begin
            flg:= false;
            k:= i;
        end
        else i:= i + 1;

    if flg then sinde:= -1
    else sinde:= i;
End;

PROCEDURE re_array(var z: one; x: one; var n: integer; v1, v2: integer);
Var i: integer;
Begin
    n:= v2 - v1 + 1;
    setlength(z, n-1);

    for i:= 0 to n-1 do
        z[i]:= x[v1+i];
End;

VAR a, b: one;
    itxt, otxt: text;
    v1, v2, in1, in2, i, n, k: integer;
    fexi, aexi: boolean;

BEGIN
    fexi:= FileExists(argv[1]) and FileExists(argv[2]) and FileExists(argv[3]);
    aexi:= ParamCount = 4;

    if fexi and aexi then
    begin
        assign(otxt, argv[4]);
        rewrite(otxt);
        for i:= 1 to 3 do
        begin
            assign(itxt, argv[i]);
            repeat
                write('Введите размер массива ', argv[i], ': ');
                readln(n);
            until (n >= 2) and (n <= 100);
            setlength(a, n);
            n -= 1;

            write('Введите числа v1 и v2 соответственно: ');
            readln(v1, v2);

            in_array(itxt, a, n);
            k:= 0;
            in1:= sinde(a, n, v1, k);
            k += 1;
            in2:= sinde(a, n, v2, k);

            if (in1 <> -1) and (in2 <> -1) and (in2 - in1 + 1 > 1) then
            begin
                re_array(b, a, n, in1, in2);
                writeln(otxt, 'Значения изменённого массива ', argv[i], ', размером ', n, ':');
                ou_array(otxt, b, n-1);
            end
            else 
            begin
                writeln(otxt, 'Числа не нашлись, вывод изначального массива ', argv[i], ':');
                ou_array(otxt, a, n);
            end;
        end;
        close(otxt);
    end
    else if not aexi then writeln('Использование: ./program file1.txt file2.txt file3.txt out.txt')
    else
    begin
        write('Файлов ');
        if not fileexists(argv[1]) then write(argv[1], ' ');
        if not fileexists(argv[2]) then write(argv[2], ' ');
        if not fileexists(argv[3]) then write(argv[3], ' ');
        writeln('не существуют');
    end;

END.
