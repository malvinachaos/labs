UNIT udef;

INTERFACE
    TYPE ustr = string;

    PROCEDURE nullstr(var s: ustr);
    PROCEDURE stread(var s: ustr);
    PROCEDURE stread(var s: ustr; var f: text);
    PROCEDURE stride(const s: ustr);
    PROCEDURE stride(const s: ustr; var f: text);
    FUNCTION getlength(const s: ustr): byte;
    FUNCTION find(const ch: char; const s: ustr): byte;
    FUNCTION find(const ch, s: ustr): byte;
    PROCEDURE stropy(const s: ustr; const l, k: byte; var s1: ustr);
    PROCEDURE remove(var s: ustr; const l, k: byte);
    PROCEDURE con(const s, s1: ustr);


IMPLEMENTATION
    PROCEDURE nullstr(var s: ustr);
    begin
        s:= '';
    end;

    PROCEDURE stread(var s: ustr);
    var c: char = '0';
    begin
        WRITELN(log, '[STREAD]: Reading from keyboard');
        while c <> #13#10 do
        begin
            read(c);
            s+= c;
            WRITE(log, '[STREAD]: ', c);
        end;
        WRITELN(log);
    end;

    PROCEDURE stread(var s: ustr; var f: text);
    var c: char = '0';
    begin
        WRITE(log, '[STREAD]: Reading from file', #13#10,
                '[STREAD]: ');
        while eoln(f) do
        begin
            read(f, c);
            WRITE(log, c);
            s+= c;
        end;
        WRITELN(log);
    end;

    PROCEDURE stride(const s: ustr);
    begin
        WRITELN(log, '[STRIDE]: Writing to console');
        writeln(s);
        WRITELN(log, '[STRIDE]: ', s);
    end;

    PROCEDURE stride(const s: ustr; var f: text);
    begin
        WRITELN(log, '[STRIDE]: Writing to output file');
        writeln(f, s);
        WRITELN(log, '[STRIDE]: ', s);
    end;

    FUNCTION getlength(const s: ustr): byte;
    begin
        result:= length(s);
    end;

    FUNCTION find(const ch: char; const s: ustr): byte;
    begin
        result:= pos(ch, s);
    end;

    FUNCTION find(const ch, s: ustr): byte;
    begin
        result:= pos(ch, s);
    end;

    PROCEDURE stropy(const s: ustr; const l, k: byte; var s1: ustr);
    begin
        s1:= copy(s, l, k);
    end;

    PROCEDURE remove(var s: ustr; const l, k: byte);
    begin
        delete(s, l, k);
    end;

    PROCEDURE con(const s, s1: ustr; var s2: ustr);
    begin
        s2:= s + s1;
    end;


END.
