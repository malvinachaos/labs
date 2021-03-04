UNIT uchr;

INTERFACE
    TYPE ustr = record
        x: array of char;
        n: byte;
    end;

    PROCEDURE stread(var log: text; var s: ustr);
    PROCEDURE stread(var log: text; var s: ustr; var f: text);
    PROCEDURE stride(var log: text; const s: ustr);
    PROCEDURE stride(var log: text; const s: ustr; var f: text);
    FUNCTION getlength(var log: text; const s: ustr): byte;
    FUNCTION find(var log: text; const ch: char; const s: ustr): byte;
    FUNCTION find(var log: text; const ch, s: ustr): byte;
    PROCEDURE stropy(var log: text; const s: ustr; const l, k: byte; var s1: ustr);
    PROCEDURE remove(var log: text; var s: ustr; const l, k: byte);
    PROCEDURE con(var log: text; const s, s1: ustr; var s2: ustr);


IMPLEMENTATION
    PROCEDURE stread(var log: text; var s: ustr);
    var c: char = '0';
    begin
        WRITE(log, '[STREAD]: Reading from keyboard', #13#10,
                '[STREAD]: ');
        while c <> #10 do
        begin
            read(c);
            s.n += 1;
            setlength(s.x, s.n);
            s.x[s.n-1]:= c;
            WRITE(log, c);
        end;
            WRITELN(log);
    end;

    PROCEDURE stread(var log: text; var s: ustr; var f: text);
    var c: char = '0';
    begin
        reset(f);
        WRITE(log, '[STREAD]: Reading from file', #13#10,
              '[STREAD]: ');
        while c <> #10 do
        begin
            read(f, c);
            s.n += 1;
            setlength(s.x, s.n);
            s.x[s.n-1]:= c;
            WRITE(log, c);
        end;
        WRITELN(log);
        close(f);
    end;

    PROCEDURE stride(var log: text; const s: ustr);
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

    PROCEDURE stride(var log: text; const s: ustr; var f: text);
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

    FUNCTION getlength(var log: text; const s: ustr): byte;
    begin
        result:= s.n;
        WRITELN(log, '[GETLENGTH]: Size of string is [', result, ']');
    end;

    FUNCTION find(var log: text; const ch: char; const s: ustr): byte;
    var flg: boolean = true;
        i: byte;
    begin
        result:= 0;
        while (result < s.n) and flg do
            if s.x[result] = ch then flg:= false
            else result += 1;

        if flg then
        begin
            result:= 0;
            WRITELN(log, '[FIND]: There is no symbol in string');
        end
        else
        begin
            result += 1;
            WRITE(log, '[FIND]: Position of [', ch, '] in [');
            FOR I:= 0 TO S.N-1 DO
                WRITE(log, S.X[I]);
            WRITE(log, '] is [', result, ']');
        end;
    end;

    FUNCTION find(var log: text; const ch, s: ustr): byte;
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
                    flg:= false;
            end;
        end;

        if flg or (result >= s.n-1) then
        begin
            result:= 0;
            WRITELN(log, '[FIND]: There is no understring in string');
        end
        else
        begin
            WRITE(log, '[FIND]: Position of [');
            FOR I:= 0 TO CH.N-1 DO
                WRITE(log, CH.X);

            WRITE(log, '] in [');
            FOR I:= 0 TO S.N-1 DO
                WRITE(log, S.X[I]);

            WRITELN(log, '] is [', result, ']');
        end;

    end;

    PROCEDURE stropy(var log: text; const s: ustr; const l, k: byte; var s1: ustr);
    var i, p: byte;
    begin
        s1.n:= 0;
        setlength(s1.x, s1.n);

        if (k+l-1) >= s.n then p:= s.n-1
        else p:= l;

        if k < s.n then
        begin
            for i:= k to p+l do
            begin
                s1.n += 1;
                setlength(s1.x, s1.n);
                s1.x[s1.n-1]:= s.x[i];
            end;

            WRITE(log, '[STROPY]: From [');
            FOR I:= 0 TO S.N-1 DO
                WRITE(log, S.X[I]);
            
            WRITE(log, '] was copied [');
            FOR I:= k TO P+L DO
                WRITE(log, S.X[i]);
            
            WRITELN(log, '] (from ',l,' to ',l+k-1,')');
        end;
    end;

    PROCEDURE remove(var log: text; var s: ustr; const l, k: byte);
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
            WRITELN(log, '[REMOVE]: Was deleted from ',l,' to ',l+k-1);
        end;
    end;

    PROCEDURE con(var log: text; const s, s1: ustr; var s2: ustr);
    var i: byte;
    begin
        s2.n:= s.n + s1.n;
        setlength(s2.x, s2.n);

        WRITE(log, '[CON]: ');
        for i:= 0 to s.n-1 do
        begin
            s2.x[i]:= s.x[i];
            WRITE(log, s2.x[i]);
        end;

        WRITE(log, ' + ');
        for i:= 0 to s1.n-1 do
        begin
            s2.x[s.n+i]:= s1.x[i];
            WRITE(log, s2.x[s.n+i]);
        end;
        WRITELN(log);
    end;

END.
