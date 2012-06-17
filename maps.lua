world1_1 = {
	layer1 = love.graphics.newImage("backgrounds/world_1_1.png"),
	playerx = 100,
	playery = 200,
	camerax = 0,
	cameray = 0,
	groundy = 200
}

world1_2 = {
	layer1 = love.graphics.newImage("backgrounds/world_1_2.png"),
	playerx = 200,
	playery = 400,
	camerax = 0,
	cameray = 0,
	groundy = 400
}

function loadMap(map)
	player.x = map.playerx
	player.y = map.playery
	
	player.xspeed = 0
	player.yspeed = 0
	
	player.xacc = 0
	
	player.map = map
	
	camera.x = map.camerax
	camera.y = map.cameray
end
