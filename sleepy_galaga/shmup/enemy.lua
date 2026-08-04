enemies = {}

-- VERY BASIC ENEMIES FOR NOW!!
-- Functions as a constructor. Takes a starting x, a starting y, 
-- the starting sprite, all frames in the animation, and the speed.
function newEnemy(xCoord, yCoord, spr, frms, spe)
    enemy = {x = xCoord,
    y = yCoord,
    sprite = spr,  
    frames = frms, 
    speed = spe}

    -- Add this enemy to the list of enemies
    enemies[#enemies+1] = enemy

    return enemy
end

-- Make the enemies move across the screen
function move_enemies() 
    for i = 1, #enemies, 1 do
        enemies[i].x += enemies[i].speed
        if enemies[i].x == 120 then
            enemies[i].speed *= -1
        elseif enemies[i].x == 0 then
            enemies[i].speed *= -1
        end
    end
end

-- Increment the sprites to make an animation
function animate_enemies()
    for i = 1, #enemies, 1 do
        enemies[i].sprite = animate(enemies[i].sprite, enemies[i].frames)
    end
end

-- Sends the enemies list 
function getEnemies()
    return enemies
end