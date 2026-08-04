pipes = {}
const placeable = {16, 17}
const caps = {18, 19}

-- The MOVEABLE pipe pseudobject
function newPipe(xCoord, yCoord, spr)
    pipe = {
    x = xCoord,
    y = yCoord,
    sprite = spr
    }

    -- Add this enemy to the list of enemies
    pipes[#pipes+1] = pipe

    return pipe
end

function getConnectionPoints(p)
    if 
end

function getPipes()
    return pipes
end