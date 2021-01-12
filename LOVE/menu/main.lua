window = {width = 1000, height = 600, flags = {fullscreen = false, vsync = 1, msaa = 2, centered = true, display = 2}}
	
main_screen = {
{x = 0, y = 0, img = love.graphics.newImage("images/background.png"), name = "background"},
{x = 0, y = 0, img = love.graphics.newImage("images/road.png"), name = "road"},
{x = 0, y = 0, img = love.graphics.newImage("images/menu.png"), name = "menu"}
}

main_screen_names = {}

for i, v in ipairs(main_screen) do
	main_screen_names[v.name] = i
end

main_screen[3].x, main_screen[3].y = (window.width - main_screen[3].img:getWidth())/2, (window.height - main_screen[3].img:getHeight())/2
main_screen[2].y = window.height/4*2.75

screen = {}

function love.load()
	success = love.window.setMode(window.width, window.height, window.flags)
	screen = main_screen
end

function love.update()
	
end

function love.draw()
	for i, v in ipairs(screen) do
		love.graphics.draw(v.img, v.x, v.y, 0, 1, 1, 0, 0)
	end
end