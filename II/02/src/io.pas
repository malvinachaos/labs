UNIT io;

INTERFACE
    VAR logname: string = "H.log";
        log: text;

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

IMPLEMENTATION

FINALIZATION
    assign(log, logname);
    append(log);
    WRITELN(log, '===================PROGRAM FINISH==================');
    close(log);

END.
