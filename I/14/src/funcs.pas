UNIT funcs;

INTERFACE

    FUNCTION f_12(x: real): double;
    FUNCTION f_20(x: real): double;


IMPLEMENTATION

    USES types;

    FUNCTION pow(x, i: real): real;
    Begin
        pow:= exp(ln(x) * i);
    End;
    
    FUNCTION f_12(x: real): double;
    Begin
        f_12:= exp(-x/5) + (pow(x, (1/7)) * sin(x)*sin(x))/(1+ln(x)) - x;
    End;
    
    FUNCTION f_20(x: real): double;
    Begin
        f_20:= (exp(-x) - exp(x/2) + 3.7)/3 - x;
    End;
    

END.
