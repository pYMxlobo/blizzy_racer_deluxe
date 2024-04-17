extends TextureButton

func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi

var next = preload("res://scenes/racing_world.tscn")

func _on_pressed():
	OS.delay_msec(100)
	surebuddy(0)
	get_tree().root
	get_tree().change_scene_to_packed(next)
