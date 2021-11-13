local rx, ry = 100, 100
local x, y = 200, 200
local pixels = {}
local pi = 3.1415

function love.load()
	rx, ry = rx*2, ry*2
	for i=0, ry*2 do
		pixels[i] = {x+(math.cos(i*pi/rx)*rx/pi), y+(math.sin(i*pi/ry)*ry/pi)}
	end
end

function love.update()

end

function love.draw()
	love.graphics.points(pixels)
end