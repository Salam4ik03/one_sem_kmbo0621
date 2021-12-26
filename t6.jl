# ДАНО: На ограниченном внешней прямоугольной рамкой поле имеется ровно одна внутренняя перегородка в форме прямоугольника.
# Робот - в произвольной клетке поля между внешней и внутренней перегородками.
# РЕЗУЛЬТАТ: Робот - в исходном положении и по всему периметру внутренней перегородки поставлены маркеры.

function gotobegin!(r) # возвращает робота в левый нижний угол
    gotoborder!(r, West)
    gotoborder!(r, Sud)
    if(!(isborder(r, West) & isborder(r, Sud)))
        gotobegin!(r)
    end
end
function gotoborder!(r, side) # двигает робота к границе
    while(!isborder(r, side))
        move!(r, side)
    end
end
function seek(r) # ищет границы заданной перегородки
    while(!isborder(r, Nord))
        if(!isborder(r, Ost))
            move!(r, Ost)
        else
            gotoborder!(r, West)
            move!(r, Nord)
        end
    end
end
function mark(r) # маркирает периметр заданой перегородки
    while(isborder(r, Nord))
        putmarker!(r)
        move!(r, Ost)
    end
    putmarker!(r)
    move!(r, Nord)

    while(isborder(r, West))
        putmarker!(r)
        move!(r, Nord)
    end
    putmarker!(r)
    move!(r, West)

    while(isborder(r, Sud))
        putmarker!(r)
        move!(r, West)
    end
    putmarker!(r)
    move!(r, Sud)

    while(isborder(r, Ost))
        putmarker!(r)
        move!(r, Sud)
    end
    putmarker!(r)
    move!(r, Sud)


end
function main(r) # главная функция
    gotobegin!(r)
    seek(r)
    mark(r)
end
