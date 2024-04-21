extends TextureProgressBar

@export var timer : Timer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = timer.time_left
