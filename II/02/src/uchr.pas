UNIT uchr;

INTERFACE
    TYPE ustr = record
        x: array of char;
        n: byte;
    end;

    PROCEDURE nullstr(var log: text; var s: ustr);
    PROCEDURE stread(var log: text; var s: ustr);
    PROCEDURE stread(var log: text; var s: ustr; var f: text);
    PROCEDURE stride(var log: text; const s: ustr);
    PROCEDURE stride(var log: text; const s: ustr; var f: text);
    FUNCTION getlength(var log: text; const s: ustr): byte;
    FUNCTION find(var log: text; const ch: char; const s: ustr): byte;
    FUNCTION find(var log: text; const ch, s: ustr): byte;
    PROCEDURE stropy(var log: text; const s: ustr; const m, n: byte; var s1: ustr);
    PROCEDURE remove(var log: text; var s: ustr; const m, n: byte);
    PROCEDURE con(var log: text; const s: ustr; var s1: ustr);


IMPLEMENTATION
    PROCEDURE nullstr(var log: text; var s: ustr);
    begin
        s.n:= 0;
        setlength(s.x, s.n);
    end;

    PROCEDURE stread(var log: text; var s: ustr);
    var c: char = '0';
    begin
        WRITELN(log, '[STREAD]: Reading from keyboard');
        read(c);
        s.n:= 0;
        setlength(s.x, s.n);
        while c <> #10 do
        begin
            s.n += 1;
            setlength(s.x, s.n);
            s.x[s.n-1]:= c;
            WRITELN(log, '    [STREAD]: _[', (s.n-1):2, ']_ = ', c);
            read(c);
        end;
            WRITELN(log);
    end;

    PROCEDURE stread(var log: text; var s: ustr; var f: text);
    var c: char = '0';
    begin
        reset(f);
        WRITELN(log, '[STREAD]: Reading from file');
        read(f, c);
        s.n:= 0;
        setlength(s.x, s.n);
        while c <> #10 do
        begin
            s.n += 1;
            setlength(s.x, s.n);
            s.x[s.n-1]:= c;
            WRITELN(log, '    [STREAD]: _[', (s.n-1):2, ']_ = ', c);
            read(f, c);
        end;
            WRITELN(log);
        close(f);
    end;


    PROCEDURE stride(var log: text; const s: ustr);
    var i: byte = 0;
    begin
        WRITELN(log, '[STRIDE]: Writing to console');
        for i:= 0 to s.n-1 do
        begin
            write(s.x[i]);
            WRITELN(log, '    [STRIDE]: _[', i:2, ']_ = ', s.x[i]);
        end;
        writeln();
        WRITELN(log);
    end;

    PROCEDURE stride(var log: text; const s: ustr; var f: text);
    var i: byte = 0;
    begin
        WRITELN(log, '[STRIDE]: Writing to console');
        for i:= 0 to s.n-1 do
        begin
            write(f, s.x[i]);
            WRITELN(log, '    [STRIDE]: _[', i:2, ']_ = ', s.x[i]);
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
            WRITELN(log, '] is [', result, ']');
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
            result += 1;
            WRITE(log, '[FIND]: Position of [');
            FOR I:= 0 TO CH.N-1 DO
                WRITE(log, CH.X);

            WRITE(log, '] in [');
            FOR I:= 0 TO S.N-1 DO
                WRITE(log, S.X[I]);

            WRITELN(log, '] is [', result, ']');
        end;
        WRITELN(log);

    end;

    PROCEDURE stropy(var log: text; const s: ustr; const m, n: byte; var s1: ustr);
    var i, p, l, k: byte;
    begin
        l:= m-1;
        k:= n-1;

        s1.n:= 0;
        setlength(s1.x, s1.n);

        if (k+l-1) >= s.n then p:= s.n-1
        else p:= k;

        if p+l <= s.n then
        begin
            for i:= l to p+l do
            begin
                s1.n += 1;
                setlength(s1.x, s1.n);
                s1.x[s1.n-1]:= s.x[i];
            end;

            WRITE(log, '[STROPY]: From [');
            FOR I:= 0 TO S.N-1 DO
                WRITE(log, S.X[I]);
            
            WRITE(log, '] was copied [');
            FOR I:= L TO P+L DO
                WRITE(log, S.X[i]);
            
            WRITELN(log, '] (from ',m,' to ',m+n-1,')');
        end;
    end;


    PROCEDURE remove(var log: text; var s: ustr; const m, n: byte);
    var i, l, k: byte;
    begin
        l:= m-1; {начальная позиция}
        k:= l+n-1; {конечная позиция}

        if l < s.n then
        begin
            if k < s.n then
            begin
                k:= s.n-n-1;
                for i:= l to k do
                begin
                    WRITELN(log, '    [REMOVE]: _[', i:2, ']_ = ', s.x[i], ' was replaced by ', s.x[i+n]);
                    s.x[i]:= s.x[i+n];
                end;
                s.n -= n;
            end
            else
            begin
                WRITELN(log, '    [REMOVE] WARNING: The number of characters to be removed is greater than the size of the string');
                s.n:= m;
            end;

            setlength(s.x, s.n);
            WRITELN(log, '[REMOVE]: New size of string is ', s.n);
        end;
    end;

    PROCEDURE con(var log: text; const s: ustr; var s1: ustr);
    var i, j: byte;
    begin
        if s1.n = 0 then j:= 0
        else if s1.n < s.n then j:= s1.n
        else j:= s.n;

        s1.n += s.n;
        setlength(s1.x, s1.n);
        WRITELN('[CON]: new size of string is ', s1.n);

        WRITELN('[CON]: Cycle will starts from ', j, ' to ', s1.n-1);
        if j > 1 then
            FOR I:= 0 TO J-1 DO
                WRITELN('    [CON]: _[', i:2, ']_ = ', s1.x[i]);

        for i:= j to s1.n-1 do
        begin
            s1.x[i]:= s.x[i-j];
            WRITELN('    [CON]: _[', i:2, '|', (i-j):2, ']_ = ', s1.x[i], ' | ', s.x[i-j]);
        end;
        WRITELN(log);
    end;

END.
