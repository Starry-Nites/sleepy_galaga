local pipes = {}
local pipeSprites = {16, 17, 18, 19}

-- The MOVEABLE pipe pseudobject
function newPipe(xCoord, yCoord, spr, rot)
    local pipe = {
    x = xCoord,
    y = yCoord,
    sprite = spr,
    rotation = rot
    }

    -- Add this pipe to the list of pipes
    pipes[#pipes+1] = pipe

    return pipe
end

function findConnectionPoints(p,rotation)
    if p.sprite == 16 then
        if rotation == 0 
        then return {{pipe.x+0, pipe.y+4},{pipe.x+7, pipe.y+4}}
        elseif rotation == 90
        then return {{pipe.x+4, pipe.y+7},{pipe.x+4, pipe.y+0}}
        elseif rotation == 180
        then return {{pipe.x+0, pipe.y+3},{pipe.x+7, pipe.y+3}} end
        return {{pipe.x+3, pipe.y+7},{pipe.x+3, pipe.y+0}}
    end
end

function isConnected(p1, p2)
    -- If the sprite is in the list of caps
    if (p1.x+9 == p1.x) and (p1.y == p2.y) then
        if (pget(p1.x+8, p1.y-3) == pget(p2.x, p2.y-3)) then
            return true
        end
    end
    return false
end

function choosePipe()
    return rnd(pipeSprites)
end 

function getPipes()
    return pipes
end