extends TextureButton



func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi

var next = preload("res://scenes/char_select.tscn")

func _on_pressed():
	surebuddy(0)
	get_tree().root
	get_tree().change_scene_to_packed(next)
	Global.race_time = 0