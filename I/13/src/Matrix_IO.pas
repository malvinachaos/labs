UNIT Matrix_IO;

INTERFACE

    USES Types, sysutils;

    VAR fitxt, fotxt: text;
        aexi, fexi: boolean;

    PROCEDURE mat_r(var f: text; var x: matrix; m, n: byte);

    PROCEDURE mat_w(var f: text; var x: matrix; m, n: byte);


IMPLEMENTATION

    PROCEDURE mat_r(var f: text; var x: matrix; m, n: byte);
    Var i, j: byte;
    Begin
        reset(f);
        for i:= 0 to m do
        begin
            for j:= 0 to n do
                read(f, x[i, j]);
            readln(f);
        end;
        close(f);
    End;

    PROCEDURE mat_w(var f: text; var x: matrix; m, n: byte);
    Var i, j: byte;
    Begin
        for i:= 0 to m do
        begin
            write(f, '[', i:2, '] ');
            for j:= 0 to n do
                write(f, x[i, j], ' ');
            writeln(f);
        end;
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
        if not aexi then writeln('Использование: ./program.exe a.txt b.txt c.txt out.txt')
        else
        begin
            write('Файлов ');
            if not FileExists(argv[1]) then write(argv[1], ' ');
            if not FileExists(argv[2]) then write(argv[2], ' ');
            if not FileExists(argv[3]) then write(argv[3], ' ');
            writeln('не существуют');
        end;
    end;


FINALIZATION

    if aexi and fexi then close(fotxt);

END.
