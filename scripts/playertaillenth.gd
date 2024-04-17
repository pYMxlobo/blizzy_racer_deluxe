extends CollisionShape2D


@onready var taillength = shape.height

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shape.height = taillength
