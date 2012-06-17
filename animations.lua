idle = {
	name = "idle",
	x = 211,
	y = 0,
	width = 16,
	widthJump = 30,
	height = 16,
	frames = 1,
	delay = 0
}

running = {
	name = "running",
	x = 241,
	y = 0,
	width = 16,
	widthJump = 30,
	height = 16,
	frames = 3,
	delay = 5
}

jumping = {
	name = "jumping",
	x = 359,
	y = 0,
	width = 17,
	widthJump = 0,
	height = 16,
	frames = 1,
	delay = 0
}

function setAnimation(this, animation)
	if this.animation.name == animation.name then return end
	
	if this.jumping and animation ~= jumping then return end
	
	this.animation = animation
	this.delay = 0
	this.frame = 0
end

function updateAnimation(this)
	if not this.frame then this.frame = 0 end
	if not this.delay then return end
	if not this.animation.frames then return end

	this.delay = this.delay + 1
	
	if this.delay > this.animation.delay then
		this.frame = this.frame + 1
		if this.frame == this.animation.frames then
			this.frame = 0
		end
		this.delay = 0
	end
end

function drawAnimation(this)
	quad = love.graphics.newQuad(this.animation.x + this.frame * this.animation.widthJump, this.animation.y, this.animation.width, this.animation.height, 405, 188)
	x, y = getPosition(this)
	
	if this.direction == "right" or not this.direction then love.graphics.drawq(this.gfx, quad, x, y, 0) end
	if this.direction == "left" then love.graphics.drawq(this.gfx, quad, x + this.animation.width, y, 0, -1, 1) end
end
