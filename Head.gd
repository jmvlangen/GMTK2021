extends RigidBody2D

export var player1 = false;
export var player2 = false;
export var move_force := 800;
export var torque := 17000;
export var velocity_force_coefficient : float = 2.8;

var arms = [];

func _integrate_forces(state):
	var move_direction = 0;
	if ((player1 and Input.is_action_pressed("player1_up")) or
		(player2 and Input.is_action_pressed("player2_up"))):
		move_direction += 1
	if ((player1 and Input.is_action_pressed("player1_down")) or
		(player2 and Input.is_action_pressed("player2_down"))):
		move_direction -= 1
	var force = move_direction * Vector2(0, -move_force).rotated(global_rotation)
	force -= velocity_force_coefficient * state.linear_velocity
	applied_force = force
	
	var rotate_direction = 0;
	if ((player1 and Input.is_action_pressed("player1_left")) or
		(player2 and Input.is_action_pressed("player2_left"))):
		rotate_direction -= 1;
	if ((player1 and Input.is_action_pressed("player1_right")) or
		(player2 and Input.is_action_pressed("player2_right"))):
		rotate_direction += 1;
	applied_torque = rotate_direction * torque
