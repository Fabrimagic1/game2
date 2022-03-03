extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 300

func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized()* delta * speed)
# var a = 2
# var b = "t


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
