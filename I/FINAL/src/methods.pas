UNIT methods;

INTERFACE
    USES TYPES;

    VAR itxt, otxt: text;
        aexi, fexi: boolean;

    PROCEDURE reatrix(var f: text; var x: matrix; m, n: byte);
    PROCEDURE writrix(var f: text; var x: matrix; m, n: byte);
    FUNCTION negarow(x: matrix; m, n: byte): boolean;
    FUNCTION minifunc(x: matrix; m, n: byte; f: func): byte; {вернёт сумму индексов}
    FUNCTION diasum(x: matrix; m, n: byte): integer;

IMPLEMENTATION
    
    PROCEDURE reatrix(var f: text; var x: matrix; m, n: byte);
    Var i, j: byte;
    Begin
        reset(f);
        for i:= 0 to m do
        begin
            for j:=0 to n do
                read(f, x[i, j]);
            readln(f);
        end;
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

    FUNCTION negarow(x: matrix; m, n: byte): boolean;
    Var i, j: byte;
        sum: integer;
        flg: boolean = false;
    Begin
        while (i <= m) and (not flg) do
        begin
            sum:= 0;
            for j:= 0 to n do
                sum+= x[i, j];
            if sum < 0 then flg:= true
            else i+= 1;
        end;

        negarow:= flg;
    End;

    FUNCTION minifunc(x: matrix; m, n: byte; f: func): byte; {вернёт сумму индексов}
    Var i, j: byte;
        y_smol: integer;
    Begin
    
    End;

    FUNCTION diasum(x: matrix; m, n: byte): integer;
    

INITIALIZATION


FINALIZATION

END.
