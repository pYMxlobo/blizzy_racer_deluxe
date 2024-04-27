extends GPUParticles2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_parent().turning == true:
		emitting = true
	elif get_parent().turning == false:
		emitting = false
