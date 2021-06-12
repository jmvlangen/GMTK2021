extends Node2D

export var hasControl := true;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed := 150.0;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _integrate_forces(state):
	if !hasControl:
		return;
	
	if Input.is_action_pressed("move_left"):
		state.linear_velocity = Vector2(-speed, 0);
	if Input.is_action_pressed("move_right"):
		state.linear_velocity = Vector2(speed, 0);
	if Input.is_action_pressed("move_up"):
		state.linear_velocity = Vector2(0, -speed);
	if Input.is_action_pressed("move_down"):
		state.linear_velocity = Vector2(0, speed);
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
