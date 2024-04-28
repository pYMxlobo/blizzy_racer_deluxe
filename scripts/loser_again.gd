extends TextureButton



func surebuddy(skibidi):
		global_position.x = skibidi
		global_position.y = skibidi

var next = load("res://scenes/char_select.tscn")

func _on_pressed():
	surebuddy(0)
	get_tree().root
	get_tree().change_scene_to_packed(next)
	Global.race_time = 0
	Global.see_bars = false
	Global.seeing = false
