# ДАНО: Робот - в юго-западном углу поля, на котором расставлено некоторое количество маркеров
# РЕЗУЛЬТАТ: Функция вернула значение средней температуры всех замаркированных клеток
global sum = 0
global k = 0
function gotoborder(r, side)
    while(!isborder(r, side))
        move!(r, side)
    end
end
function taketemperature(r)
    if(ismarker(r))
        global sum = sum + temperature(r)
        global k = k + 1
    end
end
function check_line(r, side)
    while(!isborder(r, side))
        taketemperature(r)
        move!(r, side)
    end
end
function inverse(side)
    if(side == West)
        return Ost
    end
    if(side == Ost)
        return West
    end
end
function main(r::Robot)
    side = Ost
    while(!isborder(r, Nord))
        check_line(r, side)
        side = inverse(side)
        move!(r, Nord)
    end
    if(isborder(r, West))
        check_line(r, Ost)
    elseif(isborder(r, Ost))
        check_line(r, West)
    end
    print(sum/k)
end
