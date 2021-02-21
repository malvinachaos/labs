UNIT cset;

INTERFACE
    TYPE tset = record
            x: array of char;
            n: byte;
        end;
    TYPE hyperset = array of char;

    FUNCTION isin(s: tset; c: char): boolean;
    PROCEDURE nullset(var s:tset);
    PROCEDURE addset(var s: tset; c: char);
    PROCEDURE delset(var s: tset; c: char);

IMPLEMENTATION
    PROCEDURE nullset(var s: tset);
    begin
        s.n:= 0;
        setlength(s.x, s.n);
    end;
    
    FUNCTION isin(s: tset; c: char): boolean;
    var i: byte = 1;
    begin
        result:= false;
        
        while (i <= s.n) and (not result) do
        begin
            if s.x[i] = c then
                result:= true;
            i+= 1;
        end;
    end;

    PROCEDURE addset(var s: tset; c: char);
    begin
        if not isin(s, c) then
        begin
            s.n+= 1;
            setlength(s.x, s.n);
            s.x[s.n-1]:= c;
        end;
    end;

    PROCEDURE delset(var s: tset; c: char);
    var i: byte = 0;
        flg: boolean = false;
    begin
        if isin(s, c) then
        begin
            while (i <= s.n) and not flg do
                if s.x[i] = c then flg:= true
                else i+= 1;
            while (i < s.n) do
            begin
                s.x[i]:= s.x[i+1];
                i+= 1;
            end;
            s.n-= 1;
            setlength(s.x, s.n);
        end;
    end;


END.
