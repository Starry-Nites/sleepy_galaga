enemyBullets = {}
playerBullets = {}

-- VERY BASIC bullets FOR NOW!!
-- Functions as a constructor. Takes a starting x, a starting y, 
-- the starting sprite, all frames in the animation, and the speed.
function newPlayerBullet(xCoord, yCoord, spr, frms, spe)
    playerBullet = {x = xCoord,
    y = yCoord,
    sprite = spr,  
    frames = frms, 
    speed = spe, 
    width = 5, 
    height = 8}

    -- Add this bullet to the list of bullets
    playerBullets[#playerBullets+1] = playerBullet

    return playerBullet
end

-- Make the bullets move across the screen
function movePlayerBullets() 
    for i = 1, #playerBullets, 1 do
        playerBullets[i].y -= playerBullets[i].speed
    end
end

-- Increment the sprites to make an animation
function animatePlayerBullets()
    for i = 1, #playerBullets, 1 do
        playerBullets[i].sprite = animate(playerBullets[i].sprite, playerBullets[i].frames)
    end
end

-- Sends the bullets list 
function getPlayerBullets()
    return playerBullets
end

function checkPlayerBulletCollision()
    for i = 1, #enemies, 1 do
        for j = 1, #playerBullets, 1 do
            if overlap(playerBullets[j], enemies[i]) then
                --deli(playerBullets, j)
                --deli(enemies, i)
                stop()
            end
        end
    end
end

function newEnemyBullet(xCoord, yCoord, spr, frms, spe)
    enemyBullet = {x = xCoord,
    y = yCoord,
    sprite = spr,  
    frames = frms, 
    speed = spe, 
    width = 5, 
    height = 8}

    -- Add this bullet to the list of bullets
    enemyBullets[#enemyBullets+1] = enemyBullet

    return enemyBullet
end

-- Make the bullets move across the screen
function moveEnemyBullets() 
    for i = 1, #enemyBullets, 1 do
        enemyBullets[i].y += enemyBullets[i].speed
    end
end

-- Increment the sprites to make an animation
function animateEnemyBullets()
    for i = 1, #enemyBullets, 1 do
        enemyBullets[i].sprite = animate(enemyBullets[i].sprite, enemyBullets[i].frames)
    end
end

-- Sends the bullets list 
function getEnemyBullets()
    return enemyBullets
end

function checkEnemyBulletCollision()
    for i = 1, #enemyBullets, 1 do
        if overlap(player, enemyBullets[i]) then
            --deli(enemyBullets, i)
            stop()
        end
    end
end