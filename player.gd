extends CharacterBody2D

var health = 150.0

signal dead

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %hole.global_position
	new_bullet.global_rotation = %hole.global_rotation
	%hole.add_child(new_bullet)

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 400
	move_and_slide()
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		shoot()

func hurt():
	health = health - 3.0
	$CanvasLayer/hpbar.value = health
	if health <= 0.0:
		dead.emit()

func heal():
	if health + 30 <= 150:
		health = health + 30
	else :
		health = 150
	$CanvasLayer/hpbar.value = health
