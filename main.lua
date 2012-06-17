dofile("physics.lua")
dofile("animations.lua")
dofile("player.lua")

function love.load()
	love.graphics.setCaption("Super Mario Redux")
	print("Mario redux started")

	bgGfx = love.graphics.newImage("backgrounds/world_1.png")
	player.gfx = love.graphics.newImage("sprites/mario.png")
	print("Graphics loaded")

	love.joystick.open(1)
	print("Joystick initialized")
end

function love.update(dt)
	player:doLogic()
	player:doPhysics()
	player:doAnimation()
end

function love.draw()
	love.graphics.draw(bgGfx, 0, 0)
	player:drawAnimation()	
end
