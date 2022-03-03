extends KinematicBody2D

var run_speed = 25
var velocity = Vector2.ZERO
var player = null

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * run_speed
	velocity = move_and_slide(velocity)

func _on_DetectRadius_body_entered(body):
	player = body
	print('ciao')  
func _on_DetectRadius_body_exited(body):
	player = null
	

		
			
			






func _on_Area2D_area_entered(area):
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	pass # Replace with function body.
