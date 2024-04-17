extends TextureProgressBar



func _ready():
	max_value = get_parent().en_health
	value = get_parent().en_health


func _process(_delta):
	value = get_parent().en_hehe
	if get_parent().en_hehe >= get_parent().en_health:
		hide()
	else:
		show()
