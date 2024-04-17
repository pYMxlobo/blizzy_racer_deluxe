extends Sprite2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.flash == true:
		show()
	elif Global.flash == false:
		hide()
