extends Node2D

@export var player : Node2D
@export var timer : Timer

#@onready var win = load("res://scenes/towerrooms/floor2.tscn")
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
	Global.max_drift = Global.max_drift + 0.2
	player.turn_charge = player.turn_charge + 0.01
	player.backward_accel = player.backward_accel + 1
	player.savetowerdata()
	surebuddy(0)
	get_tree().root
	$switcher.switch()
