extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0

func _process(delta) -> void:
	time += delta
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d" % seconds

func stop() -> void:
	set_process(false)


func _on_player_dead():
	stop()
