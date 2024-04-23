extends Node2D



@export var player : Node2D


#@onready var win = load("res://scenes/winner.tscn")
# Called when the node enters the scene tree for the first time.

func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi



func _ready():
	set_process_input(true)
	Global.fresh = false
	Global.bgm = 5



func _on_timer_timeout():
	set_process_input(false)
	Global.max_health = Global.max_health + 30
	Global.player_attack = Global.player_attack + 1
	player.regen_mult = player.regen_mult + 0.3
	player.regen_time = player.regen_time - 0.03
	Global.max_drift = Global.max_drift + 0.1
	player.savetowerdata()
	surebuddy(0)
	$switcher.switch()
