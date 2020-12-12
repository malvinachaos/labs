PROGRAM It_is_who;

USES Matrix_IO, Matrix_Operations, Types;

VAR row, col, i: byte;
    arr: matrix;
    choose: array[1..3] of char = ('A', 'B', 'C');

BEGIN

    if aexi and fexi then
    begin
        for i:= 1 to 3 do
        begin
            assign(fitxt, argv[i]);
            repeat
                write('Введите размерность матрицы ', choose[i], '(кол-во строк и столбцов соотв-о): ');
                readln(row, col);
            until (row >= 2) and (row <= 100) and (col >= 2) and (col <= 100);

            setlength(arr, row, col);
            row -= 1;
            col -= 1;

            mat_r(fitxt, arr, row, col);

            writeln(fotxt, 'Матрица ', choose[i], ':');
            mat_w(fotxt, arr, row, col);

            writeln(fotxt, 'Количество строк матрицы ', choose[i],
                    ' сумма элементов которых положительна, равно ', count_posirows(arr, row, col));

            writeln(fotxt, #13#10, 'Умножаем элементы...');
            multi_nums(arr, row, col);
            writeln(fotxt, 'Теперь количество положительных строк матрицы ', choose[i], ' равно ',
                    count_posirows(arr, row, col), #13#10, #13#10);
        end;
    end;
END.
