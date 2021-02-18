UNIT bset;

INTERFACE
    TYPE Tset = array [1..52] of boolean;

    FUNCTION isin(s: Tset; c: char): boolean;
    PROCEDURE nullset(var s: Tset);
    PROCEDURE addset(var s: Tset; c: char);
    PROCEDURE delset(var s: Tset; c: char);
    FUNCTION getlength(const s: Tset): byte;

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
        s[ord(c)]:= true;
    end;

    PROCEDURE delset(var s: Tset; c: char);
    begin
        s[ord(c)]:= false;
    end;

    FUNCTION getlength(const s: Tset): byte;
    var i, n: byte;
    begin
        n:= 0;
        for i:=1 to 52 do
        begin
            if s[i] then n+= 1;
        end;
        result:= n;
    end;

END.
