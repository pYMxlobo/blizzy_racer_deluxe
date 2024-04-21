extends Node2D

@export var player : Node2D

#@onready var win = load("res://scenes/towerrooms/floor1.tscn")
# Called when the node enters the scene tree for the first time.

func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi



func _ready():
	Global.enemy_total = 1
	Global.fresh = true
	Global.bgm = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.enemy_total <= 0:
		set_process_input(false)
		player.savetowerdata()
		surebuddy(0)
		$switcher.switch()
