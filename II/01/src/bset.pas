UNIT bset;

INTERFACE
    TYPE Tset = array [1..52] of boolean;

    FUNCTION isin(s: Tset; c: char): boolean;
    PROCEDURE nullset(var s: Tset);
    PROCEDURE addset(var s: Tset; c: char);
    PROCEDURE delset(var s: Tset; c: char);

IMPLEMENTATION
    FUNCTION isin(s: Tset; c: char): boolean;
    begin
        result:= s[ord(c)];
    end;

    PROCEDURE nullset(var s: Tset);
    var i: byte;
    begin
        for i:= 1 to 52 do
            s[i]:= false;
    end;

    PROCEDURE addset(var s: Tset; c: char);
    begin

    end;

    PROCEDURE delset(var s: Tset; c: char);
    begin

    end;
