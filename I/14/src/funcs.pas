UNIT funcs;

INTERFACE

    FUNCTION f_12(x: real): real;
    FUNCTION f_20(x: real): real;


IMPLEMENTATION

    USES types;

    FUNCTION pow(x, i: real): real;
    Begin
        pow:= exp(ln(x) * i);
    End;
    
    FUNCTION f_12(x: real): real;
    Var one, two: real;
    Begin
        one:= exp(-x/5);
        two:= pow(x, (1/7)) * sin(x)*sin(x);
        f_12:= one + two/(1+ln(x)) - x;
    End;
    
    FUNCTION f_20(x: real): real;
    Begin
        f_20:= (exp(-x) - exp(x/2) + 3.7)/3 - x;
    End;
    

END.
