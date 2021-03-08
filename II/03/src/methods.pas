UNIT methods;

INTERFACE

    USES types;

    FUNCTION simple_iterations(var log: text; const a, b, e: real; f: func): real;
	FUNCTION tangent(var log: text; const e: real; f: func): real;
    PROCEDURE segments(var log: text; var a, b, e: real; var ch: byte);


IMPLEMENTATION

    FUNCTION simple_iterations(var log: text; const a, b, e: real; f: func): real;
    Var x0, x1: real;
        i: byte = 0;
    Begin

        x0:= (a + b)/2;
		WRITELN(log, '[SIMPLE_ITERATIONS]: First approach = ', x0);

        repeat
            x1:= f(x0);
            x0:= x1;
            i += 1;
            WRITELN(log, '  [SIMPLE_ITERATIONS]: ', i:3, ': f(', x0:5:3, ') = ', x1);
        until (abs(x1 - x0) < e) or (a < x1) and (x1 < b) or (i = 100);

        result:= x1;
    End;

	FUNCTION tangent(var log, const e: real; f: func): real;
	var x0, x1, tmp: real;
	begin
		write('Введите первое начальное приближение:  ');
		readln(x0);
		WRITELN(log, '[TANGENT]: First approaching is ', x0);

		write('Второе начальное приближение: ');
		readln(x1);
		WRITELN(log, '[TANGENT]: Second approaching is ', x1);

		while abs(x1 - x0) > e do
		begin
			tmp:= x1;
			x1:= x1 - (x1-x0) * f(x1)/(f(x1) - f(x0));
			x0:= tmp;
			WRITELN(log, '  [TANGENT]: | ', x1, ' - ', x0, ' | > ', e);
		end;

		result:= x0;
	end;

    PROCEDURE segments(var log, var a, b, e: real; var ch: byte);
    Begin
        repeat
            write(': ');
            readln(ch);
        until (ch = 1) or (ch = 2) or (ch = 3);
		WRITELN(log, '[SEGMENTS]: User choose a function number = ', ch);

        repeat
            write('Введите концы отрезка [a,b]: ');
            readln(a, b);
        until (a < b);
		WRITELN(log, '[SEGMENTS]: User set segments ends: [',a, ', ', b, ']');

        repeat
            write('Введите точность ε: ');
            readln(e);
        until (e > 0) and (e < 1);
		WRITELN(log, '[SEGMENTS]: User specified accuracy: ', e);

    End;

END.
