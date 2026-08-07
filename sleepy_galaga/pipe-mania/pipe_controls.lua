function pipeControls(pipe)
    if btn(0) then pipe.x -= 1 end

    if btn(1) then pipe.x += 1 end

    if btn(2) then pipe.y -= 1 end
    
    if btn(3) then pipe.y += 1 end
end

function drop()
    if btn(4) then
        return true
    end
    return false
end