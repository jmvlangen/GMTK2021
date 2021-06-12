extends RigidBody2D

export var has_control := false;
export var speed := 200;
export var torque := 400;
export var angle_margin = PI / 6;
export var angle_force = 100

export var left_path : NodePath
export var right_path : NodePath

onready var left = get_node(left_path)
onready var right = get_node(right_path)

func _integrate_forces(state):
	if has_control:
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
		
#	if left:
#		var relative_position : Vector2 = left.position - position
#		var relative_angle = fposmod(relative_position.angle() - rotation, 2*PI) - PI
#		if abs(relative_angle) > angle_margin:
#			print(name, 'left', relative_angle)
#			# applied_force = Vector2(0, -sign(relative_angle) * angle_force).rotated(rotation)
#
#	if right:
#		var relative_position : Vector2 = right.position - position
#		var relative_angle = fposmod(relative_position.angle() - rotation + PI, 2*PI) - PI
#		if abs(relative_angle) > angle_margin:
#			print(name, 'right', relative_angle)
#			# applied_force += Vector2(0, -sign(relative_angle) * angle_force).rotated(rotation)
		
