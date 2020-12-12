UNIT Matrix_Operations;

INTERFACE

    USES Types, crt;

    FUNCTION count_posirows(x: matrix; m, n: byte): byte;
    PROCEDURE multi_nums(var x: matrix; m, n: byte);

IMPLEMENTATION

    FUNCTION count_posirows(x: matrix; m, n: byte): byte;
    Var i, j: byte;
        cnt: byte = 0;
        sum: integer = 0;
    Begin
{}      textcolor(red);
        for i:= 0 to m do
        begin
            for j:= 0 to n do
                sum += x[i, j];
 
            if (sum > 0) then 
{}          begin
                cnt += 1;
{}              writeln('[', i:2, ']: ', sum);
{}          end;
            sum:= 0;
        end;

        count_posirows:= cnt;
{}      textcolor(lightgray);
{}      writeln();
    End;


    PROCEDURE multi_nums(var x: matrix; m, n: byte);
    Var i, j: byte;
    Begin
{}      textcolor(yellow);
        for i:= 0 to m do
{}      begin
            for j:= 0 to n do
            begin
                if x[i, j] > 0 then x[i, j] *= 2
                else x[i, j] *= 3;
{}              write('[', i:2, 'x', j:2, ']');
            end;
{}          writeln();
{}      end;

{}      textcolor(lightgray);
{}      writeln();
    End;


END.
