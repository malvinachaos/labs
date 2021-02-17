UNIT aset;

INTERFACE
    TYPE Tset = set of char;

    FUNCTION isin(s: Tset; c: char): boolean;
    PROCEDURE nullset(var s: Tset);
    PROCEDURE addset(var s: Tset; c: char);
    PROCEDURE delset(var s: Tset; c: char);

IMPLEMENTATION
    FUNCTION isin(s: Tset; c: char): boolean;
    begin
        result:= c in s;
    end;

    PROCEDURE nullset(var s: Tset);
    begin
        s:= [];
    end;

    PROCEDURE addset(var s: Tset; c: char);
    begin
        s+= [c];
    end;

    PROCEDURE delset(var s: Tset; c: char);
    begin
        s-= [c];
    end;
