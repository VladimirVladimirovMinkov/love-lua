local poi = {}
local width = love.graphics.getWidth( )
local height = love.graphics.getHeight( )
local test = math.random
local points = love.graphics.points
local prin = love.graphics.print
local sin = math.sin
local cos = math.cos

function love.load()
	for x=-2, width+2 do
	poi[x] = {}
		for y=-2, height+2 do
			poi[x][y] = {
			x, y, sin(x/2)-cos(x/4)-sin(x/8)+cos(x/16)+0.25-(sin(y/2)-cos(y/4)-sin(y/8)+cos(y/16)), 
			-cos(x/2)-sin(x/4)+cos(x/8)+sin(x/16)+0.25-(-cos(y/2)-sin(y/4)+cos(y/8)+sin(y/16)), 
			-sin(x/2)+cos(x/4)+sin(x/8)-cos(x/16)+0.25-(-sin(y/2)+cos(y/4)+sin(y/8)-cos(y/16)), 
			0.75}
		end
	end
end

function love.update()
	
end

function love.draw()
	for x=0, width do
		points(poi[x])
	end
	prin("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	prin("Width: "..tostring(width), 10, 25)
	prin("Height: "..tostring(height), 10, 40)
end