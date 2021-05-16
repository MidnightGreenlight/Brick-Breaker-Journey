extends KinematicBody2D

var speed := 50
var velocity := Vector2()

func _ready() -> void:
	velocity = Vector2.UP.rotated(-PI/4) * speed

func _process(delta:float) -> void:
	move_and_collide(velocity * delta)
