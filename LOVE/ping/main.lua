local isDown = love.keyboard.isDown
local bool = { [true] = 1, [false] = 0 }
local speedd = 1
local speed = speedd
local ball = { x = 0, y = 0, vx = -speed, vy = speed }
local pad1_y = 0
local pad2_y = 0
local score1 = 0
local score2 = 0

function love.update()
	pad1_y = pad1_y + (bool[isDown"s"] - bool[isDown"w"]) * 2
	pad2_y = pad2_y + (bool[isDown"down"] - bool[isDown"up"]) * 2
	
	if pad1_y < -250 then pad1_y = -250 end
	if pad1_y > 250 then pad1_y = 250 end
	if pad2_y < -250 then pad2_y = -250 end
	if pad2_y > 250 then pad2_y = 250 end
	
	ball.x = ball.x + ball.vx
	ball.y = ball.y + ball.vy
	
	if math.abs(ball.y) >= 285 then ball.vy = -ball.vy end
	
	if ball.x < -325 and ball.x > -350 and math.abs(pad1_y - ball.y) < 60 then
		speed = speed + 0.02
		ball.x = -325
		ball.vx = speed
		ball.vy = ball.vy * 0.5 + math.random(-10, 10) / 20 * speed
	end
	
	if ball.x < -415 then
		ball.x = 0
		ball.y = 0
		ball.vx = -ball.vx
		score2 = score2 + 1
		pad1_y = 0
		pad2_y = 0
		speed = speedd
	end
	
	if ball.x > 325 and ball.x < 350 and math.abs(pad2_y - ball.y) < 60 then
		speed = speed + 0.02
		ball.x = 325
		ball.vx = -speed
		ball.vy = ball.vy * 0.8 + math.random(-10, 10) / 10 * speed
	end
	
	if ball.x > 415 then
		ball.x = 0
		ball.y = 0
		ball.vx = -ball.vx
		score1 = score1 + 1
		pad1_y = 0
		pad2_y = 0
		speed = speedd
	end
	
	if score1 + score2 > 9 then
		print("player " .. (score1 > score2 and 1 or 2) .. " wins.")
	end
end

function love.draw()
	love.graphics.translate(400, 300)
	love.graphics.rectangle("fill", -350-10, pad1_y - 50, 20, 100)
	love.graphics.rectangle("fill", 350-10, pad2_y - 50, 20, 100)
	love.graphics.circle("fill", ball.x, ball.y, 15)
	love.graphics.print(score1, -380, -280)
	love.graphics.print(score2, 370, -280)
end
