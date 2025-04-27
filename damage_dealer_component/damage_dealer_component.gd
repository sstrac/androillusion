extends Node


@export var base_damage: int

var multiplier: float = 1.0


func get_total_damage():
	return base_damage * multiplier * DialTracker.factor
