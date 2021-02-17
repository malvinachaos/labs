UNIT io;

INTERFACE
    VAR atxt, btxt, ctxt, txt: text;
        argist, filist: boolean;

INITIALIZATION
    filist:= FileExists(paramstr(1)) and 
             FileExists(paramstr(2)) and 
             FileExists(paramstr(3));
    argist:= paramcount = 4;

    if filist and argist then
    begin
        assign(atxt, paramstr(1));
        assign(btxt, paramstr(2));
        assign(ctxt, paramstr(3));
        assign(otxt, paramstr(4));
    end
    else if argist then writeln('Использование: main.exe a.txt b.txt c.txt')
    else writeln('Одного из указанных файлов не существует');

FINALIZATION
    if filist and argist then close(otxt);

END.
