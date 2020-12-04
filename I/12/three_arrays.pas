PROGRAM Made_In_Heaven;

USES sysutils;

TYPE onedim = array of integer;

PROCEDURE out_choice(i: byte);
Begin

End;

PROCEDURE finarr(var f: text; var x: onedim; n: byte);
Var i: byte;
Begin
    reset(f);
    for i:= 0 to n do
        read(f, x[i]);
    close(f);
End;

PROCEDURE fouarr(var f: text; var x: onedim; n: byte);
Var i: byte;
Begin
    for i:= 0 to n do
        write(f, x[i], ' ');
    writeln(f);
End;

FUNCTION minimum(x: onedim; n: byte): integer;
Var i: byte;
    min: integer;
Begin
    min:= x[0];
    for i:= 1 to n do
        if x[i] < min then
            min:= x[i];
    minimum:= min;
End;

VAR arr: onedim;
    c: array [1..3] of integer;
    itxt, otxt: text;
    a, b, mini, number: integer;
    n, i: byte;
    fexi, aexi: boolean;

BEGIN
    aexi:= paramcount = 4;
    fexi:= fileexists(argv[1]) and fileexists(argv[2]) and fileexists(argv[3]);

    if aexi and fexi then
    begin
        assign(otxt, argv[4]);
        rewrite(otxt);

        write('Задайте концы отрезка AB: ');
        readln(a, b);
        if a > b then
        begin 
            writeln('Перестановка');
            a += b;
            b:= a - b;
            a -= b;
        end;
         
        for i:= 1 to 3 do
        begin
            assign(itxt, argv[i]);
        
            repeat
                write('Введите размерность массива ');
                case i of
                    1: write('a: ');
                    2: write('b: ');
                    3: write('c: ');
                end;
                readln(n);
            until (n >= 2) and (n <= 100);
            setlength(arr, n);
            n -= 1;
   
            finarr(itxt, arr, n);

            write(otxt, 'Значения массива ');
            case i of
                1: writeln(otxt, 'a:');
                2: writeln(otxt, 'b:');
                3: writeln(otxt, 'c:');
            end;

            fouarr(otxt, arr, n);

            c[i]:= minimum(arr, n); 
            writeln(otxt, 'Минимальное число этого массива: ', c[i], #13#10, #13#10);
        end;

        mini:= b+1;
        number:= 0;
        for i:= 1 to 3 do
            if (mini > c[i]) and (c[i] >= a) and (c[i] <= b) then
            begin 
                mini:= c[i];
                number:= i;
            end;

        if number = 0 then 
             writeln(otxt, 'Ни одно найденное значение не принадлежит отрезку')
        else 
        begin
            write(otxt, 'Минимальное значение, принадлежащее [', 
                  a, '; ', b, ']', ' имеет массив ');
            case number of
                1: writeln(otxt, 'a');
                2: writeln(otxt, 'b');
                3: writeln(otxt, 'c');
            end;
        end;
        close(otxt);
    end
    else
    begin
        writeln('Использовани:', #13#10, './three_arrays.exe a.txt b.txt c.txt out.txt');
    end;
END.
