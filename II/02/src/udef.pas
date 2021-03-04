UNIT udef;

INTERFACE
    TYPE ustr = string;

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
            s+= c;
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
            WRITE(log, c);
            s+= c;
        end;
        WRITELN(log);
        close(f);
    end;

    PROCEDURE stride(var log: text; const s: ustr);
    begin
        WRITELN(log, '[STRIDE]: Writing to console');
        writeln(s);
        WRITELN(log, '[STRIDE]: ', s);
    end;

    PROCEDURE stride(var log: text; const s: ustr; var f: text);
    begin
        WRITELN(log, '[STRIDE]: Writing to output file');
        writeln(f, s);
        WRITELN(log, '[STRIDE]: ', s);
    end;


    FUNCTION getlength(var log: text; const s: ustr): byte;
    begin
        result:= length(s);
        WRITELN(log, '[GETLENGTH]: Size of string is [', result, ']');
    end;

    FUNCTION find(var log: text; const ch: char; const s: ustr): byte;
    begin
        result:= pos(ch, s);
        WRITELN(log, '[FIND]: Position of [', ch, '] in [', s, '] is [', result, ']');
    end;

    FUNCTION find(var log: text; const ch, s: ustr): byte;
    begin
        result:= pos(ch, s);
        WRITELN(log, '[FIND]: Position of [', ch, '] in [', s, '] is [', result, ']');
    end;

    PROCEDURE stropy(var log: text; const s: ustr; const l, k: byte; var s1: ustr);
    begin
        s1:= copy(s, l, k);
        WRITELN(log, '[STROPY]: From [',s,'] was copied [',s1,'] (from ',l,' to ',l+k-1,')');
    end;

    PROCEDURE remove(var log: text; var s: ustr; const l, k: byte);
    begin
        delete(s, l, k);
        WRITELN(log, '[REMOVE]: Was deleted from ',l,' to ',l+k-1);
    end;

    PROCEDURE con(var log: text; const s, s1: ustr; var s2: ustr);
    begin
        s2:= s + s1;
        WRITELN(log, '[CON]: ',s,' + ',s1);
    end;
    
END.
