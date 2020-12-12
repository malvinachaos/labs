UNIT Matrix_IO;

INTERFACE

    USES Types, sysutils, crt;

    VAR fitxt, fotxt: text;
        aexi, fexi: boolean;

    PROCEDURE mat_r(var f: text; var x: matrix; m, n: byte);

    PROCEDURE mat_w(var f: text; var x: matrix; m, n: byte);


IMPLEMENTATION

    PROCEDURE mat_r(var f: text; var x: matrix; m, n: byte);
    Var i, j: byte;
    Begin
        reset(f);
{}      textcolor(cyan);
        for i:= 0 to m do
        begin
            for j:= 0 to n do
{}          begin
                read(f, x[i, j]);
{}              write('[',i:2, 'x', j:2, ']');
{}          end;
            readln(f);
{}          writeln();
        end;
        close(f);
{}      textcolor(lightgray);
{}      writeln();
    End;

    PROCEDURE mat_w(var f: text; var x: matrix; m, n: byte);
    Var i, j: byte;
    Begin
{}      textcolor(blue);
        for i:= 0 to m do
        begin
            write(f, '[', i:2, '] ');
            for j:= 0 to n do
{}          begin
                write(f, x[i, j], ' ');
{}              write('[',i:2, 'x', j:2, ']');
{}          end;
            writeln(f);
{}          writeln();
        end;
{}      textcolor(lightgray);
{}      writeln();
    End;


INITIALIZATION
    
    aexi:= ParamCount = 4;
    fexi:= FileExists(argv[1]) and FileExists(argv[2]) and FileExists(argv[3]);

    if aexi and fexi then
    begin
        assign(fotxt, argv[4]);
        rewrite(fotxt);
    end
    else
    begin
        if not aexi then writeln('Использование: ./matrirows_counter.exe a.txt b.txt c.txt out.txt')
        else
        begin
            write('Файлов ');
            if FileExists(argv[1]) then write(argv[1], ' ');
            if FileExists(argv[2]) then write(argv[2], ' ');
            if FileExists(argv[3]) then write(argv[3], ' ');
            writeln('не существуют');
        end;
    end;


FINALIZATION

    if aexi and fexi then close(fotxt);

END.
