extends TextureProgressBar

var parent_rotation 
# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = Global.max_drift


func _process(delta):
	max_value = Global.max_drift
	value = Global.drift_charge
#	parent_rotation = get_parent().rotation
#	rotation = rotation - parent_rotation




