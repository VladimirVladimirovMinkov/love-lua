local board = {0, 0, 0, 0, 0, 0, 0, 0, 0}
love.window.setMode(500, 500)
local player = true
local winner = false
local play = 1
local mutations = 200

local bot = {
{
{0, 0, 0, 0}, 
{{0, 0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0}}, 
{0, 0, 0, 0}
},

{
{0, 0, 0, 0}, 
{{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, 
{0, 0, 0, 0}
},

{
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}},
{0, 0, 0, 0, 0, 0, 0, 0, 0}
}
}

local bs = bot

function love.update()
	local x = love.mouse.getX()
	local y = love.mouse.getY()
	if winner == 1 then
		bot = bs
		for i=1, mutations do
			local num1 = love.math.random(1, #bot)
			local num2 = love.math.random(2, #bot[num1])
			local num3 = love.math.random(1, #bot[num1][num2])
			if num2 == 2 then
				local num4 = love.math.random(1, #bot[num1][num2][num3])
				bot[num1][num2][num3][num4] = bot[num1][num2][num3][num4] + (love.math.random(-1, 1)/10)
			else
				bot[num1][num2][num3] = bot[num1][num2][num3]
			end
		end
		board = {0, 0, 0, 0, 0, 0, 0, 0, 0}
		winner = false
	elseif winner == 2 then
		bs = bot
		board = {0, 0, 0, 0, 0, 0, 0, 0, 0}
		winner = false
	end
	if player == true and winner == false then
		if love.mouse.isDown(1) == true then
			play = 1
			if 100 < x and 200 > x and 100 < y and 200 > y and board[1] == 0 then
				board[1] = play
				player = false
			elseif 200 < x and 300 > x and 100 < y and 200 > y and board[2] == 0 then
				board[2] = play
				player = false
			elseif 300 < x and 400 > x and 100 < y and 200 > y and board[3] == 0 then
				board[3] = play
				player = false
			elseif 100 < x and 200 > x and 200 < y and 300 > y and board[4] == 0 then
				board[4] = play
				player = false
			elseif 200 < x and 300 > x and 200 < y and 300 > y and board[5] == 0 then
				board[5] = play
				player = false
			elseif 300 < x and 400 > x and 200 < y and 300 > y and board[6] == 0 then
				board[6] = play
				player = false
			elseif 100 < x and 200 > x and 300 < y and 400 > y and board[7] == 0 then
				board[7] = play
				player = false
			elseif 200 < x and 300 > x and 300 < y and 400 > y and board[8] == 0 then
				board[8] = play
				player = false
			elseif 300 < x and 400 > x and 300 < y and 400 > y and board[9] == 0 then
				board[9] = play
				player = false
			end
		end
	end
	if board[1] == board[2] and board[2] == board[3] and board[3] ~= 0 then
		winner = board[1]
	elseif board[4] == board[5] and board[5] == board[6] and board[6] ~= 0 then
		winner = board[4]
	elseif board[7] == board[8] and board[8] == board[9] and board[9] ~= 0 then
		winner = board[7]
	elseif board[1] == board[4] and board[4] == board[7] and board[7] ~= 0 then
		winner = board[1]
	elseif board[2] == board[5] and board[5] == board[8] and board[8] ~= 0 then
		winner = board[2]
	elseif board[3] == board[6] and board[6] == board[9] and board[9] ~= 0 then
		winner = board[3]
	elseif board[1] == board[5] and board[5] == board[9] and board[9] ~= 0 then
		winner = board[1]
	elseif board[3] == board[5] and board[5] == board[7] and board[7] ~= 0 then
		winner = board[3]
	end
	if player == false and winner == false then
		for i=1, #bot[1][1] do
			bot[1][1][i] = bot[1][3][i]
			for j=1, #board do
				bot[1][1][i] = bot[1][1][i] + (board[j]*bot[1][2][i][j])
			end
		end
		for i=1, #bot[2][1] do
			bot[2][1][i] = bot[2][3][i]
			for j=1, #bot[1][1] do
				bot[2][1][i] = bot[2][1][i] + (bot[1][1][j]*bot[2][2][i][j])
			end
		end
		for i=1, #bot[3][1] do
			bot[3][1][i] = bot[3][3][i]
			for j=1, #bot[2][1] do
				bot[3][1][i] = bot[3][1][i] + (bot[2][1][j]*bot[3][2][i][j])
			end
		end
		local mi, mv = 1, bot[3][1][1]
		for i = 2, #bot[3][1] do
			if bot[3][1][i] > mv then
				mi, mv = i, bot[3][1][i]
			end
		end
		board[mi] = 2
		player = true
	end
	if board[1] == board[2] and board[2] == board[3] and board[3] ~= 0 then
		winner = board[1]
	elseif board[4] == board[5] and board[5] == board[6] and board[6] ~= 0 then
		winner = board[4]
	elseif board[7] == board[8] and board[8] == board[9] and board[9] ~= 0 then
		winner = board[7]
	elseif board[1] == board[4] and board[4] == board[7] and board[7] ~= 0 then
		winner = board[1]
	elseif board[2] == board[5] and board[5] == board[8] and board[8] ~= 0 then
		winner = board[2]
	elseif board[3] == board[6] and board[6] == board[9] and board[9] ~= 0 then
		winner = board[3]
	elseif board[1] == board[5] and board[5] == board[9] and board[9] ~= 0 then
		winner = board[1]
	elseif board[3] == board[5] and board[5] == board[7] and board[7] ~= 0 then
		winner = board[3]
	end
	
end

function love.draw()
	love.graphics.line(100, 200, 400, 200)
	love.graphics.line(100, 300, 400, 300)
	love.graphics.line(200, 100, 200, 400)
	love.graphics.line(300, 100, 300, 400)
	if board[1] == 1 then
		love.graphics.circle("fill", 150, 150, 40)
	elseif board[1] == 2 then
		love.graphics.line(110, 110, 190, 190)
		love.graphics.line(110, 190, 190, 110)
	end
	if board[2] == 1 then
		love.graphics.circle("fill", 250, 150, 40)
	elseif board[2] == 2 then
		love.graphics.line(210, 110, 290, 190)
		love.graphics.line(210, 190, 290, 110)
	end
	if board[3] == 1 then
		love.graphics.circle("fill", 350, 150, 40)
	elseif board[3] == 2 then
		love.graphics.line(310, 110, 390, 190)
		love.graphics.line(310, 190, 390, 110)
	end
	if board[4] == 1 then
		love.graphics.circle("fill", 150, 250, 40)
	elseif board[4] == 2 then
		love.graphics.line(110, 210, 190, 290)
		love.graphics.line(110, 290, 190, 210)
	end
	if board[5] == 1 then
		love.graphics.circle("fill", 250, 250, 40)
	elseif board[5] == 2 then
		love.graphics.line(210, 210, 290, 290)
		love.graphics.line(210, 290, 290, 210)
	end
	if board[6] == 1 then
		love.graphics.circle("fill", 350, 250, 40)
	elseif board[6] == 2 then
		love.graphics.line(310, 210, 390, 290)
		love.graphics.line(310, 290, 390, 210)
	end
	if board[7] == 1 then
		love.graphics.circle("fill", 150, 350, 40)
	elseif board[7] == 2 then
		love.graphics.line(110, 310, 190, 390)
		love.graphics.line(110, 390, 190, 310)
	end
	if board[8] == 1 then
		love.graphics.circle("fill", 250, 350, 40)
	elseif board[8] == 2 then
		love.graphics.line(210, 310, 290, 390)
		love.graphics.line(210, 390, 290, 310)
	end
	if board[9] == 1 then
		love.graphics.circle("fill", 350, 350, 40)
	elseif board[9] == 2 then
		love.graphics.line(310, 310, 390, 390)
		love.graphics.line(310, 390, 390, 310)
	end
end