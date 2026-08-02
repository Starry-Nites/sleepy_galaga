function _init()
    player_coords = {x=0, y=0}
    speed = 2

    anim_timer = 0

    bullet = 2
    bullet_frames = {2, 3}
    
    palt (15, true)
    palt (0, false)
end

function _update()
    anim_timer += 1

    player_controls()

    if anim_timer % 2 == 0 then
        bullet = animate(bullet, bullet_frames)
    end

    if anim_timer >= 400 then
        anim_timer = 0
    end
end

function _draw()
    cls()
    
    spr(bullet, bx, by)

    spr(1, player_coords.x, player_coords.y)
end