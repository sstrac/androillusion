extends Area2D


@export var damage: int
@export var health_component: Node


func _on_area_entered(area: Area2D) -> void:
	if health_component != null and 'damage' in area:
		health_component.decrease(area.damage)
