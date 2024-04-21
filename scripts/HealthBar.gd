extends TextureProgressBar


var lose = load("res://scenes/loser.tscn")


func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi


func _ready():
	max_value = Global.max_health


func _process(delta):
	max_value = Global.max_health
	value = Global.health
	if Global.health <= 0:
		Global.race = false
		Global.enemy_total = 0
		Global.tlosestotal = Global.tlosestotal + 1
		OS.delay_msec(100)
		surebuddy(0)
		get_tree().root
		get_tree().change_scene_to_packed(lose)



