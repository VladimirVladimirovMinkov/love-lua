player = {jump_height = -300, img = love.graphics.newImage('player.png'), speed = 200,
		  y = 200, ground = 200, width = 60, height = 60, x = 200, y_velocity = 0}

gravity = -500

ladder = {x = 600, y = 0+player.height, height = 200, width = 30, speed = 5}

falling = true

function love.load()

end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function love.update(dt)
	if love.keyboard.isDown('d') then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	elseif love.keyboard.isDown('a') then
		if player.x > 0 then
			player.x = player.x - (player.speed * dt)
		end
	end

	if love.keyboard.isDown('space') then
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
end