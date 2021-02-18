UNIT aset;

INTERFACE
    TYPE Tset = set of char;

    FUNCTION isin(s: Tset; c: char): boolean;
    PROCEDURE nullset(var s: Tset);
    PROCEDURE addset(var s: Tset; c: char);
    PROCEDURE delset(var s: Tset; c: char);
    FUNCTION getlength(const s: Tset): byte;

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

    FUNCTION getlength(s: Tset): byte;
    var n: byte = 0;
    begin
        foreach var i in s do
        begin
            n+= 1;
        end;
        result:= n;
    end;

END.
