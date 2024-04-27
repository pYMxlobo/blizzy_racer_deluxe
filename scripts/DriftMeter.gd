extends TextureProgressBar

var parent_rotation 
# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = Global.max_drift


func _process(_delta):
	max_value = Global.max_drift
	value = Global.drift_charge
	if Global.see_bars == true:
		tooltip_text = str(Global.drift_charge) + " / " + str(Global.max_drift)
#	parent_rotation = get_parent().rotation
#	rotation = rotation - parent_rotation




