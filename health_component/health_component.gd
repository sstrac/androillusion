extends Node

@export var max_health: int

var health: int:
	set(h):
		health = clamp(h, 0, max_health)

signal dead
signal health_changed(change)


func _ready():
	health = max_health

	
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
