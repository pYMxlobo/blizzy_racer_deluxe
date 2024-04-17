extends ShapeCast2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.ws = Vector2(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	target_position = Global.ws
