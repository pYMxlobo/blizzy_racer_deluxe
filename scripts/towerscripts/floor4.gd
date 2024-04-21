extends Node2D



@export var player : Node2D


#@onready var win = load("res://scenes/towerrooms/floor5.tscn")
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
	if Global.coin >= player.coins_needed:
		set_process_input(false)
		player.held_back = player.held_back + 0.03
		Global.max_drift = Global.max_drift + 0.1
		player.savetowerdata()
		surebuddy(0)
		$switcher.switch()
