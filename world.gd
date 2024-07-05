extends Node2D

func spawn():
	var new_mob = preload("res://enemy.tscn").instantiate()
	$player/Path2D/PathFollow2D.progress_ratio = randf()
	new_mob.global_position = $player/Path2D/PathFollow2D.global_position
	add_child(new_mob)

func heal_orb():
	var new_orb = preload("res://heal.tscn").instantiate()
	$player/Path2D/PathFollow2D.progress_ratio = randf()
	new_orb.global_position = $player/Path2D/PathFollow2D.global_position
	add_child(new_orb)

func _on_player_dead():
	%Joever.visible = true

func _on_timer_timeout():
	spawn()


func _on_timer_2_timeout():
	heal_orb()


func _on_button_pressed():
	get_tree().reload_current_scene()
