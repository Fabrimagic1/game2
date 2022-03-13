extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 300
func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized()* delta * speed)
# var a = 2
# var b = "t

var start = Vector2.ZERO
var direction = Vector2.ZERO
var maxtime = 0.5
func _ready():
	var timer = Timer.new()
	timer.wait_time = maxtime
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")

func on_timeout():
	self.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



