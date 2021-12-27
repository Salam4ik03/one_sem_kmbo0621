# ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
# РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы

function mark_all!(r::Robot) # Маркерует поле сверху вниз, двигаясь направо
    marktoborder!(r, Nord)
    if(!isborder(r, Ost))
        move!(r, Ost)
        marktoborder!(r, Sud)
        if(!isborder(r, Ost))
            move!(r, Ost)
            mark_all!(r)
        end
    end
end
function gotobegin!(r) # возвращает робота в левый нижний угол
    gotoborder!(r, West)
    gotoborder!(r, Sud)
end
function gotoborder!(r, side) # двигает робота к границе
    while(!isborder(r, side))
        move!(r, side)
    end
end
function marktoborder!(r, side) # проверяет есть ли граница, идет и маркерует до нее
    while(!isborder(r, side))
        putmarker!(r)
        move!(r, side)
    end
    putmarker!(r)
end
function main(r::Robot) # главная функция, запускает все остальные
    gotobegin!(r)
    mark_all!(r)
    gotobegin!(r)
end
