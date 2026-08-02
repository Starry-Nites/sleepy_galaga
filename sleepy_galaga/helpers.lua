-- x/y: int; xy values to draw sprites at
-- Frames: list; sprites to animate. Assume frames.length >= 2.
function animate(sprite, frames, x, y)
    if sprite == frames[#frames] then
        return frames[1]
    end
    return sprite + 1
end
    
