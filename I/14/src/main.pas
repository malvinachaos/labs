PROGRAM paste_name_here;

USES types, methods, funcs;

VAR a, b, e: real;
    formula_1: string = '        ⁷√x * sin²x' + #13#10 + 
                        '⁵√e⁻ˣ + ──────────── - x' + #13#10 +
                        '          1 + ln(x)';
    
    formula_2: string = '1' + #13#10 +
                        '─(e⁻ˣ - √eˣ + 3,7) - x' + #13#10 +
                        '3';


BEGIN
    repeat
        write('Введите концы отрезка [a,b]: ');
        readln(a, b);
    until (a < b);
    write('Введите точность ε: ');
    readln(e);

    writeln('1)', #13#10, formula_1, #13#10);
    writeln('Метод деления пополам: ', half_divide(a, b, e, f_12):8:5);
    {writeln('Метод простых итераций: ', simple_iterations(f_12, a, b, e):8:5);}

    writeln(#13#10, '2)', #13#10, formula_2, #13#10);
    writeln('Метод деления пополам: ', half_divide(a, b, e, f_20):8:5);
    {writeln('Метод простых итераций: ', simple_iterations(f_20, a, b, e):8:5);}

END.
