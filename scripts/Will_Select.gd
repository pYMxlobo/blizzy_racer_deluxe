extends TextureButton

func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi

var next = load("res://scenes/map_select.tscn")
func _on_pressed():
	OS.delay_msec(100)
	Global.player_selected = 6
	surebuddy(0)
	get_tree().root
	get_tree().change_scene_to_packed(next)

func _ready():
	if Global.winstotal >= 10:
		disabled = false
	else:
		disabled = true

func _on_mouse_entered():
	if disabled == true:
		$Fail.play()
	else:
		$Name.play()
