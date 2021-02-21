UNIT bset;

INTERFACE
    TYPE tset = array [1..52] of boolean;

    FUNCTION isin(s: tset; c: char): boolean;
    PROCEDURE nullset(var s: tset);
    PROCEDURE addset(var s: tset; c: char);
    PROCEDURE delset(var s: tset; c: char);
    FUNCTION symtoin(const c: char): byte;

IMPLEMENTATION
    FUNCTION symtoin(const c: char): byte;
    var i: byte;
    begin
        i:= ord(c);
        if i > ord('Z') then
            i:= i - ord('a') + 1
        else
            i:= i - ord('A') + 1;
        result:= i;
    end;

    FUNCTION isin(s: tset; c: char): boolean;
    begin
        result:= s[symtoin(c)];
    end;

    PROCEDURE nullset(var s: tset);
    var i: byte;
    begin
        for i:= 1 to 52 do
            s[i]:= false;
    end;

    PROCEDURE addset(var s: tset; c: char);
    begin
        s[symtoin(c)]:= true;
    end;

    PROCEDURE delset(var s: tset; c: char);
    begin
        s[symtoin(c)]:= false;
    end;

END.
