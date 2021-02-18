PROGRAM Out_Of_Earth;

USES io, aset, operations;

VAR B: array[1..3] of Tset;
    N: array[1..3] of byte;
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
                    outfile(otxt, B[i]);
                    writeln(otxt);
                end;
            end;
            N[i]:= getlength(B[i]);
            writeln(N[i]);
        end;
        {
        (a ∪ b) ∩ (c \ b)
        if N[1] < N[2] then unite(B[1], B[2], N[2])
        else unite(B[1], B[2], N[1]);
        N[1]:= getlength(B[1]);
        writeln(otxt, 'RESULT: ', N[1]);
        outfile(otxt, B[1]);

        if N[3] < N[2] then sub(B[3], B[2], N[2])
        else sub(B[3], B[2], N[3]);
        N[3]:= getlength(B[3]);
        writeln(otxt, #13#10, #13#10, 'RESULT: ', N[3]);
        outfile(otxt, B[3]);

        if N[1] < N[3] then cross(B[1], B[3], N[3])
        else cross(B[1], B[3], N[1]);
        N[1]:= getlength(B[1]);
        writeln(otxt, #13#10, #13#10, 'RESULT: ', N[1]);
        outfile(otxt, B[1]);
        }
    end;
END.
