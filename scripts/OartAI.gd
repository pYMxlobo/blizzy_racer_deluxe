extends PathFollow2D


var tempdiff = Global.ai_difficulty

var poges = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	randf_range(tempdiff - 3, tempdiff + 2)
	if Global.player_selected == 5:
#		get_parent().remove_child($Path2D/Oart)
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	float(progress)
	if Global.race == true:
		$"6/Wheels".play("wheel_active")
		poges = (get_progress() + tempdiff * 2) #* delta
		set_progress(poges)

