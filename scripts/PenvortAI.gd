extends PathFollow2D

var tempdiff = Global.ai_difficulty

var poges = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	randf_range(tempdiff - 3, tempdiff + 3)
	if Global.player_selected == 4:
#		get_parent().remove_child($Path2D/Penvort)
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	float(progress)
	if Global.race == true:
		$"5/Wheels".play("wheel_active")
		poges = (get_progress() + tempdiff * 1.4) #* delta
		set_progress(poges)

