extends LineEdit


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_text_submitted(new_text):
	new_text = int(new_text)
	Global.howmanylaps = new_text


func _on_text_changed(new_text):
	new_text = str(int(new_text))
