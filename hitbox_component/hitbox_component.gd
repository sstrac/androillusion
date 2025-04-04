extends Area2D


@export var base_damage: int
@export var health_component: Node


func _on_area_entered(area: Area2D) -> void:
	if health_component != null and 'base_damage' in area:
		health_component.decrease(area.base_damage * DialTracker.factor)
