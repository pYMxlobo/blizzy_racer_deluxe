extends Node2D

# wiki https://github.com/pYMxlobo/blizzy_racer_deluxe/wiki
# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists("user://data.save"):
		print("you has save data :D")
		var file = FileAccess.open("user://data.save", FileAccess.READ)
		Global.winstotal = file.get_var()
		Global.losestotal = file.get_var()
		Global.twinstotal = file.get_var()
		Global.tlosestotal = file.get_var()
		if Global.winstotal == null:
			Global.winstotal = 0
		if Global.losestotal == null:
			Global.losestotal = 0
		if Global.twinstotal == null:
			Global.twinstotal = 0
		if Global.tlosestotal == null:
			Global.tlosestotal = 0
	else:
		print("you has no data D:")
		Global.winstotal = 0
		Global.losestotal = 0
		Global.twinstotal = 0
		Global.tlosestotal = 0
