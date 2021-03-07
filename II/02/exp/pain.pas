USES uchr in '../src/uchr.pas';


VAR engi, game, res: ustr;
    log: text;

BEGIN
    assign(log, 'Shine_On_You_Crazy_Diamond.log');
    rewrite(log);

    write('$ ');
    stread(log, engi);
    write('$ ');
    stread(log, game);

    stride(log, game);
    stride(log, engi);
    writeln();

    con(log, engi, game);
    stride(log, game);
    WRITELN(log, 'Testing deleting feature');

    remove(log, game, 8, 55);
    stride(log, game);

    close(log);
END.
