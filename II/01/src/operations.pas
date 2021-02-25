UNIT operations;

INTERFACE
    USES aset;

    VAR log: text;

    PROCEDURE filread(var f: text; var s: tset);
    PROCEDURE keyread(var s: tset);
    PROCEDURE outfile(var f: text; s: tset);
    PROCEDURE unite(var s: tset; const s1: tset);
    PROCEDURE cross(var s: tset; const s1: tset);
    PROCEDURE sub(var s: tset; const s1: tset);

IMPLEMENTATION

    PROCEDURE filread(var f: text; var s: tset);
    var i: byte = 0;
        c: char;
    begin
        nullset(s);
        reset(f);

        WRITE(log, '[FILREAD]: ( ');
        while (not eoln(f)) and (i <= 102) do
        begin
            read(f, c);
            if (c <> ' ') then
                addset(s, c);
            i += 1;
            WRITE(log, c);
        end;
        WRITELN(log, ')');
        close(f);
        WRITELN(log, '[FILREAD]: File closed');
    end;

    PROCEDURE keyread(var s: tset);
    var i, n: byte;
        c: char;
    begin
        nullset(s);
        repeat
            write('Введите кол-во символов(не больше 52): ');
            readln(n);
        until (n > 0) and (n <= 52);
        WRITELN(log, '[KEYREAD]: Count elements = ', n);

        while i < n do
        begin
            write('[', i:2, ']: ');
            repeat
                readln(c);
            until ((ord('A') <= ord(c)) and (ord(c) <= ord('Z'))) or
                  ((ord('a') <= ord(c)) and (ord(c) <= ord('z')));
            addset(s, c);
            i += 1;
            WRITELN(log, '[KEYREAD]: [', i:2, '] = ', c);
        end;
    end;

    PROCEDURE outfile(var f: text; const s: tset);
    var ch: char;
    begin
        WRITE(log, '[OUTFILE]: ( ');
        for ch:= 'A' to 'Z' do
            if isin(s, ch) then
            begin
                write(f, ch, ' ');
                WRITE(log, ch, ' ');
            end;
        for ch:= 'a' to 'z' do
            if isin(s, ch) then
            begin
                write(f, ch, ' ');
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');
    end;

    PROCEDURE unite(var s: tset; const s1: tset);
    var ch: char;
    begin
        WRITE(log, '[UNITE]: Added characters ( ');
        for ch:= 'A' to 'Z' do
            if isin(s1, ch) and not isin(s, ch) then
            begin
                addset(s, ch);
                WRITE(log, ch, ' ');
            end;

        for ch:= 'a' to 'z' do
            if isin(s1, ch) and not isin(s, ch) then
            begin
                addset(s, ch);
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');
    end;

    PROCEDURE cross(var s: tset; const s1: tset);
    var ch: char;
    begin
        WRITE(log, '[CROSS]: Removed characters ( ');
        for ch:= 'A' to 'Z' do
            if isin(s, ch) and not isin(s1, ch) then
            begin
                delset(s, ch);
                WRITE(log, ch, ' ');
            end;

        for ch:= 'a' to 'z' do
            if isin(s, ch) and not isin(s1, ch) then
            begin
                delset(s, ch);
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');
    end;

    PROCEDURE sub(var s: tset; const s1: tset);
    var ch: char;
    begin
        WRITE(log, '[SUB]: Removed characters ( ');
        for ch:= 'A' to 'Z' do
            if isin(s, ch) and isin(s1, ch) then
            begin
                delset(s, ch);
                WRITE(log, ch, ' ');
            end;

        for ch:= 'a' to 'z' do
            if isin(s, ch) and isin(s1, ch) then
            begin
                delset(s, ch);
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');
    end;

END.
