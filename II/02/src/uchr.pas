UNIT uchr;

INTERFACE
    TYPE ustr = record
        x: array of char;
        n: byte;
    end;

    PROCEDURE nullstr(var s: ustr);
    PROCEDURE stread(var s: ustr);
    PROCEDURE stread(var s: ustr; var f: text);
    PROCEDURE stride(const s: ustr);
    PROCEDURE stride(const s: ustr; var f: text);
    FUNCTION getlength(const s: ustr): byte;
    FUNCTION find(const ch: char; const s: ustr): byte;
    FUNCTION find(const ch, s: ustr): byte;
    PROCEDURE stropy(const s: ustr; const l, k: byte);
    PROCEDURE remove(var s: ustr; const l, k: byte);
    PROCEDURE con(const s, s1: ustr; var s2: ustr);


IMPLEMENTATION
    PROCEDURE nullstr(var s: ustr);
    begin
        s.n:= 0;
        setlength(s.x, s.n);
    end;

    PROCEDURE stread(var s: ustr);
    var c: char = '0';
    begin
        WRITELN(log, '[STREAD]: Reading from keyboard');
        while c <> #13#10 do
        begin
            read(c);
            s.n += 1;
            setlength(s.x, s.n);
            s.x[s.n-1]:= c;
            WRITE(log, '[STREAD]: ', c);
            WRITELN(log);
        end;

    end;

    PROCEDURE stread(var s: ustr; var f: text);
    var c: char = '0';
    begin
        WRITE(log, '[STREAD]: Reading from file', #13#10,
              '[STREAD]: ');
        while eoln(f) do
        begin
            read(f, c);
            s.n += 1;
            setlength(s.x, s.n);
            s.x[s.n-1]:= c;
            WRITE(log, c);
        end;
        WRITELN(log);
    end;

    PROCEDURE stride(const s: ustr);
    var i: byte = 0;
    begin
        WRITE(log, '[STRIDE]: Writing to console', #13#10,
                '[STRIDE]: ');
        for i:= 0 to s.n-1 do
        begin
            write(s.x[i]);
            WRITE(log, s.x[i]);
        end;
        writeln();
        WRITELN(log);
    end;

    PROCEDURE stride(const s: ustr; var f: text);
    var i: byte = 0;
    begin
        WRITE(log, '[STRIDE]: Writing to file', #13#10,
                '[STRIDE]: ');
        for i:= 0 to s.n-1 do
        begin
            write(f, s.x[i]);
            WRITE(log, s.x[i]);
        end;
        writeln(f);
        WRITELN(log);
    end;

    FUNCTION getlength(const s: ustr): byte;
    begin
        result:= s.n;
    end;

    FUNCTION find(const ch: char; const s: ustr): byte;
    var flg: boolean = true;
    begin
        result:= 0;
        while (result < s.n) and flg do
            if s.x[result] = ch then flg:= false
            else result += 1;

        if flg then result:= -1;
    end;

    FUNCTION find(const ch, s: ustr): byte;
    var flg: boolean = true;
        stop: boolean;
        i: byte;
    begin
        result:= 0;

        if ch.n >= s.n then flg:= false;

        while flg and (result < s.n) do
        begin
            if (ch.x[0] = s.x[result]) and ((s.n - result) >= ch.n) then
            begin
                WRITE(log, '[FIND]: Maybe it is ', result, ': ');
                stop:= true;
                i:= result;

                while stop and (i < ch.n-1) do
                begin
                    if s.x[i] <> ch.x[i - result] then stop:= false
                    else i+= 1;

                    WRITE(log, s.x[i]);
                end;
                WRITELN(log);

                if stop and (i = ch.n-1) then
                begin
                    flg:= false;
                    WRITELN(log, '[FIND]: Understring was found at ', result);
                end;
            end;
        end;

        if flg or (result >= s.n-1) then
        begin
            result:= 0;
            WRITELN(log, '[FIND]: There is no understring in string');
        end;
    end;

    PROCEDURE stropy(const s: ustr; const l, k: byte; var s1: ustr);
    var i, p: byte;
    begin
        s1.n:= 0;
        setlength(s1.x, s1.x);

        if (k+l-1) >= s.n then p:= s.n-1
        else p:= l;

        if k < s.n then
            for i:= k to p+l do
            begin
                s1.n += 1;
                setlength(s1.x, s1.n);
                s1.x[s1.n-1]:= s.x[i];
            end;
    end;

    PROCEDURE remove(var s: ustr; const l, k: byte);
    var i, p: byte;
        sbuf: ustr;
    begin
        if (k+l-1) >= s.n then p:= s.n-1
        else p:= k;

        if l < s.n then
        begin
            for i:= l to l+p do
                s.x[i]:= s.x[k-i];
            setlength(s.x, s.n);
        end;
    end;

    PROCEDURE con(const s, s1: ustr; var s2: ustr);
    var i: byte;
    begin
        s2.n:= s.n + s1.n;
        setlength(s2.x, s2.n);

        for i:= 0 to s.n-1 do
            s2.x[i]:= s.x[i];

        for i:= 0 to s1.n-1 do
            s2.x[s.n+i]:= s1.x[i];
    end;

END.
