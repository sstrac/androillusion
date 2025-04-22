extends Control

@onready var dial = get_node("HBoxContainer/Dial")


func _ready() -> void:
	dial.changed.connect(_on_dial_factor_changed)


func _on_dial_factor_changed(factor):
	DialTracker.factor = factor
