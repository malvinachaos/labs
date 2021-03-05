PROGRAM H;

USES io, uchr;

VAR run: boolean = true;
    menu: byte = 0;
    m, n, len, k, l: byte;
    istr, istr_buff, ostr: ustr;


BEGIN

writeln('Программа обработки строки', #13#10);

while run do
begin
    write('Выберите пункт:', #13#10,
          '(1) Очистить лог-файл', #13#10,
          '(2) Решить задачу', #13#10,
          '(3) Выход', #13#10,
          ': ');
    readln(menu);

    case menu of
        1:
        begin
            assign(log, logname);
            rewrite(log);
            WRITELN(log, '===================PROGRAM START===================');
            close(log);
        end;

        2:
        begin
            assign(log, logname);
            append(log);

            write('Введите число(от 0 до 255): ');
            readln(n);

            if aex and fex then
            begin
                assign(itxt, paramstr(1));
                assign(otxt, paramstr(2));
                rewrite(otxt);
                stread(log, istr, itxt);
            end
            else if (not aex) or (not fex) then
            begin
                if not aex then
                    WRITELN(log,
                        '[MAIN] WARNING: User did not specify files on command line',
                        #13#10);

                if not fex then
                    WRITELN(log,
                        '[MAIN] ERROR: User specify file that does not exist',
                        #13#10);
            end
            else stread(log, istr);

            WRITELN(log, '[MAIN]: String was read');
            m:= getlength(log, istr);
            while m > 0 do
            begin
                WRITELN(log);
                k:= find(log, ' ', istr);
                if k = 0 then
                    k:= m-1;

                stropy(log, istr, 1, k, istr_buff);

                if (getlength(log, istr_buff) - 1) <= n then
                begin
                    WRITELN('    [MAIN -> ostr]: ', getlength(log, ostr));
                    if getlength(log, ostr) = 0 then
                        stropy(log, istr_buff, 1, k, ostr)
                    else
                        con(log, istr_buff, ostr);
                end;

                remove(log, istr, 1, k);

                m:= getlength(log, istr);
                WRITELN(log, '  [MAIN -> while ... do]: Size of source string is ', m);

            end;

            if aex and fex then
            begin
                stride(log, ostr, otxt);
                WRITELN(log, '[MAIN]: New string was written to output file');

                close(otxt);
                WRITELN(log, '[MAIN]: Output file was closed');
            end
            else
            begin
                stride(log, ostr);
                WRITELN(log, '[MAIN]: New string was written to console');
            end;

            close(log);
        end;

        3:
        begin
            run:= false;
            assign(log, logname);
            append(log);
            WRITELN(log, '===================PROGRAM FINISH==================');
            close(log);
        end;
    end;

end;

END.
