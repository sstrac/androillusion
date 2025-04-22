extends Character


@onready var sword = get_node("Sword")
@onready var detection_comp = get_node("DetectionComponent")
@onready var jump_combo = get_node("JumpCombo")

@export var anim: AnimationPlayer


func _ready() -> void:
	jump_combo.slash_complete.connect(_on_slash_complete)
	
	if health_comp:
		health_comp.health_changed.connect(_on_health_changed)


func _on_slash_complete():
	sword.attacking = false
	sword.deactivate()
	
	if detection_comp.collision_points.is_empty() or jump_combo.combo_complete():
		movement_comp.post_combo()
		
	else:
		sword.attack()
		

func _on_health_changed(change):
	anim.play('flash')


func charge(target):
	movement_comp.approach(target)


func face_left():
	sword.face_left()


func face_right():
	sword.face_right()


func on_target_reached():
	sword.attack()
