dofile("backgrounds/world_1_1_map.lua")
dofile("backgrounds/world_1_2_map.lua")

world1_1 = {
	layer1 = love.graphics.newImage("backgrounds/world_1_1.png"),
	layer1_info = world_1_1_map,
	transparent = 1,
	playerx = 100,
	playery = 150,
	camerax = 0,
	cameray = 0,
	tilewidth = 424,
}

world1_2 = {
	layer1 = love.graphics.newImage("backgrounds/world_1_2.png"),
	layer1_info = world_1_2_map,
	transparent = 0,
	playerx = 200,
	playery = 380,
	camerax = 0,
	cameray = 0,
	tilewidth = 425
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
