-- Once at program start
function _init()
    frames = 0
    cooldown = 0
    
    pipeManiaActive = false -- change to false later

    -- Change to somewhere on the bottom of the screen. This is where the player starts.
    player = {x=0, y=120, width=8,height=8}
    -- This is the number added to the player's coordinates when they move. Dictates how quickly they move.
    speed = 2
    -- Width and height of the sprites; Used for collisions

    -- INCREMENTALS --
    -- These values are added to during every update() call. Used to track time/frames
    anim_timer = 0
    movement_timer = 0
    waitTimer = 0

    -- Bullet sprite to begin with
    bullet = 2
    -- All sprite numbers for the bullet animation
    bullet_frames = {2, 3}
    
    -- Sets the peach color to be the transparent color and sets the black color to be visible
    palt (15, true)
    palt (0, false)


    -- Creates two new enemies for testing purposes
    for i = 1, 5 do
        randx1 = flr(rnd(65))
        randx2 = flr(rnd(65))
        randy1 = flr(rnd(70))
        randy2 = flr(rnd(70))
        newEnemy(randx1, randy1, 4, {4, 6}, 1.5, 0)
        newEnemy(randx2, randy2, 5, {5, 7}, 1.5, 0)
        newEnemy((128 - randx1), randy1, 4, {4, 6}, 1.5, 0)
        newEnemy((128 - randx2), randy2, 5, {5, 7}, 1.5, 0)
    end

    -- List of enemy pseudobjects
    enemies = getEnemies()

    pipe = newPipe(0, 0, 16, 0)
    Cpoints = findConnectionPoints(pipe)

end

-- Once every frame
function _update()

    -- Increments the incrementals

    if pipeManiaActive then
        waitTimer += 1
        pipes = getPipes()
        pipeControls(pipe)
        Cpoints = findConnectionPoints(pipe, pipe.rotation)
        if drop() and waitTimer >= 3 then
            pipe = newPipe(0, 0, choosePipe(), 0)
            waitTimer = 0
        end
        for i = 1, #pipes, 1 do
            if isConnected(pipes[i], pipes[i+1]) then
                sfx(1)
                print("Hello")
            end
        end

    else
        frames += 1
        cooldown += 1
        movement_timer += 1
        anim_timer += 1
        playerBullets = getPlayerBullets()
        enemyBullets = getEnemyBullets()
    
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
            randindex = flr(rnd(21))
            randindex2 = flr(rnd(21))
            randindex3 = flr(rnd(21))
            newEnemyBullet(enemies[randindex].x, enemies[randindex].y, 2, {2, 3}, 5)
            newEnemyBullet(enemies[randindex2].x, enemies[randindex2].y, 2, {2, 3}, 5)
            frames = 0
        end

        if cooldown >= 20 and btn(4) then
            newPlayerBullet(player.x, player.y, 2, {2, 3}, 5)
            cooldown = 0
        end

        checkCollision()
        checkPlayerBulletCollision()
        checkEnemyBulletCollision()
    end
end

-- Drawn once every frame
function _draw()
    cls()
    if pipeManiaActive then
        for i = 1, #pipes, 1 do
            spr(pipes[i].sprite, pipes[i].x, pipes[i].y)
        end
        --print(connectionPoints)

    -- Draw all enemy pseudobjects in the list of enemies
    else
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
end