extends Camera2D

var zoomies = 0.355
# Called when the node enters the scene tree for the first time.
func _ready():
	zoom = Vector2(1, 1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	zoomies = lerp(0.355, delta, 1)
	if Global.race == true:
		zoom = Vector2(zoomies, zoomies)

