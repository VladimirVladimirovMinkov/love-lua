local bool = { [true] = 0.1, [false] = -0.1 }
local width = love.graphics.getWidth( )
local height = love.graphics.getHeight( )
local num_points = 64
local points = {}
local num_connections = 3
local connections = {}
local pixels = {}

function love.load()
	for i=0, num_points+1 do
		points[i] = {tonumber(math.random()*width), tonumber(math.random()*height)}
	end
	for i=1, num_connections do
		for j=1, num_points do
			local x = math.random(1, num_points)
			local y = math.random(1, num_points)
			if (x==y) then
				x = math.random(1, num_points)
			end
			connections[#connections+1] = {points[j][1], points[j][2], points[x][1], points[x][2]}
		end
	end
end

function love.update()
	for i=0, #connections do
		
	end
end

function love.draw()
	for i=1, #connections do
		love.graphics.line(connections[i])
	end
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	love.graphics.print("Width: "..tostring(width), 10, 25)
	love.graphics.print("Height: "..tostring(height), 10, 40)
end