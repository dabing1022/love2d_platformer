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
	
	if player.y > player.map.groundy - player.animation.height then
		player.y = player.map.groundy - player.animation.height
		player.jumping = false
		player.yspeed = 0
	end

	if not player.jumping and love.joystick.isDown(1, 1) then
		player.yspeed = player.jumpSpeed
		player.jumping = true
		setAnimation(player, jumping)
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
