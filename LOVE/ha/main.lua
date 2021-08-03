local poi = {}
local width = love.graphics.getWidth( )
local height = love.graphics.getHeight( )
local a = 0.5

function lin(x1, y1, x2, y2, r, g, b, a)
	local x = x1 - x2
	local y = y1 - y2
	local m = y/x
	if m < 0 then
		m= m*-1
	end
	
	if x > y then
		for i=1, x do
			poi[#poi + 1] = {math.min(x1, x2)+(i), math.min(y1, y2)+(i*m), r, g, b, a}
		end
	else
		m = 1/m
		for i=1, y do
			poi[#poi + 1] = {math.min(x1, x2)+(i*m), math.min(y1, y2)+(i), r, g, b, a}
		end
	end
end

function love.load()
	for x=0, width do
	poi[x] = {}
		for y=0, height do
			poi[x][y] = {x, y}
		end
	end
end

function love.update()
end

function love.draw()
	for x=0, width do
		for y=0, height do
			love.graphics.points(poi[x][y])
		end
	end
end