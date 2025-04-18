extends Node

@export var max_health: int:
	set(mh):
		max_health = mh
		if health == 0:
			health = mh


var health: int:
	set(h):
		health = clamp(h, 0, max_health)

signal dead
signal health_changed(change)

	
func increase(_health):
	if self.health < max_health:
		self.health += _health
		
		if self.health >= max_health:
			self.health = max_health
		
		health_changed.emit(_health)
	

func decrease(_health):
	if self.health > 0:
		self.health -= _health

		if self.health <= 0:
			self.health = 0
			dead.emit()
		
		health_changed.emit(_health)
