local isDown = love.keyboard.isDown
local bool = { [true] = 1, [false] = 0 }
local player = {x = 400, y = 400, width = 30, height = 40, ladder = false}
local shadow = {player.x, player.y-1, width = 32, height = 2}
local ladder = {movement = 2, width = 45, height = 100, x = 200, y = 400}
local collision = false
local falling = true

function love.load()

end

function love.update(dt)
    collision = CheckCollision(player.x, player.y, player.width, player.height,
            ladder.x, ladder.y, ladder.width, ladder.height)

    if true == collision then
        falling = false
    else
        falling = true
    end

    player.x = player.x + (bool[isDown"right"] - bool[isDown"left"]) * 4

    if falling then
        player.y = player.y + (dt*64)
    else
        player.y = player.y + (bool[isDown"down"] - bool[isDown"up"]) * 4
    end
end

function love.draw()
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    love.graphics.rectangle("fill", ladder.x, ladder.y, ladder.width, ladder.height)
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end