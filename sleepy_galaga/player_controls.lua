function playerControls()
    if btn(0) then player_coords.x -= speed end

    if btn(1) then player_coords.x += speed end

    if btn(2) then player_coords.y -= speed end
    
    if btn(3) then player_coords.y += speed end
end

function shoot(player)
end

