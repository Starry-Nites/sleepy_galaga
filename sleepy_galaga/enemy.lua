enemies = {}

-- VERY BASIC ENEMIES FOR NOW!!
function newEnemy(xCoord, yCoord, spr, spe)
    enemy = {x = xCoord,
    y = yCoord, 
    sprite = spr, 
    speed = spe}
    
    enemies[#enemies+1] = enemy

    return enemy
end

function move_enemies()
    for i = 1, #enemies, 1 do
        enemies[i].x += enemies[i].speed
        if enemies[i].x >= 128 then
            enemies[i].speed *= -1
        end
    end
end

-- Unnecessary. Just add directly to the values of the specific enemy.
function setCoords(enemy, x, y)
    xCoord = nil or x
    yCoord = nil or y

    if not (xCoord ~= nil) then 
        enemy.x = xCoord
    end
    if not (yCoord ~= nil) then
        enemy.y = yCoord
    end

end

function getEnemies()
    return enemies
end