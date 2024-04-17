extends PathFollow2D

var tempdiff = Global.ai_difficulty

var poges = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	randf_range(tempdiff - 4, tempdiff + 2)
	if Global.player_selected == 1:
#		get_parent().remove_child($Path2D/Yogu)
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	float(progress)
	if Global.race == true:
		$"2/Wheels".play("wheel_active")
		poges = (get_progress() + tempdiff * 1.5) #* delta
		set_progress(poges)

