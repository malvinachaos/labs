UNIT Matrix_Operations;

INTERFACE

    USES Types;

    FUNCTION count_posirows(x: matrix; m, n: byte): byte;
    PROCEDURE multi_nums(var x: matrix; m, n: byte);

IMPLEMENTATION

    FUNCTION count_posirows(x: matrix; m, n: byte): byte;
    Var i, j: byte;
        cnt: byte = 0;
        sum: integer = 0;
    Begin
        for i:= 0 to m do
        begin
            for j:= 0 to n do
                sum += x[i, j];
 
            if (sum > 0) then 
                cnt += 1;
            sum:= 0;
        end;

        count_posirows:= cnt;
    End;


    PROCEDURE multi_nums(var x: matrix; m, n: byte);
    Var i, j: byte;
    Begin
        for i:= 0 to m do
            for j:= 0 to n do
                if x[i, j] > 0 then x[i, j] *= 2
                else x[i, j] *= 3;

    End;


END.
