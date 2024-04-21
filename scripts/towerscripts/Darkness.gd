extends Sprite2D


@export var player : CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale = Vector2(player.darkness, player.darkness)
