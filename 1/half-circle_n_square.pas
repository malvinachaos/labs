PROGRAM by_Marina;

VAR xc, xs, a, r: real;
    k:integer;

BEGIN
    writeln('Введите следующие значения:');

    repeat
        write('центр окружности по координате абсциссы: ');
        read(xc);

        write(#13#10, 'радиус окружности: '); 
        read(r);
     
        write('центр квадрата по координате абсциссы: ');
        read(xs);
     
        write(#13#10, 'сторона квадрата: ');
        read(a);
        
        write(#13#10, 'угол полуокружности:', #13#10, 
            '1 -- диаметр полуокружности и нижняя сторона лежат на оси', #13#10, 
            '2 -- диаметр перпендикулярен оси, фигура смотрит налево и центр квадрата лежит на оси', 
            #13#10,
            '3 -- диаметр перпендикулярен оси, фигура смотрит направо и центр квадрата лежит на оси', 
            #13#10, ': ');
        read(k);

    until ((r > 0) and (a > 0) and ((k = 1) or (k = 2) or (k = 3)));
    a:= a/2;

    if ( ( (k = 1) and (xc + r >= xs - a) and (xc - r <= xs + a) ) or  {это на перечечение/касание}
         ( (k = 2) and (xc >= (xs - a)) and (xc - r <= xs + a) ) or
         ( (k = 3) and (xc + r >= xs - a) and (xc <= (xs + a)) )
       ) then
    begin
        if ( ( (k = 1) and ( (xc + r = xs - a) or (xc - r = xs + a) ) ) or {касание}
             ( (k = 2) and (  (xc = (xs - a)) or (xc - r = xs + a) ) ) or
             ( (k = 3) and (  (xc + r = xs - a) or (xc = (xs + a)) ) )
           ) then writeln('Фигуры касаются')
        else
        begin
            if ( ( (k = 1) and ( (xc - r >= xs - a) and (xc + r <= xs + a) ) ) or
                 ( (k = 2) and ( (xc - r >= xs - a) and (xc <= (xs + a)) ) and (r/2 <> a) ) or
                 ( (k = 3) and ( (xc >= (xs - a)) and (xc + r <= xs + a) ) and (r/2 <> a) )
               ) then 
            begin
                    writeln('Полуокружность вложена в квадрат');
                    if (xc = xs) then
                        writeln('Фигуры концетричны');
            end
            else
            begin
                if ( ( (k = 1) and (xc - r <= xs - a) and (xc + r >= xs + a) ) or
                     ( (k = 2) and (xc - r <= xs - a) and (xc >= (xs + a)) and (r/2 <> a) ) or        
                     ( (k = 3) and (xc <= (xs - a)) and (xc + r >= xs + a) and (r/2 <> a) )
                   ) then
                begin
                        writeln('Квадрат вложен в полуокружность');
                        if (xc = xs) then
                            writeln('Фигуры концетричны');
                end
                else writeln('Фигуры пересекаются');
            end;
        end;
    end
    else
        writeln('Фигуры не пересекаются');

END.
