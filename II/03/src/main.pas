PROGRAM paste_n_taste_your_pain;

USES types, methods, funcs, io;

VAR a, b, e, x: real;
    eps: byte = 0;
    res1, res2, res3: real;
    it1, it2, it3: byte;
    choice: byte = 0;
    formula_1: string = '        ⁷√x * sin²x' + #13#10 + 
                        '⁵√e⁻ˣ + ──────────── - x' + #13#10 +
                        '          1 + ln(x)';
    
    formula_2: string = '1' + #13#10 +
                        '─(e⁻ˣ - √eˣ + 3,7) - x' + #13#10 +
                        '3';
	run: boolean = true;
	menu: char = '0';


BEGIN

while run do
begin

write('Выберите опцию:', #13#10,
      '(1) Очистить логфайл', #13#10,
	  '(2) Решить задачу', #13#10,
	  '(3) Выход', #13#10,
	  ': ');
readln(menu);

case menu of
	'1':
	begin
		assign(log, logname);
		rewrite(log);
		WRITELN(log, '_.=[PROGRAM START]=._', #13#10,
                '[MAIN]: Logfile is reset', #13#10);
		close(log);
	end;

	'2':
	begin
        assign(log, logname);
        append(log);
 
        writeln('1)', #13#10, formula_1, #13#10);
        writeln(#13#10, '2)', #13#10, formula_2, #13#10);
        segments(log, a, b, e, choice);
        eps:= trunc(ln(round(1/e))/ln(10)) + 1;
        WRITELN(log, '[MAIN]: Count of output symbols after dot is ', eps, #13#10);
 
        case choice of
            1:
            begin
                simple_iterations(log, eps, a, b, e, f_12, res1, it1);
                tangent(log, eps, a, b, e, f_12_x, res2, it2);
                newton(log, eps, a, b, e, f_12_x, res3, it3);
            end;
 
            2:
            begin
                simple_iterations(log, eps, a, b, e, f_20, res1, it1);
                tangent(log, eps, a, b, e, f_20_x, res2, it2);
                newton(log, eps, a, b, e, f_20_x, res3, it3);
            end;
        end;
 
        if (res1 > a) and (res1 < b) then
            writeln('Результат метода простых итераций = ', res1:8:eps, #13#10,
                    'Количество итераций = ', it1, #13#10)
        else
            writeln('Корень вышел за пределы выбранного отрезка');

        if (res2 > a) and (res2 < b) then
            writeln('Результат метода секущих: ', res2:8:eps, #13#10,
                    'Количество итераций = ', it2, #13#10)
        else
            writeln('Производная функции на выбранном отрезке меняется быстро,',
                    ' поэтому она расходится, данный метод не применим');

        if (res3 > a) and (res1 < b) then
            writeln('Результат метода Ньютона = ', res3:8:eps, #13#10,
                    'Количество итераций = ', it3, #13#10)
        else
            writeln('Корень вышел за пределы выбранного отрезка');
 
        close(log);
	end;

    '3':
    begin
        run:= false;
        assign(log, logname);
        append(log);
        WRITELN(log, '-.=[PROGRAM FINISHED]=.-');
        close(log);
    end;

end;
end;

END.
