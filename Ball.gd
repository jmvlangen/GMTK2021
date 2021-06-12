extends RigidBody2D

signal out_of_bounds(left)

export var start_x = 0
export var start_y = 0

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func reset():
	sleeping = true
	position.x = start_x
	position.y = start_y

func _on_VisibilityNotifier2D_screen_exited():
	if position.x < 0:
		emit_signal("out_of_bounds", true)
	if position.x > screen_size.x:
		emit_signal("out_of_bounds", false)
	sleeping = true
