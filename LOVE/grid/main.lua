local isDown = love.keyboard.isDown
local bool = { [true] = 1, [false] = 0 }
local player = {x = 400, y = 400, width = 30, height = 40, ladder = false, floor = 500}
local ladder = {movement = 2, width = 45, height = 100, x = 200, y = 400}
local collision = false

function love.load()

end

function love.update()
    collision = CheckCollision(player.x-1, player.y-1, player.width+2, player.height+2,
            ladder.x-1, ladder.y-1, ladder.width+2, ladder.height+2)
    if true == collision then
        player.ladder = true
    end
    if player.ladder then
        player.y = player.y + (bool[isDown"down"] - bool[isDown"up"]) * 3
        player.ladder = false
    end
    player.x = player.x + (bool[isDown"right"] - bool[isDown"left"]) * 4

    if player.y < player.floor-player.height then
        player.y = player.y + 1
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