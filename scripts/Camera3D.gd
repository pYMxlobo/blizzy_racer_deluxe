extends Camera3D

@export var player : CharacterBody2D
var cameraspeed = 750 #500

func _ready():
	await player.ready

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = player.position.x / cameraspeed
	position.z = player.position.y / cameraspeed
