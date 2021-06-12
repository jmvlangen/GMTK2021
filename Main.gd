extends Node2D

var score_left = 0
var score_right = 0



func _on_Ball_out_of_bounds(left):
	if left:
		score_left += 1
	else:
		score_right += 1
	$UI.set_score(score_left, score_right)
	$Ball.reset()
