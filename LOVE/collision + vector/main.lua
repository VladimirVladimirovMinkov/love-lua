window = {width = 1000, height = 600, flags = {fullscreen = false, vsync = 1, msaa = 2, centered = true, display = 2}}

player = {jump_height = -300, img = love.graphics.newImage('images/player.png'), speed = 200, width = 80, height = 80, velocity = {x = 0, y = 0}, direction = 1}

images = {{x = 100, y = 100, img = love.graphics.newImage('images/player.png'), name = "box1"}}

mess_triger = {{x = 200, y = 200, width = 100, height = 100}}

map = {x = 0, y = 0, width = window.width, height = window.height}

xs = 0

function love.load()
	success = love.window.setMode(window.width, window.height, window.flags)
	player.y = love.graphics.getHeight()-player.height
	player.x = 0
end

function love.update()
	
end

function love.draw()
	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 0)
	for i, v in ipairs(images) do
		love.graphics.draw(v.img, v.x, v.y, 0, 1, 1, 0, 0)
	end
end