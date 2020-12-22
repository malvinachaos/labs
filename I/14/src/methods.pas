UNIT methods;

INTERFACE

    USES types;

    FUNCTION half_divide(a, b, e: real; f: func): real;
    FUNCTION simple_iterations(a, e: real; f: func): real;

    PROCEDURE segments(var a, b, e: real);


IMPLEMENTATION
    

    FUNCTION half_divide(a, b, e: real; f: func): real;
    Var c, l, r, y: real;
        i: byte = 0;
    Begin
        l:= a;
        r:= b;

            repeat
                c:= (r - abs(l)) / 2; 
                y:= f(c);

                if y*f(l) <= 0 then r:= c
                else l:= c;

                i += 1;

            until (i = 101) or (abs(r - l) <= (2*e)) and (abs(y) <= e);
        
        half_divide:= c;
    End;

    FUNCTION simple_iterations(a, e: real; f: func): real;
    Var xi: real;
        i: byte = 0;
    Begin
        xi:= a;

        while (abs(f(xi) - xi) > e) and (i < 100) do
        begin
            xi:= f(xi);
            i += 1;
        end;

        simple_iterations:= xi;
    End;

    PROCEDURE segments(var a, b, e: real);
    Begin
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
