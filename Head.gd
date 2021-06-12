extends RigidBody2D

export var controlled = false;
export var move_force := 200;
export var torque := 400;

var arms = [];

func _integrate_forces(state):
	if controlled:
		var move_direction = 0;
		if Input.is_action_pressed("ui_up"):
			move_direction += 1
		if Input.is_action_pressed("ui_down"):
			move_direction -= 1
		applied_force = move_direction * Vector2(0, -move_force).rotated(rotation)
		
		var rotate_direction = 0;
		if Input.is_action_pressed("ui_left"):
			rotate_direction -= 1;
		if Input.is_action_pressed("ui_right"):
			rotate_direction += 1;
		applied_torque = rotate_direction * torque
