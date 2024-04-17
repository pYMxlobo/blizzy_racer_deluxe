extends Node2D

#@onready var menu = load("res://scenes/quitmenu.gd")
#@onready var menu_exist = menu.instance()


func _ready():
	Global.fresh = true
	randomize()
	Global.ai_lap = 0
	Global.player_lap = 0
	Global.bgm = 3
	OS.delay_msec(100)

func surebuddy(skibidi):
		position.x = skibidi
		position.y = skibidi

var win = preload("res://scenes/winner.tscn")
var lose = preload("res://scenes/loser.tscn")

func _process(_delta):
	if Global.player_lap >= Global.howmanylaps:
		Global.race = false
		OS.delay_msec(100)
		surebuddy(0)
		get_tree().root
		get_tree().change_scene_to_packed(win)
		Global.winstotal = Global.winstotal + 1
	elif Global.ai_lap >= (Global.howmanylaps * 7):
		Global.race = false
		OS.delay_msec(100)
		surebuddy(0)
		get_tree().root
		get_tree().change_scene_to_packed(lose)
		Global.losestotal = Global.losestotal + 1
#	if Global.quit_menu == true:
#		add_child(menu_exist)
#	if Global.quit_menu == false:
#		get_parent().remove_child($quitmenu)
#		queue_free()
