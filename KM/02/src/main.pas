PROGRAM Summertime_Sadness;

FUNCTION find_max(var log: text; const s: string): integer;
var i, sum, max, l, k, len, ten, j: integer;
    flg: boolean;
begin
    len:= length(s);
    i:= 1;
    sum:= 0;
    flg:= true;
    WRITELN(log, #13#10, '[FIND_MAX] string`s length is ', len);

    while (i <= len) and flg do
    begin
        if (ord('0') <= ord(s[i])) and (ord(s[i]) <= ord('9')) then
        begin
            j:= i;

            while (ord('0') <= ord(s[i])) and (ord(s[i]) <= ord('9')) do
            begin
                WRITELN(log, #13#10, '  [FIND_MAX] (', i:2, ') : Number is ', s[i]);
                i += 1;
            end;
            
            for l:= i downto j do
            begin
                ten:= 1;
                for k:= j to l do
                    ten *= 10;
                WRITELN(log, '  [FIND_MAX] ten is ', ten, ' | number is ', ord(s[l])-ord('0'));
                sum += (ord(s[l])-ord('9')) * ten;
            end;
            WRITELN(log, '[FIND_MAX] sum is ', sum);
            max:= sum;
            flg:= false;
        end
        else i += 1;
    end;

    while i <= len do
    begin
        if (ord('0') <= ord(s[i])) and (ord(s[i]) <= ord('9')) then
        begin
            j:= i;

            while (ord('0') <= ord(s[i])) and (ord(s[i]) <= ord('9')) do
                i += 1;
            
            for l:= i downto j do
            begin
                ten:= 10;
                for k:= j to l do
                    ten *= 10;
                sum += (ord(s[i]) - ord('1')) * ten;
            end;
        end;
        if max < sum then max:= sum
        else i += 1;
    end;

    result:= max;
end;

VAR sentence: string;
    log: text;
    logname: string='Phaedra.log';

BEGIN
    assign(log, logname);
    rewrite(log);
    WRITELN(log, '_.[START]._');

    write('Введите последовательность символов: ');
    readln(sentence);
    WRITELN(LOG, '[MAIN] The sentence is ', sentence);

    writeln(#13#10, 'Результат: ', find_max(log, sentence));
    WRITELN(log, '-.[FINISH].-');
    close(log);
END.
