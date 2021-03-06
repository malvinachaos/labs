TYPE ustr = record
    x: array of char;
    n: byte;
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
            WRITELN(log, '    [STREAD]: _[', s.n-1, ']_ = ', c);
            read(c);
        end;
            WRITELN(log);
    end;

PROCEDURE stride(var log: text; const s: ustr);
    var i: byte = 0;
    begin
        WRITELN(log, '[STRIDE]: Writing to console');
        for i:= 0 to s.n-1 do
        begin
            write(s.x[i]);
            WRITELN(log, '    [STRIDE]: _[', s.n-1, ']_ = ', s.x[i]);
        end;
        writeln();
        WRITELN(log);
    end;

PROCEDURE remove(var log: text; var s: ustr; const m, n: byte);
    var i, p, l, k: byte;
    begin
        l:= m-1; {начальная позиция}
        k:= l+n-1; {конечная позиция}

        if l < s.n then
        begin
            if k > s.n then k:= s.n-l;
            s.n -= n;

            for i:= l to k-1 do
            begin
                WRITELN(log, '[', i, '] = ', s.x[i], ' was replaced by ', s.x[i+n]);
                s.x[i]:= s.x[i+n];
            end;

            setlength(s.x, s.n);
            WRITELN(log, '[REMOVE]: Was deleted from ', l,' to ', k);
        end;
    end;

PROCEDURE con(var log: text; const s1, s2: ustr; var s3: ustr);
var i: byte;
begin
    s3.n:= s1.n + s2.n;
    setlength(s3.x, s3.n);
    WRITELN(log, '[CON]: new size of string is ', s3.n);
    for i:= 0 to s1.n-1 do
    begin
        s3.x[i]:= s1.x[i];
        WRITELN(log, '[CON]: _[', i, ']_ = ', s3.x[i]);
    end;
    WRITELN(log);
    for i:= s1.n to s3.n - 1 do
    begin
        s3.x[i]:= s2.x[i-s1.n];
        WRITELN(log, '[CON]: _[', i, ']_ = ', s3.x[i]);
    end;
    WRITELN(log);
end;

VAR engi, game, res: ustr;
    log: text;

BEGIN
    assign(log, 'Shine_On_You_Crazy_Diamond.log');
    rewrite(log);

    write('$ ');
    stread(log, engi);
    write('$ ');
    stread(log, game);

    stride(log, game);
    stride(log, engi);
    writeln();

    con(log, engi, game, res);
    stride(log, res);
    WRITELN(log, 'Testing deleting feature');

    remove(log, res, 3, 5);
    stride(log, res);

    close(log);
END.
