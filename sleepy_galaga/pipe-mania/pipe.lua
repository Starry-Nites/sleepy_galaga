pipes = {}

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