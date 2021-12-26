# ДАНО: Где-то на неограниченном со всех сторон поле и без внутренних перегородок имеется единственный маркер. Робот - в произвольной клетке поля.
# РЕЗУЛЬТАТ: Робот - в клетке с тем маркером.
global flag = false
function go(r, side, counter)
    if(ismarker(r))
        global flag = true
    else
        move!(r, side)
    end
    while((counter > 0)&!flag)
        if(ismarker(r))
            global flag = true
        else
            move!(r, side)
            counter = counter - 1
        end
    end
end

function main(r)
    counter = 1
    iter = 0
    side = nothing
    while(!flag)
        if(iter % 4 == 0)
            side = Ost
        end
        if(iter % 4 == 1)
            side = Nord
        end
        if(iter % 4 == 2)
            side = West
        end
        if(iter % 4 == 3)
            side = Sud
        end
        iter = iter + 1
        go(r, side, counter)
        if(iter % 4 == 0)
            side = Ost
        end
        if(iter % 4 == 1)
            side = Nord
        end
        if(iter % 4 == 2)
            side = West
        end
        if(iter % 4 == 3)
            side = Sud
        end
        iter = iter + 1
        go(r, side, counter)
        counter = counter + 1
    end

end
