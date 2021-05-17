extends KinematicBody2D

var speed := 50
var velocity := Vector2()

func _ready() -> void:
	velocity = Vector2.UP.rotated(-PI/4) * speed

func _process(delta:float) -> void:
	var collision := move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
