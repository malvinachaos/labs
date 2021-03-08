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
	Begin
		assign(log, logname);
		rewrite(log);
		WRITELN(log, '_.=[PROGRAM START]=._');
		close(log);
	End;

	'2':
	Begin

    writeln('1)', #13#10, formula_1, #13#10);
    writeln(#13#10, '2)', #13#10, formula_2, #13#10);
    writeln(#13#10, '3)', #13#10, 'sin(x)', #13#10);
    segments(a, b, e, choice);

    case choice of
        1:
        begin
    writeln('Результат метода простых итераций: ', simple_iterations(a, b, e, f_12_x):8:5, #13#10);
        end;

        2:
        begin
    writeln('Результат метода простых итераций: ', simple_iterations(a, b, e, f_20_x):8:5, #13#10);
        end;

        3:
        begin
    writeln('Результат метода простых итераций: ', simple_iterations(a, b, e, f_sin_x):8:5, #13#10);
        end;
    end;

	End;

end;

end;
END.
