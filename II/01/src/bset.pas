UNIT bset;

INTERFACE
    TYPE tset = array [0..51] of boolean;

    FUNCTION isin(const s: tset; const c: char): boolean;
    PROCEDURE nullset(var s: tset);
    PROCEDURE addset(var s: tset; const c: char);
    PROCEDURE delset(var s: tset; const c: char);

IMPLEMENTATION
    FUNCTION isin(const s: tset; const c: char): boolean;
    var i: byte = 0;
    begin
        i:= ord(c);
        if i > ord('Z') then
            i:= i - ord('a')
        else
            i:= i - ord('A');
        result:= s[i];
    end;

    PROCEDURE nullset(var s: tset);
    var i: byte;
    begin
        for i:= 0 to 51 do
            s[i]:= false;
    end;

    PROCEDURE addset(var s: tset; c: char);
    var i: byte = 0;
    begin
        i:= ord(c);
        if i > ord('Z') then
            i:= i - ord('a')
        else
            i:= i - ord('A');
        s[i]:= true;
    end;

    PROCEDURE delset(var s: tset; c: char);
    var i: byte = 0;
    begin
        i:= ord(c);
        if i > ord('Z') then
            i:= i - ord('a')
        else
            i:= i - ord('A');
        s[i]:= false;
    end;

END.
