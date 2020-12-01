PROGRAM weird_sience;

USES sysutils, crt;

TYPE one = array of integer;

PROCEDURE in_array(var f: text; x: one; n: integer);
Var i: integer;
Begin
{}  textcolor(blue);
{}  writeln('[in]: ');
    reset(f);

    for i:= 0 to n do
    begin
        read(f, x[i]);
        write('[', i, '] ');
    end;
{} writeln(#13#10, '[in]: All data read');
    close(f);
End;

PROCEDURE ou_array(var f: text; x: one; n: integer);
Var i: integer;
Begin
{}  textcolor(blue);
{}  writeln('[ou]: ');
    for i:= 0 to n do
    begin
        write(f, x[i], ' ');
        write('[', i, '] ');
    end;
{} writeln(#13#10, '[ou]: All data written');
    writeln(f, #13#10);
End;

FUNCTION index_v1(x: one; n, v: integer): integer;
Var i: integer;
    flg: boolean;
Begin
{}  textcolor(cyan);
{}  writeln('[v1]: ');
    i:= 0;
    flg:= true;

    while (i < n) and flg do
        if (x[i] = v) then flg:= false
        else i:= i + 1;
{}  writeln('[v1]: We found it: ', i);

    if flg then index_v1:= -1
    else index_v1:= i;
End;

FUNCTION index_v2(x: one; n, v: integer): integer;
Var i: integer;
    flg: boolean;
Begin
{}  textcolor(cyan);
{}  writeln('[v2]: ');
    i:= n;
    flg:= true;

    while (i >= 0) and flg do
        if x[i] = v then flg:= false
        else i:= i - 1;
{}  writeln('[v2]: We found it: ', i);
    if flg then index_v2:= -1
    else index_v2:= i;
End;

PROCEDURE re_array(var z: one; x: one; var n: integer; v1, v2: integer);
Var i: integer;
Begin
{}  textcolor(magenta);
    n:= v2 - v1 + 1;
{}  write('[re]: Arrays size: ', n, #13#10, '[re]: ');
    setlength(z, n-1);

    for i:= 0 to n-1 do
    begin
        z[i]:= x[v1+i];
{}      write(z[i], ' ');
    end;
    writeln();
End;

VAR a, b: one;
    itxt, otxt: text;
    v1, v2, in1, in2, i, n: integer;
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
{}          textcolor(green);

            assign(itxt, argv[i]);

{}          writeln('File ', argv[i], ' opened');

            repeat
{}              textcolor(white);
                write('Введите размер массива ', argv[i], ': ');
                readln(n);
            until (n >= 2) and (n <= 100);

{}          textcolor(green);
{}          writeln('Size of array: ', n);
            setlength(a, n);
            n:= n - 1;

{}          textcolor(white);
            write('Введите числа v1 и v2 соответственно: ');
            readln(v1, v2);

            in_array(itxt, a, n);
            in1:= index_v1(a, n, v1);
            in2:= index_v2(a, n, v2);

            if (in1 <> -1) and (in2 <> -1) and (in2 - in1 + 1 > 1) then
            begin
{}              textcolor(green);
{}              writeln('True');

                re_array(b, a, n, in1, in2);
{}              textcolor(white);
                writeln(otxt, 'Значения изменённого массива ', argv[i], ', размером ', n, ':');
                ou_array(otxt, b, n-1);
            end
            else 
            begin
{}              textcolor(green);
{}              writeln('False');

                writeln(otxt, 'Числа не нашлись, вывод изначального массива ', argv[i], ':');
                ou_array(otxt, a, n);
            end;

{}          textcolor(green);
{}          writeln('D O N E', #13#10);
{}          textcolor(white);
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
