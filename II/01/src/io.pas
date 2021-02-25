UNIT io;

INTERFACE

    VAR txt, otxt: text;
        argist: boolean = false;
        filist: boolean = false;
        choose, ch: char;
        menu: char = '0';

IMPLEMENTATION

INITIALIZATION
    if paramcount >= 3 then
    begin
        filist:= FileExists(paramstr(1)) and 
                 FileExists(paramstr(2)) and 
                 FileExists(paramstr(3));
        argist:= (paramcount = 4) or (paramcount = 3);
    end;

FINALIZATION

END.
