extends Window

func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.justpicked == true:
		show()
		Global.justpicked = false


func _on_close_requested():
	hide()
