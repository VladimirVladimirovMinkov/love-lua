local isDown = love.keyboard.isDown
local bool = { [true] = 1, [false] = 0 }
local speedd = 0
local speed = speedd
local ball = { x = 0, y = 0, vx = -speed, vy = speed }
local pad_x = 0
local score = 0
local gravityd = 0.01
local gravity = gravityd

function love.update()
	pad_x = pad_x + (bool[isDown"d"] - bool[isDown"a"]) * 2
	
	if pad_x < -400 then pad_x = -400 end
	if pad_x > 300 then pad_x = 300 end
	
	if ball.x > 415 then
		ball.vx = -ball.vx
	end
	if ball.x < -415 then
		ball.vx = -ball.vx
	end
	
	if ball.y < -300 then ball.vy = (ball.vy ^ 0.5) ^ 2 end
	if ball.y > 200 then ball.vy = -(ball.vy ^ 0.5) ^ 2 end
	
	if ball.x > pad_x and ball.x < pad_x + 100 and ball.y > 200 then
		ball.vx = math.random(-2, 2)
		score = score + 1
		gravity = gravity + 0.0001
	end
	else
		gravity = gravityd
	end
	
	ball.x = ball.x + ball.vx
	ball.y = ball.y + ball.vy
	ball.vy = ball.vy + gravity
end

function love.draw()
	love.graphics.translate(400, 300)
	love.graphics.rectangle("fill", pad_x, 200, 100, 20)
	love.graphics.circle("fill", ball.x, ball.y, 15)
	love.graphics.print(score, -380, -280)
end
