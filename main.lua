dofile("physics.lua")
dofile("camera.lua")
dofile("animations.lua")
dofile("player.lua")
dofile("maps.lua")

function love.load()
	love.graphics.setCaption("Super Mario Redux")
	print("Mario redux started")

	loadMap(world1_1)
	player.gfx = love.graphics.newImage("sprites/mario.png")
	print("Graphics loaded")

	love.joystick.open(1)
	print("Joystick initialized")
end

function love.update(dt)
	player:doLogic()
	player:doPhysics()
	player:doAnimation()
	cameraUpdate()
	
	if player.x >= 3170 then loadMap(world1_2) end
end

function love.draw()
	love.graphics.draw(player.map.layer1, -camera.x, 0)
	player:drawAnimation()	
end
