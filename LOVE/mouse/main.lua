local down = false
local button = {x = 12, y = 12, width = 64, height = 32, c = {255, 0, 0}}--Button object

function love.draw()
	love.graphics.setColor(button.c)--Set the color of the button
	love.graphics.rectangle("fill", button.x, button.y,button.width, button.height) --Drawing the button
end

function love.update()
    down = love.mouse.isDown(1)
    if down == true then
        x, y = love.mouse.getPosition()
        if x > button.x and x < button.x + button.width and y > button.y and y < button.height then -- Checks if the mouse is on the button
            button.c = {0, 0, 0}
        end
    else
        button.c = {250, 250, 250}
    end
    down = false
end