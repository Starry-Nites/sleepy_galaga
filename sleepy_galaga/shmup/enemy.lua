enemies = {}

-- VERY BASIC ENEMIES FOR NOW!!
-- Functions as a constructor. Takes a starting x, a starting y, 
-- the starting sprite, all frames in the animation, and the speed.
function newEnemy(xCoord, yCoord, spr, frms, spe, pa)
    enemy = {
    x = xCoord,
    y = yCoord,
    sprite = spr,  
    frames = frms, 
    speed = spe,
    pass = pa, 
    width = 8, 
    height = 8
    }

    -- Add this enemy to the list of enemies
    enemies[#enemies+1] = enemy

    return enemy
end

-- Make the enemies move across the screen
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

function checkCollision()
    for i = 1, #enemies, 1 do
        if overlap(player, enemies[i]) then
            stop()
        end
    end
end

-- Increment the sprites to make an animation
function animateEnemies()
    for i = 1, #enemies, 1 do
        enemies[i].sprite = animate(enemies[i].sprite, enemies[i].frames)
    end
end

-- Sends the enemies list 
function getEnemies()
    return enemies
end