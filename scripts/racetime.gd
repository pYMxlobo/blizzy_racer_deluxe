extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = ("Seconds Total: " + str(Global.race_time))
