-- sprite: int; number that corresponds to a sprite on the spritesheet 
-- Frames: list; sprites to animate. Assume frames.length >= 2.

-- Call every time a frameshift must occur. Animate simply changes the sprite number to be
-- the next in the animation. If called over time, it will animate.
function animate(sprite, frames)
    -- If the current sprite is the last frame,
    if sprite == frames[#frames] then
        return frames[1] -- loop back to the first frame in the animation
    end
    return frames[indexOf(frames, sprite) + 1] -- returns the next item in the list of frames.
end
 -- Finds the distance in pico pixels between two points on the canvas.
function distance(x1, y1, x2, y2)
    return ((x2 - x1) / (y1 - y2)) ^ -2
end

-- NOT MY CODE!! 
-- https://stackoverflow.com/a/69651531/21190158

-- Gives the index of whatever value of a 2D array
function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end
