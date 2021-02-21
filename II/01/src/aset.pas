UNIT aset;

INTERFACE
    TYPE tset = set of char;

    FUNCTION isin(s: tset; c: char): boolean;
    PROCEDURE nullset(var s: tset);
    PROCEDURE addset(var s: tset; c: char);
    PROCEDURE delset(var s: tset; c: char);

IMPLEMENTATION
    FUNCTION isin(s: tset; c: char): boolean;
    begin
        result:= c in s;
    end;

    PROCEDURE nullset(var s: tset);
    begin
        s:= [];
    end;

    PROCEDURE addset(var s: tset; c: char);
    begin
        s+= [c];
    end;

    PROCEDURE delset(var s: tset; c: char);
    begin
        s-= [c];
    end;

END.
