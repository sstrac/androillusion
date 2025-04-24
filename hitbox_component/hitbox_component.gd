extends Area2D


@export var health_component: Node


func _on_area_entered(area: Area2D) -> void:
	if 'base_damage' in area:
		if health_component != null and area.avoid_hitbox != self:
			health_component.decrease(area.get_total_damage())
