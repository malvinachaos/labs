UNIT io;

INTERFACE

VAR log: text;
    logname: string = 'The_Great_Gig_in_the_Sky.log';

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

WRITELN(log, '_.=[PROGRAM START]=._');
close(log);

FINALIZATION

END.
