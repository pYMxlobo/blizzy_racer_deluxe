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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.enemy_total <= 0:
		set_process_input(false)
		player.crit_multi = player.crit_multi + 0.3
		Global.player_attack = Global.player_attack + 4
		Global.max_drift = Global.max_drift + 0.1
		player.savetowerdata()
		surebuddy(0)
		$switcher.switch()
		Global.twinstotal = Global.twinstotal + 1