UNIT io;

INTERFACE
    VAR logname: string = 'H.log';
        log, otxt, itxt: text;
        fex: boolean = false;
        aex:= paramcount = 2;

IMPLEMENTATION

INITIALIZATION
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

    WRITELN(log, '===================PROGRAM START===================');
    close(log);

    if paramcount > 0 then
        fex:= fileexists(paramstr(1));


FINALIZATION

END.
