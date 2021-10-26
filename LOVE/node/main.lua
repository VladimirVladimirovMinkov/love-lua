local width, height = 1550, 800
local success = love.window.setMode(width, height)
local isDown = love.keyboard.isDown
local bool = { [true] = 1, [false] = 0 }
local sin = math.sin
local cos = math.cos
local rad = math.rad
local layers = {4, 6, 8, 10, 12, 14, 16, 4}
local vertices = {}
for layer = 1, #layers do
	vertices[#vertices+1] = {}
	for node = 1, layers[layer] do
		vertices[layer][node] = {0, 0, 100}
	end
end

function love.load()
	for layer = 1, #vertices do
		for node = 1, #vertices[layer] do
			vertices[layer][node][1] = vertices[layer][node][1] + layer*width/(#layers+1)
			vertices[layer][node][2] = vertices[layer][node][2] + node*height/(layers[layer]+1)
		end
	end
end

function love.update()
	
end

function love.draw()
	for layer = 1, #vertices do
		for node = 1, #vertices[layer] do
			love.graphics.print(tostring(node)..": "..tostring(vertices[layer][node][3]), vertices[layer][node][1], vertices[layer][node][2])
		end
	end
end
