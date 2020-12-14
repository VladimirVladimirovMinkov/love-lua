function love.load()

	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(255, 0, 0)

	-- setup the player
	player = {}
	player.x = 300
	player.y = 500
	player.width = 40
	player.height = 10
	player.speed = 300

	-- setup the bullets
	bullets = {}
	bullets.speed = 300
	bullets.width = 10
	bullets.height = 5
	bullets.x = (player.x + player.width/2) - bullets.width/2
end

-- shoot a bullet (by adding it to the bullets table and passing a .y value)
function love.keypressed(key)
	if key == "space" then
		bullets[#bullets+1] = { y= 495, x = (player.x + player.width/2) - bullets.width/2 }
	end
end

function love.update(dt)

	-- move our player
	if love.keyboard.isDown("right") then
		if player.x < (800-player.width) then
			player.x = player.x + player.speed *dt
		elseif player.x < (800-player.width) then
			player.x = (800-player.width)
		end
	end

	if love.keyboard.isDown("left") then
		if player.x > 0 then
			player.x = player.x - player.speed *dt
		elseif player.x < 0 then
			player.x = 0
		end
	end

	-- update the position of the bullets in the table 'bullets'
	for i,v in ipairs(bullets) do
        v.y = v.y - bullets.speed * dt
        if v.y < 100 then
            table.remove(bullets, 1)
        end
    end

end

function love.draw()

	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)

end