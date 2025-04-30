extends Node

@export var sword: Node2D
@export var flamethrower: Node2D

@onready var equipment: Array = [sword, flamethrower]
var equipped_i: int


func _ready():
	equipped_i = 0


func _unhandled_input(event):
	if InputManager.switch_equipment_pressed(event):
		equipment[equipped_i].stop()
		
		if equipped_i < len(equipment) - 1:
			equipped_i += 1
		else:
			equipped_i = 0
		
	
	elif InputManager.interact_pressed(event):
		equipment[equipped_i].attack()

	elif InputManager.interact_released(event):
		equipment[equipped_i].stop()
