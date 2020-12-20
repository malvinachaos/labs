UNIT funcs;

INTERFACE

    FUNCTION f_12(x: real): real;
    FUNCTION f_12_x(x: real): real;
    FUNCTION f_20(x: real): real;
    FUNCTION f_20_x(x: real): real;


IMPLEMENTATION

    
    FUNCTION f_12(x: real): real;
    Var one, two: real;
    Begin
        one:= exp(-x/5);
        two:= exp(ln(abs(x))/7);
        writeln('f_12: ', one, ' ', two);
        f_12:= one + (two * (sin(x) * sin(x)))/(1+ln(abs(x))) - x;
    End;

    FUNCTION f_12_x(x: real): real;
    Var one, two: real;
    Begin
        one:= exp(-x/5);
        two:= exp(ln(abs(x))/7);
        writeln('f_12: ', one, ' ', two);
        f_12_x:= one + (two * (sin(x) * sin(x)))/(1+ln(abs(x)));
    End;
    
    FUNCTION f_20(x: real): real;
    Begin
        f_20:= (exp(-x) - exp(x/2) + 3.7)/3 - x;
    End;
    
    FUNCTION f_20_x(x: real): real;
    Begin
        f_20_x:= (exp(-x) - exp(x/2) + 3.7)/3;
    End;

END.
