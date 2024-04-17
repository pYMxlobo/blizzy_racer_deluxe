extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	shape.radius = get_parent().get_parent().forget_range

