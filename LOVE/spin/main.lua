local isDown = love.keyboard.isDown
local bool = { [true] = 1, [false] = 0 }
local spin_x = 0
local spin_y = 0
local spin_z = 0
local sin = math.sin
local cos = math.cos
local rad = math.rad
local vertices = {100,100, 100,200, 200,200, 200,100}
local vertices2 = {vertices[1]-20, vertices[2], vertices[3]-20, vertices[4], vertices[5]-20, vertices[6], vertices[7]-20, vertices[8]}

function love.update()
	spin_x = spin_x + (bool[isDown"w"] - bool[isDown"s"])
	spin_y = spin_y + (bool[isDown"d"] - bool[isDown"a"])
	spin_z = spin_z + (bool[isDown"e"] - bool[isDown"q"])
	
	if spin_x < 0 then spin_x = 360 end
	if spin_x > 360 then spin_x = 0 end
	if spin_y < 0 then spin_y = 360 end
	if spin_y > 360 then spin_y = 0 end
	if spin_z < 0 then spin_z = 360 end
	if spin_z > 360 then spin_z = 0 end
	
	vertices = {
	200+50*cos(rad(spin_y)),200+50*cos(rad(spin_x)),
	200+50*cos(rad(spin_y)),200-50*cos(rad(spin_x)),
	200-50*cos(rad(spin_y)),200-50*cos(rad(spin_x)), 
	200-50*cos(rad(spin_y)),200+50*cos(rad(spin_x))
	}
	
	vertices2 = {vertices[1]-40, vertices[2]-40, vertices[3]-40, vertices[4]-40, vertices[5]-40, vertices[6]-40, vertices[7]-40, vertices[8]-40}
end

function love.draw()
	love.graphics.polygon("fill", vertices)
	love.graphics.polygon("fill", vertices2)
	love.graphics.print("Current angle_x: "..tostring(spin_x).."angle_y: "..tostring(spin_y).."angle_z: "..tostring(spin_z), 10, 10)
end
