PROGRAM need_a_dispencer_here;

USES sysutils, crt;

TYPE one = array of integer;

VAR xf, otxt: text;
    n, t1, t2, be, en: integer;
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


PROCEDURE arr_o(var f: text; x: one; n: integer);
Var i: integer;
Begin 
    for i:= 0 to n do
        write(f, x[i], ' ');
    writeln(f, #13#10);
End;

FUNCTION search_t2(x: one; t2, n: integer): integer;
Var i: integer;
    flg: boolean;
Begin
    i:= 0;
    flg:= true;

    while (i < n) and flg do
    begin
        if x[i] > t2 then flg:= false
        else i:= i + 1;
    end;

    if not flg then search_t2:= i
    else search_t2:= -1;
End;

FUNCTION search_t1(x: one; t1, n: integer): integer;
Var i: integer;
    flg: boolean;
Begin
    i:= n;
    flg:= true;

    while (i > 0) and flg do
        if x[i] > t1 then flg:= false
        else i:= i - 1;
    
    if not flg then search_t1:= i
    else search_t1:= -1;
End;

FUNCTION find_num(x: one; n, t1, a, b: integer): integer;
Var i, j, num: integer;
Begin
    num:= x[a];
    
    for i:= a to b do
    begin
        if (x[i] > t1) and (num < x[i]) then
        begin
            num:= x[i];
            j:= i;
        end;
    end;
    
    find_num:= j;
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
            write('Введите количетво элементов массива от 1 до 50: ');
            readln(n);
        until (n >= 2) and (n <= 50);

        write('Введите значения для t1 и t2 соответственно: ');
        readln(t1, t2);

        arr_i(xf, a, n);
        writeln(otxt, 'Значения массива:', #13#10);
        arr_o(otxt, a, n);
        
        be:= search_t2(a, t2, n);
        en:= search_t1(a, t1, n);
 
        if (be <> -1) and (en <> -1) then writeln(otxt, 
            'Номер последнего минимального элемента: ', 
            find_num(a, n, t1, be, en))
        else writeln(otxt, 'Увы, таких чисел не нашлось');

        close(otxt);
    end
    else if (not argexist) or outexist then writeln('Использование:', #13#10, './main file_1.txt out.txt')
    else writeln('Файла ', argv[1], ' не существует');
END.
