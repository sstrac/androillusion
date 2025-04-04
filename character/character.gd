extends Node2D

@onready var label = get_node('Label')
@onready var anim = get_node("AnimationPlayer")
@onready var health_comp = get_node("HealthComponent")
@onready var damage_feedback_comp = get_node("DamageFeedbackComponent")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = '%d' % health_comp.health
	health_comp.health_changed.connect(_on_health_changed)


func _on_health_changed(change):
	damage_feedback_comp.feedback(change)
	label.text = '%d' % health_comp.health
	anim.play('flash')
