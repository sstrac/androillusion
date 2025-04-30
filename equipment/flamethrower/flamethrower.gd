extends Equipment


@export var excludes: Array[CollisionObject2D]
@export var damage_dealer_comp: Node

@onready var texture = get_node("TextureRect")
@onready var rays = get_node("Rays").get_children()
@onready var hit_timer: Timer = get_node("HitTimer")
@onready var anim: AnimationPlayer = get_node("AnimationPlayer")

var attacking: bool = false
var retracting: bool = false


func _ready() -> void:
	assert(damage_dealer_comp)
	
	if not excludes.is_empty():
		for ray in rays:
			for exclude in excludes:
				ray.add_exception(exclude)	


func _physics_process(delta: float) -> void:
	if hit_timer.time_left == 0 and attacking:
		_damage_nearby_characters()
	
	var dir = Input.get_vector("left", "right", "up", "down")
	#rotation = Vector2.RIGHT.angle_to(dir)
	
	var new_rotation: float = lerp(rotation, Vector2.RIGHT.angle_to(dir), delta * 10)
	
	if new_rotation < 0 and rotation > 0 or new_rotation > 0 and rotation < 0:
		print('switching sign')
	
	
	rotation = new_rotation
	


func _damage_nearby_characters():
	for ray in rays:
		if not ray.collision_result.is_empty():
			for area in ray.collision_result.map(func(r): return r.collider):
				if 'health_comp' in area:
					area.deal_damage(damage_dealer_comp.get_total_damage())
					hit_timer.start()


func attack():
	for ray: ShapeCast2D in rays:
		ray.enabled = true
	attacking = true
	retracting = false
	hit_timer.start()
	anim.play('throw')


func stop():
	if attacking:
		retracting = true
		anim.play_backwards('throw')


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if retracting:
		retracting = false
		for ray: ShapeCast2D in rays:
			ray.enabled = false
		
		hit_timer.stop()
		attacking = false
