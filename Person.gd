extends RigidBody2D

export var hasControl := false;
export var speed := 200;
export var torque := 400;

func _integrate_forces(state):
	if hasControl:
		var move_direction = 0;
		if Input.is_action_pressed("ui_up"):
			move_direction += 1
		if Input.is_action_pressed("ui_down"):
			move_direction -= 1
		applied_force = move_direction * Vector2(0, -speed).rotated(rotation)
		
		var rotate_direction = 0;
		if Input.is_action_pressed("ui_left"):
			rotate_direction -= 1;
		if Input.is_action_pressed("ui_right"):
			rotate_direction += 1;
		applied_torque = rotate_direction * torque
