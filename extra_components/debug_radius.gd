@tool
extends Node2D


const DEBUG_TEXTURE_LOC = "res://resources/debug_texture.tres"

@export var debug_sprite: Sprite2D
@export var debug: bool
@export var radius: int:
	set(r):
		radius = r
		if Engine.is_editor_hint() or debug:
			_debug_texture()


func _debug_texture():
	# Duplicating the texture might cause OOM in editor, check this.
	var texture: GradientTexture2D = load(DEBUG_TEXTURE_LOC).duplicate()
	texture.height = radius
	texture.width = radius
	debug_sprite.texture = texture
	
