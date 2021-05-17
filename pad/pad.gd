extends KinematicBody2D

var acceleration := 3000.0
var velocity := 0.0
var max_velocity := 1000.0

func _process(delta: float) -> void:
	# Process input
	if Input.is_action_pressed("ui_left"):
		velocity = max(velocity - acceleration * delta, -max_velocity)
	elif velocity < 0:
		velocity = min(velocity + acceleration * delta, 0)
	if Input.is_action_pressed("ui_right"):
		velocity = min(velocity + acceleration * delta, max_velocity)
	elif velocity > 0:
		velocity = max(velocity - acceleration * delta, 0)
	
	# Move, stop if collided
	if move_and_collide(Vector2(velocity * delta, 0).rotated(rotation)):
		velocity = 0
