function _init()
    player_coords = {x=0, y=0}
    speed = 2

    anim_timer = 0
    movement_timer = 0

    bullet = 2
    bullet_frames = {2, 3}
    
    palt (15, true)
    palt (0, false)

    newEnemy(23, 45, 4, {4, 6}, 1)
    newEnemy(56, 2, 5, {5, 7}, 1)

    enemies = getEnemies()

end

function _update()
    movement_timer += 1
    anim_timer += 1

    playerControls()

    if anim_timer == 2 then
        bullet = animate(bullet, bullet_frames)
        anim_timer = 0
    end
    if movement_timer == 5 then
        animate_enemies()
        move_enemies()
        movement_timer = 0
    end
end

function _draw()
    cls()
    
    for i = 1, #enemies, 1 do
        spr(enemies[i].sprite, enemies[i].x, enemies[i].y)
    end

    spr(bullet, bx, by)

    spr(1, player_coords.x, player_coords.y)
end