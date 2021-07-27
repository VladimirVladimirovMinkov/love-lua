local window = {width = 1000, height = 600, flags = {fullscreen = false, vsync = 1, msaa = 2, centered = true, display = 2}}

local player = {jump_height = -300, img = love.graphics.newImage('player.png'), speed = 200,
		  width = 60, height = 60, x = 200, y_velocity = 0, direction = 1}

local gravity = -500

local ladder = {x = 600, y = 0, height = 600, width = 30, speed = 1}

local falling = true

local bullets = {speed = -250, height = player.height/6, width = player.width/3, range = 300, period = 100/300, time = 0}

local time = love.timer.getTime( )

function key(key)
	if key == true then
		if player.direction == 1 then
			bullets[#bullets+1] = { y = (player.y + player.height/2) - bullets.height/2,
									x = (player.x + player.width/2) - bullets.width/2, speed = bullets.speed }
		else
			bullets.speed = -bullets.speed
			bullets[#bullets+1] = { y = (player.y + player.height/2) - bullets.height/2,
									x = (player.x + player.width/2) - bullets.width/2, speed = bullets.speed }
			bullets.speed = -bullets.speed
		end
	end
end

function love.load()
	success = love.window.setMode(window.width, window.height, window.flags)
	player.y = love.graphics.getHeight()-player.height
	player.ground = player.y
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function love.update(dt)
	time = love.timer.getTime( )
	down = love.mouse.isDown(1)
	
	if time - bullets.time > bullets.period and down then
		key(down)
		bullets.time = time
		time = love.timer.getTime( )
	end

	for i,v in ipairs(bullets) do
		v.x = v.x - v.speed * dt
		if v.x > player.x+bullets.range then
			table.remove(bullets, 1)
		end
	end

	if love.keyboard.isDown('d') then
		player.direction = 1
		if player.x < (window.width - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	elseif love.keyboard.isDown('a') then
		player.direction = -1
		if player.x > 0 then
			player.x = player.x - (player.speed * dt)
		end
	end

	if love.keyboard.isDown('space') and falling == true then
		if player.y_velocity == 0 then
			player.y_velocity = player.jump_height
		end
	end

	if CheckCollision(player.x, player.y, player.width, player.height,
			ladder.x, ladder.y, ladder.width, ladder.height) == true then
		falling = false
	else
		falling = true
	end

	if falling == true then
		player.y = player.y + player.y_velocity * dt
		player.y_velocity = player.y_velocity - gravity * dt
	else
		player.y_velocity = 0
		if love.keyboard.isDown('w') then
			player.y = player.y - ladder.speed
		elseif love.keyboard.isDown('s') then
			player.y = player.y + ladder.speed
		end
	end

	if player.y > player.ground then
		player.y_velocity = 0
		player.y = player.ground
	end

	if player.y < 0 then
		player.y = 0
		player.y_velocity = -player.y_velocity
	end
end

function love.draw()
	love.graphics.rectangle("fill", ladder.x, ladder.y, ladder.width, ladder.height)
	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 0)
	for i, v in ipairs(bullets) do
		love.graphics.rectangle("fill", v.x, v.y, bullets.width, bullets.height)
	end
end