extends Node2D

@export var stacking_number_scene: PackedScene
@export var health_comp: Node

var number

func _ready() -> void:
	assert(health_comp)
	health_comp.health_changed.connect(_feedback)


func _feedback(damage) -> void:
	if number == null or number.locked:
		number = stacking_number_scene.instantiate()
		add_child(number)
		
	
	number.bump(damage)
