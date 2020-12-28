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
                write('Введите размерность матрицы ', ch[i], '(ROWxCOL, (2 <= ROW <= 100) и (2 <= COL <= 100)): ');
                readln(row, col);
                write('Выберите функцию:', #13#10, 
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

            writeln(otxt, 'The elements of matrix ', ch[i], ': ');
            writrix(otxt, a, row, col);

            if negarow(a, row, col) then
            begin
                case num of
                    1: ind:= minifunc(a, row, col, f_line);
                    2: ind:= minifunc(a, row, col, f_weird);
                end;
                writeln(otxt, 'Indices for which the value of f (xij) is minimal: ', ind[0], 'x', ind[1]);
            end
            else 
                if row = col then writeln(otxt, 'Main diagonal sum is ', diasum(a, row))
                else writeln(otxt, 'This matrix is not square');

            writeln(otxt, #13#10);
        end;
    end;
END.
