pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
	pipes = {}
	bird = {}
	bird.x = 15
	bird.y = 45
	bird.jforce=4
	bird.grav=0.2
	bird.sprite=1
	bird.dx=1
	bird.dy=0
	bird.max_y=2.6
	bird.height = 6
	bird.width = 7
	local p = make_pipes(50,80,30)
	local p2 = make_pipes(50+32+20,80,30)
	add(pipes, p)
	add(pipes, p2)
	status = 'playing'
end


function _draw()
	camera(bird.x)
	cls(12)
	
	sky=rectfill(0,0,128,128,12)
	
	if (status == 'playing') then
		for pipe in all(pipes) do
			rectfill(pipe.top.x, pipe.top.y, pipe.top.x + pipe.top.width, pipe.top.y + pipe.top.height,3)
 		rectfill(pipe.bottom.x, pipe.bottom.y, pipe.bottom.x + pipe.bottom.width, pipe.bottom.y + pipe.bottom.height,3)
 	end
 	spr(1,bird.x,bird.y)
 
 end
 
 if status == "over" then
  cls()
 	print('game over', 64, 64)
 end
 
end

function move_player()
	
	bird.dy += bird.grav
	
	if bird.dy> bird.max_y then
		bird.dy = bird.max_y
	end

	if	btnp(❎) then
		bird.dy -= bird.jforce
	end
	
	bird.x += bird.dx
	bird.y += bird.dy
	
end

function _update()
	move_player()
	
	for pipe in all(pipes) do
		if overlap(bird, pipe.top)
			or overlap(bird, pipe.bottom) then
				status = 'over'
		end
	end
	
end
-->8

-->8
function make_pipes(x, gap_y, gap_height)

local pipe = {}
pipe.x = x
pipe.y = 0
pipe.height = gap_y
pipe.width = 32

local pipe2 = {}
pipe2.x = pipe.x
pipe2.y = pipe.y + pipe.height + gap_height
pipe2.height = 128 - pipe.height - gap_height
pipe2.width = 32

return {top = pipe, bottom = pipe2}
end
-->8
function overlap(a,b)
	local test1 = a.x > (b.x +b.width)
	local test2 = a.y > (b.y +b.height)
	local test3 = (a.x+a.width) <b.x
	local test4 = (a.y+a.height) <b.y
	return not (test1 or test2 or test3 or test4)
end	
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000aaaa7a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000aaaa9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000009009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000090000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
