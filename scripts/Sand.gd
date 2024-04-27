extends Sprite2D

@export var speed = 10
@export var speedx = 0
@export var speedy = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	region_rect.position.x = region_rect.position.x - (speed + speedx)
	region_rect.position.y = region_rect.position.y - (speed + speedy)
