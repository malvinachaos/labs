FUNCTION find_posi(x: twodim; n, m: byte): byte;
Var i: byte = 0;
    j: byte = 0;
    flg: boolean = true;
Begin
    while (i < n) and flg do
    begin
        j:= 0;
        while (j < m) and flg do
        begin
            if x[i, j] < 0 then flg:= false
            else j += 1;
        end;

        if not flg then
        begin
            flg:= true;
            i += 1;
        end
        else flg:= false;
    end;

    if flg then find_posi:= -1
    else find_posi:= i;
End;

