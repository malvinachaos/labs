PROGRAM Out_Of_Earth;

USES io, aset, operations;

VAR B: array[1..5] of tset;
    i: byte;
    c: char;

BEGIN
    if argist and filist then
    begin
        for i:= 1 to 3 do
        begin
            repeat
                write('Вы хотите считать ', i,
                      '-е множество с клавиатуры или из файла ? [k/f]: ');
                readln(c);
            until (c = 'k') or (c = 'f');

            case c of
                'k': keyread(B[i]);
                'f': 
                begin
                    assign(txt, paramstr(i));
                    filread(txt, B[i]);
                end;
            hyperfill(A[i], B[i]);
            end;
        end;

        {(a ∪ b) ∩ (c \ b)}
        unite(A[1], A[2], A[4]);
        write(otxt, '(a ∪ b) = {');
        outfile(otxt, A[4]);
        writeln(otxt, '}');

        sub(A[2], A[3]);
        write(otxt, #13#10, '(c \ b) = {');
        outfile(otxt, A[2]);
        writeln(otxt, '}');

        cross(A[4], A[2], A[5]);
        write(otxt, #13#10, '(a ∪ b) ∩ (c \ b) = {');
        outfile(otxt, A[5]);
        writeln(otxt, '}')

    end;
END.
