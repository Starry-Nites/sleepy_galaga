function playerControls()
    if btn(0) then player.x -= speed end

    if btn(1) then player.x += speed end

    if btn(2) then player.y -= speed end
    
    if btn(3) then player.y += speed end
end

function playerBounds()
    if player.x >= 121 then
        player.x = 121
    elseif player.x <= 0 then
        player.x = 0
    end
end

function shoot(player)
end

