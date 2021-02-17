UNIT operations;

INTERFACE
    USES aset;
    //USES bset;
    //USES cset;

    PROCEDURE filread(f: text; s: Tset);
    PROCEDURE keyread(s: Tset);
    PROCEDURE outfile(var f: text; s: Tset);
    PROCEDURE unite(out s: Tset; s1: Tset);
    PROCEDURE cross(out s: Tset; s1: Tset);
    PROCEDURE sub(out s: Tset; s1: Tset);

IMPLEMENTATION
    PROCEDURE filread(f: text; var s: Tset);
    var i: byte = 1;
        c: char;
    begin
        reset(f)
        while (not eof(f)) and (i <= 52) do
        begin
            read(f, c);
            if not isin(s, c) then
            begin
                addset(s, c);
                i+= 1;
            end;
        end;
        close(f);
    end;

    PROCEDURE keyread(s: Tset);
    var i, n: byte;
        c: char;
    begin
        repeat
            write('Введите кол-во символов(не больше 52): ');
            readln(n);
        until (n >= 1) and (n <= 52);

        while i <= n do
        begin
            write('set[', i:2, ']: ');
            readln(c);
            if not isin(s, c) then
            begin
                addset(s, c);
                i+= 1;
            end;
        end;
    end;

    PROCEDURE outfile(var f: text; s: Tset; n: byte);
    var i: byte;
    begin
        for i:= 1 to n do
            write(f, s[i], ' ');
        writeln(f);
    end;

    PROCEDURE unite(out s: Tset; s1: Tset; m: byte);
    var i: byte;
    begin
        for i:= 1 to m do
            if not isin(s, s1[i]) then
                addset(s, s1[i]);
    end;

    PROCEDURE cross(out s: Tset; s1: Tset; m: byte);
    var i: byte;
    begin
        for i:= 1 to m do
            if not isin(s, s1[i]) then
                delset(s, s1[i]);
    end;

    PROCEDURE sub(out s: Tset; s1: Tset; m: byte);
    var i: byte;
    begin
        for i:= 1 to m do
            if isin(s, s1[i]) then
                delset(s, s[i]);
    end;
