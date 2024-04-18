extends Sprite2D

@export var speed = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	region_rect.position.x = region_rect.position.x - speed
	region_rect.position.y = region_rect.position.y - speed
