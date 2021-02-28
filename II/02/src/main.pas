PROGRAM H;

USES io;

VAR run: boolean = false;
    menu: byte = 0;

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
    begin
        1:
        begin
            assign(log, logname);
            rewrite(log);
            WRITELN(log, '===================PROGRAM START===================');
            close(log);
        end;

        2:
        begin

        end;

        3: run:= false;
    end;

end;

END.
