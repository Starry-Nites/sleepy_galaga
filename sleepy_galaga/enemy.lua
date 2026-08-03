enemies = {}

-- VERY BASIC ENEMIES FOR NOW!!
function newEnemy(xCoord, yCoord, spr, spe, pa)
    enemy = {x = xCoord,
    y = yCoord, 
    sprite = spr, 
    speed = spe,
    pass = pa, 
    width = 8}
    
    enemies[#enemies+1] = enemy

    return enemy
end

function moveEand nemies()
    track = 1
    for i = 1, #enemies, 1 do
        enemies[i].x += enemies[i].speed
        if enemies[i].x >= 121 and enemies[i].pass == 0 then
            enemies[i].speed *= -1
            enemies[i].pass += 1
        elseif enemies[i].x <= 0 and enemies[i].pass > 0 then
            enemies[i].y += 5
            track += .3
            enemies[i].speed *= track
            enemies[i].speed *= -1
            enemies[i].pass = 0
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