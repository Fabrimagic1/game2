extends KinematicBody2D

const bulletPath =preload('res://Bullet.tscn')

func _ready():
	pass

func _process(delta):
	var velocity = Vector2()
		
	# Aggiorno il vettore velocity in base all'input del giocatore
	if Input.is_key_pressed(KEY_W):
		velocity.y = -1
		$AnimatedSprite.play('walk_up')
	if Input.is_key_pressed(KEY_S):
		velocity.y = 1
		$AnimatedSprite.play('walk_down')
	if Input.is_key_pressed(KEY_A):
		velocity.x = -1
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('walk_left')
	if Input.is_key_pressed(KEY_D):
		velocity.x = 1
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('walk_left')
	var movement = 250*velocity.normalized()*delta
	
	self.move_and_collide(movement)
	
	
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
	
	$Node2D.look_at(get_global_mouse_position())




func shoot():
	var bullet = bulletPath.instance()
	
	get_parent().add_child(bullet)
	bullet.position =$Node2D/Position2D.global_position
	bullet.velocity=get_global_mouse_position()-bullet.position
# var a = 2
# var b = "text"

func updateAnimatedSprite(velocity):
	if velocity.x == -1:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('walk_left')
	elif velocity.x == 1:
		# specchia la sprite per creare l'animazione di camminata verso destra
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('walk_left')
	elif velocity.y == -1:
		$AnimatedSprite.play('walk_up')
	elif velocity.y == 1:
		$AnimatedSprite.play('walk_down')
	
	if velocity == Vector2():
		# se il giocatore si stava spostando verso sinistra
		if $AnimatedSprite.animation == 'walk_left':
			$AnimatedSprite.play('stand_left')
		elif $AnimatedSprite.animation == 'walk_up':
			$AnimatedSprite.play('stand_up')
		elif $AnimatedSprite.animation == 'walk_down':
			$AnimatedSprite.play('stand_down')

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
