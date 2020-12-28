UNIT methods;

INTERFACE

    USES types;

    VAR dbg: boolean = false;

    FUNCTION half_divide(a, b, e: real; f: func): real;
    FUNCTION simple_iterations(a, b, e, x: real; f: func): real;

    PROCEDURE segments(var a, b, e: real; var ch: byte);


IMPLEMENTATION
    

    FUNCTION half_divide(a, b, e: real; f: func): real;
    Var c, l, r, y: real;
        i: byte = 0;
    Begin
        l:= a;
        r:= b;

            repeat
                c:= (r + l) / 2; 
                y:= f(c);

                if dbg then writeln(i:3, ': ', l:8:5, ' | ', c:8:5, ' | ', r:8:5, ' [|] ', sign(f(l)), ' | ', sign(y), ' | ', sign(f(r)));

                if sign(y) <> sign(f(l)) then r:= c
                else if sign(y) <> sign(f(r)) then l:= c;

                i += 1;


            until (i = 101) or (abs(r - l) <= (e)) and (abs(y) <= e);
        
        half_divide:= c;
    End;

    FUNCTION simple_iterations(a, b, e, x: real; f: func): real;
    Var x0, x1: real;
        i: byte = 0;
    Begin
        x0:= round(x);

        repeat
            x1:= x0;
            x0:= f(x1);
            i += 1;
            if dbg then writeln(i:3, ': f(', x0:5:3, ') = ', x1);
        until (abs(x1 - x0) < e) or (i = 100);

        simple_iterations:= x1;
    End;

    PROCEDURE segments(var a, b, e: real; var ch: byte);
    Begin
        repeat
            write(': ');
            readln(ch);
        until (ch = 1) or (ch = 2) or (ch = 3);

        repeat
            write('Введите концы отрезка [a,b]: ');
            readln(a, b);
        until (a < b);

        repeat
            write('Введите точность ε: ');
            readln(e);
        until (e > 0) and (e < 1);
    End;

END.
