extends Control


@export var rich_text_label: RichTextLabel
@export var max_font_size: int
@export var min_font_size: int
@export var rise_height: int
@export var lock_time_s: int
@export var lifetime_s: int
@export var increment_gradient: Gradient

@onready var anim: AnimationPlayer = get_node("AnimationPlayer")
@onready var lock_timer: Timer = get_node("LockTimer")
@onready var free_timer: Timer = get_node("FreeTimer")

var font_size: int = 20
var value: int = 0
var locked = false


func _ready():
	if rich_text_label == null:
		rich_text_label = RichTextLabel.new()
		rich_text_label.scroll_active = false
		rich_text_label.fit_content = true
		rich_text_label.autowrap_mode = TextServer.AUTOWRAP_OFF
		rich_text_label.bbcode_enabled = true
	
	get_node("HBoxContainer").add_child(rich_text_label)
	_update_label()
		
		
	lock_timer.wait_time = lock_time_s
	free_timer.wait_time = lifetime_s

	
func _process(_delta):
	if rich_text_label.custom_minimum_size.y < rise_height:
		rich_text_label.custom_minimum_size.y += 1
	

func _append_value(amount):
	anim.play('bump')
	value += amount
	
	if font_size < max_font_size:
		font_size += 1
	
	
func _update_label():
	rich_text_label.add_theme_font_size_override('normal_font_size', self.font_size)
	rich_text_label.set_text("[center]%d" % self.value)
	
	var font_size_over_max: float = float(font_size - min_font_size) / float(max_font_size - min_font_size)
	rich_text_label.add_theme_color_override('default_color', increment_gradient.sample(font_size_over_max))


func bump(amount):
	if not locked:
		lock_timer.stop()
		lock_timer.start()
		_append_value(amount)
		_update_label()


func _on_lock_timer_timeout() -> void:
	locked = true
	free_timer.start()


func _on_free_timer_timeout() -> void:
	queue_free()
