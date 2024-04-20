extends Node2D

@export var player : Node2D
@export var timer : Timer

var win = preload("res://scenes/winner.tscn")
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
		timer.start()


func _on_timer_timeout():
	set_process_input(false)
	Global.max_drift = Global.max_drift + 0.4
	player.turn_charge = player.turn_charge + 0.02
	player.backward_accel = player.backward_accel + 2
	player.savetowerdata()
	surebuddy(0)
	get_tree().root
	get_tree().change_scene_to_packed(win)
	Global.twinstotal = Global.twinstotal + 1