PROGRAM paste_n_taste_your_pain;

USES types, methods, funcs;

VAR a, b, e: real;
    formula_1: string = '        ⁷√x * sin²x' + #13#10 + 
                        '⁵√e⁻ˣ + ──────────── - x' + #13#10 +
                        '          1 + ln(x)';
    
    formula_2: string = '1' + #13#10 +
                        '─(e⁻ˣ - √eˣ + 3,7) - x' + #13#10 +
                        '3';


BEGIN

    segments(a, b, e);

    writeln('1)', #13#10, formula_1, #13#10);
    writeln(#13#10, 'Результат метода деления пополам: ', half_divide(a, b, e, f_12):10:9);
    writeln('Результат метода простых итераций: ', simple_iterations(a, e, f_12_x):8:5);

    segments(a, b, e);
    writeln(#13#10, '2)', #13#10, formula_2, #13#10);
    writeln(#13#10, 'Результат метода деления пополам: ', half_divide(a, b, e, f_20):10:9);
    writeln('Результат метода простых итераций: ', simple_iterations(a, e, f_20_x):8:5);

END.
