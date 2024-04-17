extends Node2D



@export var player : Node2D


var win = preload("res://scenes/towerrooms/floor3.tscn")
# Called when the node enters the scene tree for the first time.

func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi



func _ready():
	set_process_input(true)
	Global.fresh = false
	Global.bgm = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.enemy_total <= 0:
		set_process_input(false)
		player.max_forward_speed = player.max_forward_speed * 1.01
		player.temp_max = player.temp_max * 1.01
		player.forward_accel = player.forward_accel + 1
		player.drag = player.drag - 3
		Global.max_drift = Global.max_drift + 0.1
		Global.max_health = Global.max_health * 1.2
		Global.player_attack = Global.player_attack + 2
		player.savetowerdata()
		surebuddy(0)
		get_tree().root
		get_tree().change_scene_to_packed(win)
