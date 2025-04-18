extends CharacterBody2D

class_name Character


@export var anim: AnimationPlayer
@export var damage_feedback_comp: Node2D
@export var hitbox_comp: Area2D
@export var health_comp: Node
@export var health_feedback_comp: ProgressBar
@export var movement_comp: Node


func _ready() -> void:
	if health_comp:
		health_comp.health_changed.connect(_on_health_changed)


func _on_health_changed(change):
	if anim:
		anim.play('flash')


func _physics_process(delta: float) -> void:
	if movement_comp:
		movement_comp.physics_process(delta)
	

func _process(delta: float) -> void:
	if movement_comp:
		movement_comp.process(delta)
	
	
### Used only by state ###
func go_to(pos, delta, speed=100):
	global_position = global_position.move_toward(pos, delta * speed)
	move_and_slide()
