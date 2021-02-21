UNIT operations;

INTERFACE
    USES aset;
    //USES bset;
    //USES cset;

    FUNCTION intosym(const n: byte): char;
    PROCEDURE filread(var f: text; var s: tset);
    PROCEDURE keyread(var s: tset);
    PROCEDURE outfile(var f: text; s: tset);
    PROCEDURE unite(const s, s1: tset; var s2: tset);
    PROCEDURE cross(const s, s1: tset; var s2: tset);
    PROCEDURE sub(var s: tset; const s1: tset);

IMPLEMENTATION

{   FUNCTION nobool(const s: tset): boolean;
    var flg: boolean = true;
    begin
        foreach var c in s do
            if (ord(c) = 0) or (ord(c) = 1) then
                flg:= false;
        result:= flg;
    end;
}
    PROCEDURE filread(var f: text; var s: tset);
    var i: byte = 1;
        c: char;
    begin
        reset(f);
        while (not eof(f)) and (i <= 52) do
        begin
            read(f, c);
            addset(s, c);
            i+= 1;
        end;
        close(f);
    end;

    PROCEDURE keyread(var s: tset);
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
            addset(s, c);
            i+= 1;
        end;
    end;

    PROCEDURE outfile(var f: text; const hs: hyperset);
    var i: byte;
    begin
        for i:= 1 to 52 do
            if s[i] then
                write(f, intosym(i), ' ');
        writeln(f);
    end;

    PROCEDURE unite(const s, s1: tset; var s2: tset);
    var i: byte;
    begin            
{       if nobool(s) then
        begin
            foreach var c in s do
                addset(s2, c);

            foreach var c in s1 do
                if not isin(s2, c) then
                    addset(s2, c);
        end
        else}
        for i:= 1 to 52 do
            if s[i] and not isin(s2, intosym[i]) then
                addset(s2, intosym[i]);
    end;

    PROCEDURE cross(const s, s1: tset; var s2: tset);
    var i: byte;
    begin
        if nobool then
        begin
            foreach var c in s1 do
                if not isin(s, c) then
                    addset(s2, c);
    
            foreach var c in s do
                if not isin(s1, c) and not isin(s2, c) then
                    addset(s2, c);
        end
        else
        begin
            for i:= 1 to 52 do
                if s[i] and isin(s1, intosym[i]) then
                    addset(s2, intosym[i]);
            for i:= 1 to 52 do
                if s1[i] and isin(s, intosym[i]) and (not isin(s2, intosym[i])) then
                    addset(s2, intosym[i]);
        end;
    end;

    PROCEDURE sub(var s: tset; const s1: tset);
    var i: byte;
    begin
        if nobool(s) then
        begin
            foreach var c in s1 do
                if isin(s, c) then
                    delset(s, c);
        end
        else
        begin
            for i:= 1 to 52 do
                if s1[i] and isin(s, intosym[i]) then
                    delset(s, intosym[i]);
        end;
    end;
END.
