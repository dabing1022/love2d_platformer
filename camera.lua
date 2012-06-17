camera = {
	x = 0,
	y = 0
}

function cameraUpdate()
	camera.x = player.x - love.graphics.getWidth() / 2
	
	if camera.x < 0 then camera.x = 0 end
end

function getPosition(obj)
	return obj.x - camera.x, obj.y - camera.y
end
