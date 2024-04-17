extends TextureButton

func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi

var next = preload("res://scenes/map_select.tscn")

func _on_pressed():
	$Name.play()
	OS.delay_msec(100)
	Global.player_selected = 5
	surebuddy(0)
	get_tree().root
	get_tree().change_scene_to_packed(next)

func _on_mouse_entered():
		$Name.play()
