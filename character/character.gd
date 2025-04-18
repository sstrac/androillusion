extends CharacterBody2D

class_name Character


@export var damage_feedback_comp: Node2D
@export var hitbox_comp: Area2D
@export var health_comp: Node
@export var health_feedback_comp: ProgressBar
@export var movement_comp: Node


func _physics_process(delta: float) -> void:
	if movement_comp:
		movement_comp.physics_process(delta)


func _process(delta: float) -> void:
	if movement_comp:
		movement_comp.process(delta)
	
	
### Used only by state ###
func go_towards(pos, delta, speed=100):
	var dir = global_position.direction_to(pos).normalized()
	go_in_direction(dir, delta, speed)


func go_in_direction(dir, delta, speed=100):
	velocity = dir * speed
	if velocity.x < 0:
		face_left()
	elif velocity.x > 0:
		face_right()
		
	move_and_slide()


func face_left():
	pass


func face_right():
	pass
