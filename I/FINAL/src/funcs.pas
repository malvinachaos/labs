UNIT funcs;

INTERFACE
    USES type;

    FUNCTION f_line(x: integer): integer;
    Begin
        f_line:= ;
    End;

    FUNCTION f_weird(x: real): real;
    Begin
        f_weird:= ln(abs(sin(x)*sin(x)))/ln(10) + x;
    End;

IMPLEMENTATION


END.
