local poi = {}
local width = love.graphics.getWidth( )
local height = love.graphics.getHeight( )
local a = 0.5

function love.load()
	for x=0, width do
	poi[x] = {}
		for y=0, height do
			poi[x][y] = y
		end
	end
end

function love.update()
end

function love.draw()
	for x=0, width do
		for y=0, height do
			love.graphics.points(x, poi[x][y])
		end
	end
end