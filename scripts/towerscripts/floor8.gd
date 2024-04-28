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
	Global.player_attack = Global.player_attack + 6
	player.defense = player.defense - 0.09
	Global.max_drift = Global.max_drift + 0.1
	player.savetowerdata()
	surebuddy(0)
	$switcher.switch()
