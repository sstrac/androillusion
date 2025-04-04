extends Node


var factor: float:
	set(v):
		factor = clamp(v, 1.0, 10.0)


func _ready() -> void:
	factor = 5
