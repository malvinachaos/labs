PROGRAM paste_n_taste_your_pain;

USES types, methods, funcs, io;

VAR a, b, e, x: real;
    res1, res2, res3: real;
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
		WRITELN(log, '_.=[PROGRAM START]=._');
		close(log);
	end;

	'2':
	begin
        assign(log, logname);
        append(log);
 
        writeln('1)', #13#10, formula_1, #13#10);
        writeln(#13#10, '2)', #13#10, formula_2, #13#10);
        segments(log, e, choice);
 
        case choice of
            1:
            begin
                res1:= simple_iterations(log, e, f_12);
                res2:= tangent(log, e, f_12_x);
                res3:= newton(log, e, f_12_x);
            end;
 
            2:
            begin
                res1:= simple_iterations(log, e, f_20);
                res2:= tangent(log, e, f_20_x);
                res3:= newton(log, e, f_20_x);
            end;
        end;
 
        writeln(log, '[MAIN]: Result of simple iterations method: ', res1:8:5);
        writeln(log, '[MAIN]: Result of tangent method: ', res2:8:5);
        writeln(log, '[MAIN]: Result of Newton method: ', res3:8:5);
 
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
