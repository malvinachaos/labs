UNIT methods;

INTERFACE
    USES types;

    FUNCTION negarow(x: matrix; m, n: byte): boolean;
    FUNCTION minifunc(x: matrix; m, n: byte; f: func): coord;
    FUNCTION diasum(x: matrix; m: byte): integer;


IMPLEMENTATION
    
    FUNCTION negarow(x: matrix; m, n: byte): boolean;
    Var i: byte = 0;
        j: byte;
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

    FUNCTION minifunc(x: matrix; m, n: byte; f: func): coord;
    Var i, j: byte;
        y_smol: integer;
        xy: coord = (0, 0);
    Begin
        y_smol:= f(x[0, 0]);
        for i:= 0 to m do
            for j:= 0 to n do
                if f(x[i, j]) < y_smol then 
                begin
                    y_smol:= f(x[i, j]);
                    xy[0]:= i;
                    xy[1]:= j;
                end;
        minifunc:= xy;
    End;

    FUNCTION main_wrong_dia(x: matrix; m: byte): boolean;
    Var i: byte;
        flg: boolean;
    Begin
        i:= 0;
        flg:= true;

        while (i <= m) and flg do
            if x[i, i] <> x[i, m-i] then flg:= false
            else i+= 1;

        main_wrong_dia:= flg;

    End;

    FUNCTION diasum(x: matrix; m: byte): integer;
    Var i: byte;
        sum: integer = 0;
    Begin
        for i:= 0 to m do
            sum+= x[i, i];

        diasum:= sum;
    End;

    FUNCTION wrong(x: matrix; m: byte): boolean;
    Var i, j: byte;
        flg: boolean;
        num: integer;
    Begin
        flg:= false;
        num:= 0;
        i:= 0;

        while (i <= m) and (not flg) do
        begin
            j:= 0;
            while (j < m-i) and (not flg) do
            begin
                if x[i, j] < 0 then
                begin
                    max:= x[i, j];
                    flg:= true;
                end
                else j+= 1;
            end;
            i+= 1;
        end;

        wrong:= flg;
    End;

END.
