-- Once at program start
function _init()
    frames = 0
    
    -- Change to somewhere on the bottom of the screen. This is where the player starts.
    player = {x=0, y=0, width=8,height=8}
    -- This is the number added to the player's coordinates when they move. Dictates how quickly they move.
    speed = 2
    -- Width and height of the sprites; Used for collisions

    -- INCREMENTALS --
    -- These values are added to during every update() call. Used to track time/frames
    anim_timer = 0
    movement_timer = 0
    
    -- Sets the peach color to be the transparent color and sets the black color to be visible
    palt (15, true)
    palt (0, false)

    -- Creates two new enemies for testing purposes
    newEnemy(23, 45, 4, {4, 6}, 3, 0)
    newEnemy(56, 2, 5, {5, 7}, 3, 0)

    -- List of enemy pseudobjects
    enemies = getEnemies()

end

-- Once every frame
function _update()
    frames += 1
    playerBullets = getPlayerBullets()
    enemyBullets = getEnemyBullets()
    -- Increments the incrementals
    movement_timer += 1
    anim_timer += 1

    -- Moves player
    playerControls()
    -- Keeps player within screen
    playerBounds()

    -- Every five frames, animate and move the enemies
    if movement_timer == 5 then
        animateEnemies()
        moveEnemies()
        movePlayerBullets()
        animatePlayerBullets()
        moveEnemyBullets()
        animateEnemyBullets()
        movement_timer = 0
    end

    if frames == 100 then
        for i = 1, #enemies, 1 do
            newEnemyBullet(enemies[i].x, enemies[i].y, 2, {2, 3}, 5)
        end
        frames = 0
    end

    if btn(4) then
     newPlayerBullet(player.x, player.y, 2, {2, 3}, 5)
    end

    checkEnemyCollision()
    checkPlayerBulletCollision()
    checkEnemyBulletCollision()
    -- if stageEnd then
    --     startShimprovement()
end

-- Drawn once every frame
function _draw()
    cls()

    -- Draw all enemy pseudobjects in the list of enemies
    for i = 1, #enemies, 1 do
        spr(enemies[i].sprite, enemies[i].x, enemies[i].y)
    end

    -- Draw bullets. Change to only function when bullet should be on screen. NOTE Also make bullet pseudobject. Very similar to enemies pseudobject
    for i = 1, #playerBullets, 1 do
        spr(playerBullets[i].sprite, playerBullets[i].x, playerBullets[i].y)
    end

    for i = 1, #enemyBullets, 1 do
        spr(enemyBullets[i].sprite, enemyBullets[i].x, enemyBullets[i].y)
    end

    -- Draw player sprite at the player coordinates
    spr(1, player.x, player.y)
end