# ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля,
# на котором могут находиться также внутренние прямоугольные перегородки (все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки)
# РЕЗУЛЬТАТ: Робот - в исходном положении и в углах поля стоят маркеры
function gotobegin(r) # Возвращет робота в начальную точку обходя границы слева и снизу
    while(!((isborder(r, West)) & (isborder(r, Sud)))) 
        gotoborder(r, West)
        gotoborder(r, Sud)
    end
end
function gotoborder(r, side) # Робот движется к границе 
    while(!isborder(r, side))
        move!(r, side)
    end
end
function mark_corners(r) # ставит маркеры по углам поля
    for side in (Nord, Ost, Sud, West)
        putmarker!(r)
        gotoborder(r, side)
    end
end
function main1(r) # главная функция
    gotobegin(r)
    mark_corners(r)
end
