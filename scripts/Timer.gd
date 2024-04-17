extends Timer



func _on_timeout():
	Global.race_time = Global.race_time + 1
