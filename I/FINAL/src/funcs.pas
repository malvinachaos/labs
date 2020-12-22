UNIT funcs;

INTERFACE
    USES types;

    FUNCTION f_line(x: integer): integer;
    FUNCTION f_weird(x: integer): integer;

IMPLEMENTATION

    FUNCTION f_line(x: integer): integer;
    Begin
        f_line:= x;
    End;

    FUNCTION f_weird(x: integer): integer;
    Begin
        f_weird:= trunc(sin(x) + 2*cos(x) - ln(abs(x))/ln(2));
    End;

END.
