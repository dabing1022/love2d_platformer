gravity = 0.12
groundY = 200

function defaultPhysics(this)
	if not this.xacc then this.xacc = 0 end
	if not this.yacc then this.yacc = 0 end
	if not this.xspeed then this.xspeed = 0 end
	if not this.yspeed then this.yspeed = 0 end

	this.xspeed = this.xspeed + this.xacc
	this.yspeed = this.yspeed + this.yacc
	
	this.xspeed = math.min(this.xspeed, this.xspeedMax or this.xspeed)
	this.yspeed = math.min(this.yspeed, this.yspeedMax or this.yspeed)
	
	this.xspeed = math.max(this.xspeed, this.xspeedMin or this.xspeed)
	this.yspeed = math.max(this.yspeed, this.yspeedMin or this.yspeed)
	
	if this.xspeed > 0 then this.direction = "right" end
	if this.xspeed < 0 then this.direction = "left" end

	this.x = this.x + this.xspeed
	this.y = this.y + this.yspeed
	
	this.x = math.min(this.x, this.xMax or this.x)
	this.y = math.min(this.y, this.yMax or this.y)

	this.x = math.max(this.x, this.xMin or this.x)
	this.y = math.max(this.y, this.yMin or this.y)
end
