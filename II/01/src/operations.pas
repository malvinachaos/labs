UNIT operations;

INTERFACE
    USES aset;

    PROCEDURE setread(var log: text; var s: tset; var f: text);
    PROCEDURE setread(var log: text; var s: tset);
    PROCEDURE setwrite(var log: text; const s: tset);
    PROCEDURE unite(var log: text; const s, s1: tset; var s2: tset);
    PROCEDURE cross(var log: text; const s, s1: tset; var s2: tset);
    PROCEDURE sub(var log: text; const s, s1: tset; var s2: tset);

IMPLEMENTATION

    PROCEDURE setread(var log: text; var s: tset; var f: text);
    var i: byte = 0;
        c: char;
    begin
        nullset(s);
        reset(f);

        WRITE(log, '[SETREAD]: ( ');
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
        WRITELN(log, '[SETREAD]: File closed');
    end;

    PROCEDURE setread(var log: text; var s: tset);
    var i, n: byte;
        c: char;
    begin
        nullset(s);
        repeat
            write('Введите кол-во символов(не больше 52): ');
            readln(n);
        until (n > 0) and (n <= 52);
        WRITELN(log, '[SETREAD]: Count elements = ', n);

        while i < n do
        begin
            write('[', i:2, ']: ');
            repeat
                readln(c);
            until ((ord('A') <= ord(c)) and (ord(c) <= ord('Z'))) or
                  ((ord('a') <= ord(c)) and (ord(c) <= ord('z')));
            addset(s, c);
            i += 1;
            WRITELN(log, '[SETREAD]: [', i:2, '] = ', c);
        end;
    end;

    PROCEDURE setwrite(var log: text; const s: tset);
    var ch: char;
    begin
        WRITE(log, '[SETWRITE]: ( ');
        for ch:= 'A' to 'Z' do
            if isin(s, ch) then
                WRITE(log, ch, ' ');

        for ch:= 'a' to 'z' do
            if isin(s, ch) then
                WRITE(log, ch, ' ');

        WRITELN(log, ')');
    end;


    PROCEDURE unite(var log: text; const s, s1: tset; var s2: tset);
    var ch: char;
    begin
        WRITE(log, '[UNITE]: Copying to output tset: ( ');
        for ch:= 'A' to 'Z' do
            if isin(s, ch) then
            begin
                addset(s2, ch);
                WRITE(log, ch, ' ');
            end;

        for ch:= 'a' to 'z' do
            if isin(s, ch) then
            begin
                addset(s2, ch);
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');

        WRITE(log, '[UNITE]: Added characters ( ');
        for ch:= 'A' to 'Z' do
            if isin(s1, ch) and not isin(s, ch) then
            begin
                addset(s2, ch);
                WRITE(log, ch, ' ');
            end;

        for ch:= 'a' to 'z' do
            if isin(s1, ch) and not isin(s, ch) then
            begin
                addset(s2, ch);
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');
    end;

    PROCEDURE cross(var log: text; const s, s1: tset; var s2: tset);
    var ch: char;
    begin
        WRITE(log, '[CROSS]: Copying to output tset: ( ');
        for ch:= 'A' to 'Z' do
            if isin(s, ch) then
            begin
                addset(s2, ch);
                WRITE(log, ch, ' ');
            end;

        for ch:= 'a' to 'z' do
            if isin(s, ch) then
            begin
                addset(s2, ch);
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');

        WRITE(log, '[CROSS]: Removed characters ( ');
        for ch:= 'A' to 'Z' do
            if isin(s, ch) and not isin(s1, ch) then
            begin
                delset(s2, ch);
                WRITE(log, ch, ' ');
            end;

        for ch:= 'a' to 'z' do
            if isin(s, ch) and not isin(s1, ch) then
            begin
                delset(s2, ch);
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');
    end;

    PROCEDURE sub(var log: text; const s, s1: tset; var s2: tset);
    var ch: char;
    begin
        WRITE(log, '[SUB]: Copying to output tset: ( ');
        for ch:= 'A' to 'Z' do
            if isin(s, ch) then
            begin
                addset(s2, ch);
                WRITE(log, ch, ' ');
            end;

        for ch:= 'a' to 'z' do
            if isin(s, ch) then
            begin
                addset(s2, ch);
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');

        WRITE(log, '[SUB]: Removed characters ( ');
        for ch:= 'A' to 'Z' do
            if isin(s, ch) and isin(s1, ch) then
            begin
                delset(s2, ch);
                WRITE(log, ch, ' ');
            end;

        for ch:= 'a' to 'z' do
            if isin(s, ch) and isin(s1, ch) then
            begin
                delset(s2, ch);
                WRITE(log, ch, ' ');
            end;
        WRITELN(log, ')');
    end;

END.
