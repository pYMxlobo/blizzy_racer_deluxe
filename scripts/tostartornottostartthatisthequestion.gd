extends TextureButton

var next = load("res://scenes/char_select.tscn")

func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi

func _on_pressed():
	surebuddy(0)
	get_tree().root
	get_tree().change_scene_to_packed(next)
