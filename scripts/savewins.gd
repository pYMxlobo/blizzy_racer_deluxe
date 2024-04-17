extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("user://data.save", FileAccess.WRITE)
	file.store_var(Global.winstotal)
	file.store_var(Global.losestotal)
	file.store_var(Global.twinstotal)
	file.store_var(Global.tlosestotal)
	Global.fresh = true
	set_process_input(true)
