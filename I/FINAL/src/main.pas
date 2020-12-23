PROGRAM last_episode;

USES types, funcs, matrix_io, methods;

VAR row, col, i, j, num: byte;
    ch: array[1..2] of char = ('A', 'B');
    a: matrix;
    ind: coord;

BEGIN
    if aexi and fexi then
    begin
        for i:= 1 to 2 do
        begin
            assign(itxt, paramstr(i));

            repeat
                write('Enter the sizes of the matrix ', ch[i], '(ROWxCOL, (2 <= ROW <= 100) и (2 <= COL <= 100)): ');
                readln(row, col);
                write('Choose a function for it:', #13#10, 
                      '(1) y = x', #13#10, 
                      '(2) y = sin(x) + 2cos(x) - ln(|x|)/ln(2)', #13#10,
                      ': ');
                readln(num);
            until (row >= 2) and (row <= 100) and (col >= 2) and (col <= 100) and ((num = 1) or (num = 2));

            setlength(a, row);
            row-= 1;
            for j:= 0 to row do
                setlength(a[j], col);
            col-= 1;

            reatrix(itxt, a, row, col);

            writeln(otxt, 'Elements of matrix ', ch[i], ': ');
            writrix(otxt, a, row, col);

            if negarow(a, row, col) then
            begin
                case num of
                    1: ind:= minifunc(a, row, col, f_line);
                    2: ind:= minifunc(a, row, col, f_weird);
                end;
                writeln(otxt, 'Indices for which the f (xij) value is minimal: ', ind[0], 'x', ind[1]);
            end
            else writeln(otxt, 'The sum of the main diagonal is ', diasum(a, row, col));

            writeln(otxt, #13#10);
        end;
    end;
END.
