UNIT operations;

INTERFACE
    USES aset;
    //USES bset;
    //USES cset;

    PROCEDURE filread(var f: text; var s: Tset);
    PROCEDURE keyread(var s: Tset);
    PROCEDURE outfile(var f: text; s: Tset);
    PROCEDURE unite(var s: Tset; s1: Tset; m: byte);
    PROCEDURE cross(var s: Tset; s1: Tset; m: byte);
    PROCEDURE sub(var s: Tset; s1: Tset; m: byte);

IMPLEMENTATION
    PROCEDURE filread(var f: text; var s: Tset);
    var i: byte = 1;
        c: char;
    begin
        reset(f);
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

    PROCEDURE keyread(var s: Tset);
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

    PROCEDURE outfile(var f: text; s: Tset);
    var i: byte;
    begin
        foreach var c in s do
            write(f, c, ' ');
        writeln(f);
    end;

    PROCEDURE unite(var s: Tset; s1: Tset; m: byte);
    var i: byte;
    begin
        foreach var c in s1 do
            if not isin(s, c) then
                addset(s, c);
    end;

    PROCEDURE cross(var s: Tset; s1: Tset; m: byte);
    var i: byte;
    begin
        foreach var c in s1 do
            if not isin(s, c) then
                delset(s, c);
    end;

    PROCEDURE sub(var s: Tset; s1: Tset; m: byte);
    var i: byte;
    begin
        foreach var c in s1 do
            if isin(s, c) then
                delset(s, c);
    end;
END.
