player = {
	xspeedMax = 2,
	xspeedMin = -2,
	
	yacc = gravity,
	
	jumping = false,
	jumpSpeed = -4,
	
	animation = idle,
}

function player:doLogic()
	axis1, axis2, axis3, axis4, axis5 = love.joystick.getAxes(1)
	
	if axis1 > 0.20 then
		player.xacc = 0.05
		setAnimation(player, running)
	elseif axis1 < -0.2 then
		player.xacc = -0.05
		setAnimation(player, running)
	else
		player.xacc = 0;
		player.xspeed = 0;
		setAnimation(player, idle)
	end
	
	player:checkOnGround()

	if not player.jumping and not player.hasJumped and love.joystick.isDown(1, 1) then
		player.yspeed = player.jumpSpeed
		player.jumping = true
		player.hasJumped = true
		setAnimation(player, jumping)
	end
	
	if not love.joystick.isDown(1, 1) then player.hasJumped = false end
end

function player:checkOnGround()
	if player.yspeed < 0 then return end
	
	tilex1 = math.floor(player.x / 8)
	tilex2 = tilex1 + 1
	tilex3 = tilex2
	
	if player.x % 8 ~= 0 then tilex3 = tilex2 + 1 end
	
	tiley = math.floor((player.y + player.animation.height) / 8)

	if tilex1 < 0 or tilex2 < 0 or tilex3 < 0 or tiley < 0 then return end
	
	if player.map.layer1_info[tilex1 + tiley * player.map.tilewidth + 1] ~= player.map.transparent
		or player.map.layer1_info[tilex2 + tiley * player.map.tilewidth + 1] ~= player.map.transparent
		or player.map.layer1_info[tilex3 + tiley * player.map.tilewidth + 1] ~= player.map.transparent then
		player.y = tiley * 8 - player.animation.height
		player.jumping = false
		player.yspeed = 0
	end
end

function player:doPhysics()
	defaultPhysics(player)
end

function player:doAnimation()
	updateAnimation(player)
end

function player:drawAnimation()
	drawAnimation(player)
end
