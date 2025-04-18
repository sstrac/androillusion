extends Character

@export var anim: AnimationPlayer


func _ready() -> void:
	if health_comp:
		health_comp.health_changed.connect(_on_health_changed)


func _on_health_changed(change):
	anim.play('flash')
