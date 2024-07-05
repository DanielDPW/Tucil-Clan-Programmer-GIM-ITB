extends Area2D

func _on_body_entered(body):
	if body.has_method("heal"):
		queue_free()
		body.heal()
