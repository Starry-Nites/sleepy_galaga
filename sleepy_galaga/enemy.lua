enemies = {}

-- VERY BASIC ENEMIES FOR NOW!!
function newEnemy(xCoord, yCoord, spr, spe, pa)
    enemy = {x = xCoord,
    y = yCoord, 
    sprite = spr, 
    speed = spe,
    pass = pa, 
    width = 8, 
    height = 8}
    
    enemies[#enemies+1] = enemy

    return enemy
end

function moveEnemies()
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

function overlap(a,b)
	local test1 = a.x > (b.x +b.width)
	local test2 = a.y > (b.y +b.height)
	local test3 = (a.x+a.width) <b.x
	local test4 = (a.y+a.height) <b.y
	return not (test1 or test2 or test3 or test4)
end

function check_collision()
    for i = 1, #enemies, 1 do
        if overlap(player, enemies[i]) then
            stop()
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