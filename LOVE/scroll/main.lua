local isDown = love.keyboard.isDown
local bool = { [true] = 1, [false] = 0 }
local pad1_y = 0
local pad2_y = 0
local pad3_y = 0

function love.update()
	pad1_y = pad1_y + (bool[isDown"s"] - bool[isDown"w"]) * 2
	pad2_y = pad2_y + (bool[isDown"s"] - bool[isDown"w"]) * 1
	pad3_y = pad3_y + (bool[isDown"s"] - bool[isDown"w"]) * -0.5
	
	if pad1_y < -250 then pad1_y = -250 end
	if pad1_y > 250 then pad1_y = 250 end
	if pad2_y < -250 then pad2_y = -250 end
	if pad2_y > 250 then pad2_y = 250 end
	if pad3_y < -250 then pad3_y = -250 end
	if pad3_y > 250 then pad3_y = 250 end
end

function love.draw()
	love.graphics.translate(400, 300)
	love.graphics.rectangle("fill", -350-10, pad1_y - 50, 20, 100)
	love.graphics.rectangle("fill", 350-10, pad2_y - 50, 20, 100)
	love.graphics.rectangle("fill", 0, pad3_y - 50, 50, 100)
end
