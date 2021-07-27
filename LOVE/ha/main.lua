local mouse = {x = 0, y = 0}
local pos = {x = 0, y = 0}

function drawlin(pos1, pos2)
	pos[x] = pos1.x-pos2.x
	pos[y] = pos1.y-pos2.y
end

function love.load()
	screen_width, screen_height = love.graphics.getDimensions()
	max_lins = 10
	started = true
end

function love.update()
	lins = {0, 0, 0, 0}
	if love.mouse.isDown == true then
		if started == true then
			new_x, new_y = love.mouse.getX, love.mouse.getY
			lins.insert(new_x)
			lins.insert(new_y)
		end
	end
end

function love.draw()
	love.graphics.line(lins)
end