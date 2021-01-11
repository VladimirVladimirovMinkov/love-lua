window = {width = 1200, height = 700, flags = {fullscreen = false, vsync = 1, msaa = 2, centered = true, display = 2}}

player = {velocity = {x = 0, y = 0}, img = love.graphics.newImage('player.png'), speed = 200, 
width = 60, height = 60, jump = -30, mass = 6, x = 20, y = 20, gravity = true, falling = true}

function love.load()
	success = love.window.setMode(window.width, window.height, window.flags)
	player.y = love.graphics.getHeight()-player.height
end	

function love.update(dt)
	
	if dt < 1/60 then
		love.timer.sleep(1/60 - dt)
	end
	
	if (player.gravity == true) then
		player.velocity.y = player.velocity.y + player.mass
	end
	
	player.x = player.x + player.velocity.x
	player.y = player.y + player.velocity.y
	
	if (player.y > window.height-player.height-1) then
		player.gravity = false
		player.y = window.height-player.height
		player.velocity.y = 0
	else
		player.gravity = true
	end
	
	if love.keyboard.isDown('space') and player.velocity.y == 0 and player.falling == false then
		player.velocity.y = player.jump
	end
	
	if player.velocity.y == 0 then
		player.falling = false
	else
		player.falling = true
	end
	
end

function love.draw()
	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 0)
end
