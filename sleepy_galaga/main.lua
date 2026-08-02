function _init()
    player_coords = {x=0, y=0}
    speed = 2

    anim_timer = 0

    bx = 0
    by = 0
    bullet = 2
    bullet_frames = {2, 3}
    
    palt (15, true)
    palt (0, false)
end

function _update()
    anim_timer += 1

    if btn(0) then player_coords.x -= speed end

    if btn(1) then player_coords.x += speed end

    if btn(2) then player_coords.y -= speed end
    
    if btn(3) then player_coords.y += speed end 

    if anim_timer % 5 == 0 then
        bullet = animate(bullet, bullet_frames, bx, by)
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