extends Node

class_name MovementComponent

@export var character: CharacterBody2D

var state: MovementState


func process(delta):
	state.process(character, delta)
	

func physics_process(delta):
	state.physics_process(character, delta)


func approach(target: Node2D):
	pass


func jump():
	pass
