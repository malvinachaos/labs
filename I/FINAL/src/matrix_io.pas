UNIT matrix_io;

INTERFACE
    USES types;
    
    VAR itxt, otxt: text;
        aexi, fexi: boolean;

    PROCEDURE reatrix(var f: text; var x: matrix; m, n: byte);
    PROCEDURE writrix(var f: text; var x: matrix; m, n: byte);


IMPLEMENTATION

    PROCEDURE reatrix(var f: text; var x: matrix; m, n: byte);
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

    PROCEDURE writrix(var f: text; var x: matrix; m, n: byte);
    Var i, j: byte;
    Begin
        writeln(f);
        for i:= 0 to m do
        begin
            for j:= 0 to n do
                write(f, x[i, j], ' ');
            writeln(f);
        end;
    End;


INITIALIZATION
    fexi:= FileExists(paramstr(1)) and FileExists(paramstr(2));
    aexi:= paramcount = 3;

    if aexi and fexi then
    begin
        assign(otxt, paramstr(3));
        rewrite(otxt);
    end
    else if not aexi then writeln('Usage:', #13#10,
        'LC_ALL=ru_RU.UTF-8 ./main.exe a.txt b.txt out.txt')
    else
    begin
        write('Files ');
        if not FileExists(paramstr(1)) then 
            write(paramstr(1), ' ');
        if not FileExists(paramstr(2)) then
            write(paramstr(2), ' ');
        writeln('do not exist');
    end;

FINALIZATION
    if fexi then close(otxt);

END.
