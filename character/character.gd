extends CharacterBody2D

class_name Character

@onready var label = get_node('Label')
@onready var anim = get_node("AnimationPlayer")
@onready var health_comp = get_node("HealthComponent")
@onready var damage_feedback_comp = get_node("DamageFeedbackComponent")
@export var movement_comp: Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = '%d' % health_comp.health
	health_comp.health_changed.connect(_on_health_changed)


func _on_health_changed(change):
	label.text = '%d' % health_comp.health
	anim.play('flash')


func _physics_process(delta: float) -> void:
	movement_comp.physics_process(delta)
	

func _process(delta: float) -> void:
	movement_comp.process(delta)
	
	
# Used by state
func follow(pos, delta, speed=100):
	global_position = global_position.move_toward(pos, delta * speed) 
	move_and_slide()
