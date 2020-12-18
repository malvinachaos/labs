UNIT methods;

INTERFACE

    USES types;

    FUNCTION half_divide(a, b, e: real; f: func): real;
    {FUNCTION simple_iterations(a, b, e: real; f: func): real;}


IMPLEMENTATION

    FUNCTION sign(num: real): integer;
    Begin
        if num > 0 then sign:= 1;
        if num = 0 then sign:= 0;
        if num < 0 then sign:= -1;
    End;

    FUNCTION half_divide(a, b, e: real; f: func): real;
    Var c, l, r, y: real;
    Begin
        l:= a;
        r:= b;

            repeat
                c:= (r - l) / 2 + 1; 
                y:= f(c);

                if sign(c) <> sign(l) then r:= c;
                if sign(c) <> sign(r) then l:= c;

            until (abs(r - l) <= e) and (abs(y) <= e);{y = 0 ???}
        
        half_divide:= c;
    End;
    {
    FUNCTION simple_iterations(a, b, e: real; f: func): real;
    Var xi, y: real;
    Begin

    End;
    }
END.
