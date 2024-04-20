extends TextureButton

@onready var next = preload("res://scenes/mapselectpage3.tscn")

#
func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi



func _on_pressed():
	surebuddy(0)
	get_tree().change_scene_to_packed(next)
