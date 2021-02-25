PROGRAM Out_Of_Earth;

USES io, aset, operations;

VAR run: boolean = true;
    A, B, C: tset;
    logname: string = 'Out_Of_Earth.log';

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
        close(log);
    end;

    '2':
    Begin
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

        if paramcount = 4 then
            assign(otxt, paramstr(4))
        else
            assign(otxt, 'out.txt');
        rewrite(otxt);
        WRITELN(log, '[MAIN]: Out file is opened');

        repeat
            write('Вы хотите считатывать множества с клавиатуры или из файла [k/f]: ');
            readln(choose);
        until (choose = 'k') or (choose = 'f');
        writeln();
        WRITELN(log, '[MAIN]: User choose option (', choose, ')');
    
        if choose = 'f' then
        begin
            if filist and argist then
            begin
                assign(txt, paramstr(1));
                filread(txt, A);
                WRITELN(log, #13#10, '[MAIN]: A is read');
        
                assign(txt, paramstr(2));
                filread(txt, B);
                WRITELN(log, #13#10, '[MAIN]: B is read');
        
                assign(txt, paramstr(3));
                filread(txt, C);
                WRITELN(log, #13#10, '[MAIN]: C is read');
            end;
            
            if not argist then
            begin
                writeln('Использование: main.exe a.txt b.txt c.txt [out.txt]');
                WRITELN(log, '[MAIN] ERROR: User did not specify files on command line');
            end
            else if not filist then
            begin
                writeln('Одного из указанных файлов не существует');
                WRITELN(log, '[MAIN] ERROR: User specify files that does not exist');
            end;
        end;
  
        if choose = 'k' then
        begin
            keyread(A);
            WRITELN(log, #13#10, '[MAIN]: A is read');

            keyread(B);
            WRITELN(log, #13#10, '[MAIN]: B is read');

            keyread(C);
            WRITELN(log, #13#10, '[MAIN]: C is read');
        end;

        if ((choose = 'f') and filist and argist) or (choose = 'k') then
        begin
            WRITELN(log);
            write(otxt, 'A = { ');
            outfile(otxt, A);
            writeln(otxt, '}');
            WRITELN(log, '[MAIN]: Set A has written to out file', #13#10);
    
            write(otxt, 'B = { ');
            outfile(otxt, B);
            writeln(otxt, '}');
            WRITELN(log, '[MAIN]: Set B has written to out file', #13#10);
    
            write(otxt, 'C = { ');
            outfile(otxt, C);
            writeln(otxt, '}');
            WRITELN(log, '[MAIN]: Set C has written to out file', #13#10);
    
            unite(A, B);
            write(otxt, #13#10, '(a v b) = { ');
            outfile(otxt, A);
            writeln(otxt, '}');
            WRITELN(log);
    
            sub(C, B);
            write(otxt, '(c \ b) = { ');
            outfile(otxt, C);
            writeln(otxt, '}');
            WRITELN(log);
    
            cross(A, C);
            write(otxt, '(a v b) ^ (c \ b) = { ');
            outfile(otxt, A);
            writeln(otxt, '}');
            WRITELN(log);

            close(otxt);
            WRITELN(log, '[MAIN]: Out file closed');
        end;

        WRITELN(log, '============PROGRAM FINISHED============', #13#10, #13#10);
        close(log);
    end;

    '3': run:= false;

    end;
end;
END.
