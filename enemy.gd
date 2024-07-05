extends CharacterBody2D

var health = 3.0
@onready var player = get_node("/root/game/player")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 320
	move_and_slide()

func take_damage():
	health = health - 1.0
	if health == 0.0:
		queue_free()

func _on_hitbox_body_entered(body):
	if "player" in body.name:
		queue_free()
		if body.has_method("hurt"):
			body.hurt()
