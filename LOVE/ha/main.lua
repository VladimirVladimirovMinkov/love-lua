local poi = {}
local width = love.graphics.getWidth( )
local height = love.graphics.getHeight( )

function love.load()
	local test = math.random
	for x=-2, width+2 do
	poi[x] = {}
		for y=-2, height+2 do
			poi[x][y] = {x, y, test(), test(), test(), 0.75}
		end
	end
end

function love.update()
	local test = math.random
	for x=0, width do
		for y=0, height do
			poi[x][y] = {x, y, 
			(poi[x-1][y][3]*2+poi[x+1][y][3]*2+poi[x][y+1][3]*2+poi[x][y-1][3]*2+test())/9,
			(poi[x-1][y][4]*2+poi[x+1][y][4]*2+poi[x][y+1][4]*2+poi[x][y-1][4]*2+test())/9,
			(poi[x-1][y][5]*2+poi[x+1][y][5]*2+poi[x][y+1][5]*2+poi[x][y-1][5]*2+test())/9,
			0.85}
		end
	end
end

function love.draw()
	local points = love.graphics.points
	for x=0, width do
		points(poi[x])
	end
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	love.graphics.print("Width: "..tostring(width), 10, 25)
	love.graphics.print("Height: "..tostring(height), 10, 40)
end