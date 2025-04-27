extends Area2D


@export var health_comp: Node

# Should hitbox dumbly accept damage from dealer, or should
# the damage dealer trigger the damage?
func _on_area_entered(area: Area2D) -> void:
	if 'damage_dealer_comp' in area:
		if health_comp != null and area.avoid_hitbox != self:
			deal_damage(area.damage_dealer_comp.get_total_damage())


func deal_damage(damage):
	health_comp.decrease(damage)
