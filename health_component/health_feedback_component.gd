extends ProgressBar


@export var health_comp: Node


func _ready():
	max_value = health_comp.max_health
	value = health_comp.health
	health_comp.health_changed.connect(_on_health_changed)


func _on_health_changed(_change):
	value = health_comp.health
