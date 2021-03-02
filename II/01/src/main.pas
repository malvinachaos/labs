PROGRAM Out_Of_Earth;

USES io, cset, operations;

VAR run: boolean = true;
    A, B, C: tset;

BEGIN

writeln('Программа для вычисления множества (A v B) ^ (C \ B)', #13#10);

while run do
begin
    write('Выберите опцию:', #13#10,
          '(1) Очистить лог-файл', #13#10,
          '(2) Решить задачу', #13#10,
          '(3) Выход', #13#10,
          ': ');
    readln(menu);

    case menu of
    '1':
    begin
        assign(log, logname);
        rewrite(log);
        WRITELN(log, #13#10, '==============PROGRAM START=============');
        WRITELN(log, '[LOG]: Cleared');
        close(log);
    end;

    '2':
    Begin
        assign(log, logname);
        append(log);

        if filist and argist then
        begin
            assign(txt, paramstr(1));
            setread(A, txt);
            WRITELN(log, '[MAIN]: A is read', #13#10);
        
            assign(txt, paramstr(2));
            setread(B, txt);
            WRITELN(log, '[MAIN]: B is read', #13#10);
        
            assign(txt, paramstr(3));
            setread(C, txt);
            WRITELN(log, '[MAIN]: C is read', #13#10);
        end
        else if not argist then
        begin
            writeln('Использование: main.exe a.txt b.txt c.txt');
            WRITELN(log, '[MAIN] WARNING: User did not specify files on command line',
                    #13#10);
        end
        else
        begin
            writeln('Одного из указанных файлов не существует');
            WRITELN(log, '[MAIN] ERROR: User specify files that does not exist',
                    #13#10);
        end;

        if not (argist and filist) then
        begin
            setread(A);
            WRITELN(log, #13#10, '[MAIN]: A is read');

            setread(B);
            WRITELN(log, #13#10, '[MAIN]: B is read');

            setread(C);
            WRITELN(log, #13#10, '[MAIN]: C is read');
        end;

        WRITELN(log);
        setwrite(A);
        WRITELN(log, '[MAIN]: Set A has written to log file', #13#10);

        setwrite(B);
        WRITELN(log, '[MAIN]: Set B has written to log file', #13#10);

        setwrite(C);
        WRITELN(log, '[MAIN]: Set C has written to log file', #13#10);

        unite(A, B);
        setwrite(A);
        WRITELN(log);

        sub(C, B);
        setwrite(C);
        WRITELN(log);

        cross(A, C);
        setwrite(A);
        WRITELN(log);

        close(log);
    end;

    '3':
    begin
        run:= false;
        assign(log, logname);
        append(log);
        WRITELN(log, '============PROGRAM FINISHED============', #13#10, #13#10);
        close(log);
    end;

    end;
end;
END.
