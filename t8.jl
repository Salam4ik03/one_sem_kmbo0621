#ДАНО: Робот - рядом с горизонтальной перегородкой (под ней), бесконечно продолжающейся в обе стороны, в которой имеется проход шириной в одну клетку.
#РЕЗУЛЬТАТ: Робот - в клетке под проходом
function main(r)
    counter = 1
    flag = false
    while(isborder(r, Nord) & !flag)
        c = counter
        while ((c>0) & !flag)
            move!(r, West)
            if(!isborder(r, Nord))
                flag = true
            end
            c = c - 1
        end
        c = counter
        while((c>0) & !flag)
            move!(r, Ost)
            c = c - 1
        end
        c = counter
        while ((c>0) & !flag)
            move!(r, Ost)
            if(!isborder(r, Nord))
                flag = true
            end
            c = c - 1
        end
        while((c>0) & !flag)
            move!(r, West)
            c = c - 1
        end
        c = counter
        counter = counter + 1
    end
end
