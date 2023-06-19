local prin = love.graphics.print
local ttime=0
local ant={}
local ants={}
local nants = 40

function ant:init()
	local object = {
		x=0,
		y=0
	}
	setmetatable(object, { __index = Ant })
    return object
end

function ant:move(x, y)
	x = x - self:x
	y = y - self:y
end

function love.load()
	for i=1,nants do
		ants[i] = ant.init()
		ants[i].x = 10*i-200
	end
	ants[1].y=2
end

function love.update(dt)
	ttime=ttime+dt
	ants[1].x = 200*math.sin(ttime)
	ants[2].move()
end

function love.draw()
	love.graphics.translate(400, 300)
	for i=1,nants do
		love.graphics.rectangle("fill", ants[i].x, ants[i].y, 5, 5)
	end
end