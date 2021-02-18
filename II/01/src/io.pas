UNIT io;

INTERFACE
    VAR txt, otxt: text;
        argist, filist: boolean;

IMPLEMENTATION

INITIALIZATION
    filist:= FileExists(paramstr(1)) and 
             FileExists(paramstr(2)) and 
             FileExists(paramstr(3));
    argist:= paramcount = 4;

    if filist and argist then
    begin
        assign(otxt, paramstr(4));
        rewrite(otxt);
    end
    else if argist then writeln('Использование: main.exe a.txt b.txt c.txt out.txt')
    else writeln('Одного из указанных файлов не существует');

FINALIZATION
    if filist and argist then close(otxt);

END.
