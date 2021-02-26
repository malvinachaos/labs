UNIT io;

INTERFACE

    VAR txt: text;
        argist: boolean = false;
        filist: boolean = false;
        choose, ch: char;
        menu: char = '0';
        logname: string = 'Out_Of_Earth.log';
        log: text;

IMPLEMENTATION

INITIALIZATION
    argist:= paramcount = 3;

    if argist then
        filist:= FileExists(paramstr(1)) and 
                 FileExists(paramstr(2)) and 
                 FileExists(paramstr(3));

    if fileexists(logname) then
    begin
        assign(log, logname);
        append(log);
    end
    else
    begin
        assign(log, logname);
        rewrite(log);
    end;

    WRITELN(log, '==============PROGRAM START=============');
    close(log);

FINALIZATION

END.
