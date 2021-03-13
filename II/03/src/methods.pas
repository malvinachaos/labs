UNIT methods;

INTERFACE

    USES types;

    PROCEDURE simple_iterations(var log: text; const eps: byte; const a, b, e: real; f: func; var x1: real; var i: byte);
    PROCEDURE tangent(var log: text; const eps: byte; const a, b, e: real; f: func; var x1: real; var i: byte);
    PROCEDURE newton(var log: text; const eps: byte; const e: real; f: func; var x1: real; var i: byte);
    PROCEDURE segments(var log: text; var a, b, e: real; var ch: byte);


IMPLEMENTATION

    PROCEDURE simple_iterations(var log: text; const eps: byte; const a, b, e: real; f: func; var x1: real; var i: byte);
    Var x0: real;
    Begin
        x1:= 0;
        i:= 0;

        WRITELN(log, '[SIMPLE_ITERATIONS]: User set segments ends: [',a, ', ', b, ']');
        x0:= (a + b)/2;
        WRITELN(log, '[SIMPLE_ITERATIONS]: First approach = ', x0);

        repeat
            x1:= f(x0);
            i += 1;
            WRITELN(log, '  [SIMPLE_ITERATIONS]: _[', i:3, ']_ | f(', x0:3:eps, ') = ', x1:3:eps);
            x0:= x1;
        until (abs(x1 - x0) < e) or (a < x1) and (x1 < b) or (i = 100);

        WRITELN(log, '[SIMPLE_ITERATIONS]:', #13#10, '    Count of iterations = ', i, 
                #13#10, '    Root is = ', x1, #13#10);
    End;

    PROCEDURE tangent(var log: text; const eps: byte; const a, b, e: real; f: func; var x1: real; var i: byte);
    var x0, tmp: real;
    begin
        x0:= a;
        x1:= b;
        i:= 0;

        WRITELN(log, '[TANGENT]: First approaching is ', x0);
        WRITELN(log, '[TANGENT]: Second approaching is ', x1);

        while abs(x1 - x0) > e do
        begin
            tmp:= x1 - (f(x1)*(x1 - x0)) / (f(x1) - f(x0));
            x0:= x1;
            x1:= tmp;
            i += 1;
            WRITELN(log, '  [TANGENT]: _[', i:3, ']_ | ', x1, ' - ', x0, ' | > ', e);
        end;

        WRITELN(log, '[TANGENT]:', #13#10, '    Count of iterations = ', i,
                #13#10, '    Root is = ', x1, #13#10);
    end;

    PROCEDURE newton(var log: text; const eps: byte; const e: real; f: func; var x1: real; var i: byte);
    var x0, tmp: real;
    begin
        x1:= 0;
        i:= 0;

        write('[Метод Ньютона]: Введите начальное приближение: ');
        readln(x0);
        writeln();
        WRITELN(log, '[NEWTON]: Approaching is ', x0);

        WRITELN(log, '  [NEWTON]: |x1-x0| < e');
        repeat
            tmp:= x0;
            x1:= x0 - f(x0) / ( (f(x0+e/2) - f(x0-e/2)) /e);
            i += 1;
            WRITELN(log, '  [NEWTON]: _[', i:3, ']_ | ', x1, ' - ', x0, ' | < ', e);
        until (abs(x1 - x0) >= e);

        WRITELN(log, '[NEWTON]:', #13#10, '    Count of iterations = ', i,
                #13#10, '    Root is = ', x1, #13#10);
    end;

    PROCEDURE segments(var log: text; var a, b, e: real; var ch: byte);
    Begin
        repeat
            write(': ');
            readln(ch);
        until (ch = 1) or (ch = 2) or (ch = 3);
        WRITELN(log, '[SEGMENTS]: User choose a function number = ', ch);

        repeat
            write(': Введите концы отрезка [a,b]: ');
            readln(a, b);
            writeln();
        until (a < b);

        repeat
            write('Введите точность ε: ');
            readln(e);
        until (e > 0) and (e < 1);
        WRITELN(log, '[SEGMENTS]: User specified accuracy: ', e, #13#10);
    End;

END.
