extends TextureButton

func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi

var next = load("res://scenes/racing_world2.tscn")

func _on_pressed():
	OS.delay_msec(100)
	surebuddy(0)
	get_tree().root
	get_tree().change_scene_to_packed(next)
