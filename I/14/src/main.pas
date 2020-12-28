PROGRAM paste_n_taste_your_pain;

USES types, methods, funcs;

VAR a, b, e, x: real;
    choice: byte = 0;
    formula_1: string = '        ⁷√x * sin²x' + #13#10 + 
                        '⁵√e⁻ˣ + ──────────── - x' + #13#10 +
                        '          1 + ln(x)';
    
    formula_2: string = '1' + #13#10 +
                        '─(e⁻ˣ - √eˣ + 3,7) - x' + #13#10 +
                        '3';


BEGIN

    if paramcount = 1 then
        if paramstr(1) = 'debug' then
            dbg:= true;

    writeln('1)', #13#10, formula_1, #13#10);
    writeln(#13#10, '2)', #13#10, formula_2, #13#10);
    writeln(#13#10, '3)', #13#10, 'sin(x)', #13#10);
    segments(a, b, e, choice);

    case choice of
        1:
        begin
    x:= half_divide(a, b, e, f_12);
    writeln(#13#10, 'Результат метода деления пополам: ', x:10:9);
    writeln('Результат метода простых итераций: ', simple_iterations(a, b, e, x, f_12_x):8:5, #13#10);
        end;

        2:
        begin
    x:= half_divide(a, b, e, f_20);
    writeln(#13#10, 'Результат метода деления пополам: ', x:10:9);
    writeln('Результат метода простых итераций: ', simple_iterations(a, b, e, x, f_20_x):8:5, #13#10);
        end;

        3:
        begin
    x:= half_divide(a, b, e, f_sin);
    writeln(#13#10, 'Результат метода деления пополам: ', x:10:9);
    writeln('Результат метода простых итераций: ', simple_iterations(a, b, e, x, f_sin_x):8:5, #13#10);
        end;
    end;
END.
