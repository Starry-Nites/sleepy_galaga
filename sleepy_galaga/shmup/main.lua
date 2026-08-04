-- Once at program start
function _init()
    
    -- Change to somewhere on the bottom of the screen. This is where the player starts.
    player_coords = {x=0, y=0}
    -- This is the number added to the player's coordinates when they move. Dictates how quickly they move.
    speed = 2

    -- INCREMENTALS --
    -- These values are added to during every update() call. Used to track time/frames
    anim_timer = 0
    movement_timer = 0

    -- Bullet sprite to begin with
    bullet = 2
    -- All sprite numbers for the bullet animation
    bullet_frames = {2, 3}
    
    -- Sets the peach color to be the transparent color and sets the black color to be visible
    palt (15, true)
    palt (0, false)

    -- Creates two new enemies for testing purposes
    newEnemy(23, 45, 4, {4, 6}, 1)
    newEnemy(56, 2, 5, {5, 7}, 1)

    -- List of enemy pseudobjects
    enemies = getEnemies()

end

-- Once every frame
function _update()
    -- Increments the incrementals
    movement_timer += 1
    anim_timer += 1

    -- Moves player
    playerControls()

    -- Every two frames, change bullet sprite. Change to only occur when the bullet is on screen
    if anim_timer == 2 then
        bullet = animate(bullet, bullet_frames)
        anim_timer = 0
    end
    -- Every five frames, animate and move the enemies
    if movement_timer == 5 then
        animate_enemies()
        move_enemies()
        movement_timer = 0
    end

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
    spr(bullet, bx, by)

    -- Draw player sprite at the player coordinates
    spr(1, player_coords.x, player_coords.y)
end