extends CollisionShape2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.flash == true:
		disabled = true
	elif Global.flash == false:
		disabled = false
