local prin = love.graphics.print
local ttime=0
local ant={}

function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
function lim(x,y)
	if math.abs(x-y)>25 then
		x = x-(x-y)/3
	elseif math.abs(x-y)<15 then
		x = x+2
	end
	return x
end

function ant:init()
	local object = {
		x=0,
		y=0
	}
	setmetatable(object, { __index = Enemy })
    return object
end

function ant:gx()
	return self.x
end

local a1 = ant:init()
local a2 = ant:init()
local a3 = ant:init()

function love.load()
	a1.x, a1.y=0,0
	a2.x, a2.y=0,0
	a3.x, a3.y=0,0
end

function love.update(dt)
	ttime=ttime+dt
	a2.x=lim(a2.x,a1.x)
	a1.x=lim(a1.x,a2.x)
	a2.x=lim(a2.x,0)
	a2.x=lim(a1.x,0)
	
	a2.y=lim(a2.y,a1.y)
	a1.y=lim(a1.y,a2.y)
	a2.y=lim(a2.y,0)
	a2.y=lim(a1.y,0)
end

function love.draw()
	love.graphics.translate(400, 300)
	love.graphics.rectangle("fill", a1.x, a1.y, 5, 5)
	love.graphics.rectangle("fill", a2.x, a2.y, 5, 5)
	love.graphics.rectangle("fill", a3.x, a3.y, 5, 5)
	prin("Ant1 x"..tostring(a1.x), 10, 10)
	prin("Ant1 y"..tostring(a1.y), 20, 20)
	prin("Ant2 x"..tostring(a2.x), 30, 30)
	prin("Ant2 y"..tostring(a2.y), 40, 40)
end