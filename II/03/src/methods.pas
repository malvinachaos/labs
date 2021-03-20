UNIT methods;

INTERFACE

    USES types;

    PROCEDURE simple_iterations(var log: text; const eps: byte; const a, b, e: real; 
                                f: func; var x1: real; var i: byte);
    PROCEDURE tangent(var log: text; const eps: byte; const a, b, e: real; f: func; 
                      var x1: real; var i: byte);
    PROCEDURE newton(var log: text; const eps: byte; const a, b, e: real; f: func; 
                     var x1: real; var i: byte);
    PROCEDURE segments(var log: text; var a, b, e: real; var ch: byte);


IMPLEMENTATION

    PROCEDURE simple_iterations(var log: text; const eps: byte; const a, b, e: real; 
                                f: func; var x1: real; var i: byte);
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
            WRITELN(log, '  [SIMPLE_ITERATIONS]: _[', i:3, ']_ | ', 
                    x1:2:eps, ' = f(', x0:2:eps, ') |||  | ', 
                    x1:2:eps, ' - ', x0:2:eps, ' | <= ', e);
            x0:= x1;
            WRITELN(log, #13#10, '      [SI]: {', x1, ' <= ', a);
            WRITELN(log, '      [SI]: {', x1, ' >= ', b, #13#10);
        until (abs(x1 - x0) <= e) or (i = 100);

        if (a >= x1) or (b <= x1) then
            WRITELN(log, '[SIMPLE_ITERATIONS]: Root is out of selected segment')
        else
            WRITELN(log, '[SIMPLE_ITERATIONS]:', #13#10, '    Count of iterations = ', i, 
                    #13#10, '    Root is = ', x1:2:eps);
        WRITELN(log, #13#10);
    End;

    PROCEDURE tangent(var log: text; const eps: byte; const a, b, e: real; f: func; 
                      var x1: real; var i: byte);
    var x0, tmp: real;
    begin
        x0:= a;
        x1:= b;
        i:= 0;

        WRITELN(log, '[TANGENT]: First approaching is ', x0);
        WRITELN(log, '[TANGENT]: Second approaching is ', x1);

        repeat
            tmp:= x1 - (f(x1)*(x1 - x0)) / (f(x1) - f(x0));
            x0:= x1;
            x1:= tmp;
            i += 1;
            WRITELN(log, '  [TANGENT]: _[', i:3, ']_ | ', x1:2:eps, 
                    ' - ', x0:2:eps, ' | > ', e:2:eps);
        until (abs(x0 - x1) < e) or (i = 100);

        if (x1 <= a) or (x1 >= b) then
            WRITELN(log, '[TANGENT]: Root is out of selected segment')
        else
            WRITELN(log, '[TANGENT]:', #13#10, '    Count of iterations = ', i,
               #13#10, '    Root is = ', x1:2:eps, #13#10);
        WRITELN(log, #13#10);
    end;

    PROCEDURE newton(var log: text; const eps: byte; const a, b, e: real; f: func;
                     var x1: real; var i: byte);
    var x0, tmp: real;
    begin
        x0:= a;
        x1:= 0;
        i:= 0;

        WRITELN(log, '[NEWTON]: Approaching is ', x0);

        WRITELN(log, '  [NEWTON]: |x1-x0| < e');
        repeat
            tmp:= x0;
            x1:= x0 - f(x0) / ( (f(x0+e/2) - f(x0-e/2)) /e);
            i += 1;
            WRITELN(log, '  [NEWTON]: _[', i:3, ']_ | ', x1:2:eps, 
                    ' - ', x0:2:eps, ' | < ', e:2:eps);
        until (abs(x1 - x0) >= e) or (i = 100);

        if (x1 <= a) or (x1 >= b) then
            WRITELN(log, '[NEWTON]: Root is out of selected segment')
        else
            WRITELN(log, '[NEWTON]:', #13#10, '    Count of iterations = ', i,
                    #13#10, '    Root is = ', x1:2:eps, #13#10);
        WRITELN(log, #13#10);
    end;

    PROCEDURE segments(var log: text; var a, b, e: real; var ch: byte);
    Begin
        repeat
            write(': ');
            readln(ch);
        until (ch = 1) or (ch = 2) or (ch = 3);
        WRITELN(log, '[SEGMENTS]: User choose a function number = ', ch);

        repeat
            write('Введите концы отрезка [a,b]: ');
            readln(a, b);
            writeln();
        until (a < b);
        WRITELN(log, '[SEGMENTS]: User set segments ends: [', a, ', ', b, ']');

        repeat
            write('Введите точность ε: ');
            readln(e);
        until (e > 0) and (e < 1);
        WRITELN(log, '[SEGMENTS]: User specified accuracy: ', e, #13#10);
    End;

END.
