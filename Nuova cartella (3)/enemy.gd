extends KinematicBody2D

var run_speed = 40
var velocity = Vector2.ZERO
var player = null

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * run_speed
	velocity = move_and_slide(velocity)

func _on_Area2D_body_entered(body):
	player = body

func _on_Area2D_body_exited(area):
	pass
