function _init()
    player_coords = {x=0, y=0}
    player_width = 0
    speed = 2

    anim_timer = 0

    bullet = 2
    bullet_frames = {2, 3}
    
    palt (15, true)
    palt (0, false)

    newEnemy(23, 45, 1, 0.5, 0)
    newEnemy(56, 2, 5, 0.5, 0)

    enemies = getEnemies()

end

function _update()
    anim_timer += 1

    playerControls()
    playerBounds()

    if anim_timer % 2 == 0 then
        bullet = animate(bullet, bullet_frames)
    end

    if anim_timer >= 400 then
        anim_timer = 0
    end

    moveEnemies()
end

function _draw()
    cls()
    
    for i = 1, #enemies, 1 do
        spr(enemies[i].sprite, enemies[i].x, enemies[i].y)
    end

    spr(bullet, bx, by)

    spr(1, player_coords.x, player_coords.y)
end