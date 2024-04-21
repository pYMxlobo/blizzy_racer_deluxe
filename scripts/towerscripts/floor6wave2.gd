extends Node2D




func _on_timer_timeout():
	position = Vector2(0, 0)
	$AudioStreamPlayer.play()
