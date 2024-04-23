extends Node2D

@export var connected_scene: String
@export var scene_folder = "res://scenes/towerrooms/"
@export var win = false

func switch():
	Global.enemy_total = 0
	var full_path = scene_folder + connected_scene + ".tscn"
	var scene_tree = get_tree()
	scene_tree.call_deferred("change_scene_to_file", full_path)
	if win == true:
		Global.twinstotal = Global.twinstotal + 1
