extends Area2D

var can_damage = true
var window1 = 0
var window2 = 0

func this_thing():
	DisplayServer.window_get_size()
	get_viewport().get_visible_rect().size

func screensize(sigma1, sigma2):
	DisplayServer.get_display_safe_area().size = Vector2i(sigma1, sigma2)

func random_window_pos():
	randomize()
#	window1 = randf_range(0, 0)
	var _rand = RandomNumberGenerator.new()
	var width = randi_range(0, 800)
	var height = randi_range(0, 1600)
	get_window().position = Vector2(height, width)

func _on_body_shape_entered(_body_rid, body, body_shape_index, local_shape_index):
	var body_shape_owner = body.shape_find_owner(body_shape_index)
	var _body_shape_node = body.shape_owner_get_owner(body_shape_owner)
	
	var local_shape_owner = shape_find_owner(local_shape_index)
	var _local_shape_node = shape_owner_get_owner(local_shape_owner)
	if body.name == "Player":
		if can_damage == true:
			Global.health = Global.health - get_parent().en_attack_damage
			random_window_pos()
			can_damage = false
			print(Global.health)
#		elif Global.flash == true:
#			get_parent().en_health = get_parent().en_health - Global.player_attack

func _on_damage_cooldown_timeout():
	can_damage = true


func _on_body_shape_exited(_body_rid, body, body_shape_index, local_shape_index):
	var body_shape_owner = body.shape_find_owner(body_shape_index)
	var _body_shape_node = body.shape_owner_get_owner(body_shape_owner)
	
	var local_shape_owner = shape_find_owner(local_shape_index)
	var _local_shape_node = shape_owner_get_owner(local_shape_owner)
	if body.name == "Player":
		if can_damage == true:
			Global.health = Global.health - get_parent().en_attack_damage
			random_window_pos()
			can_damage = false
			print(Global.health)
#		elif Global.flash == true:
#			get_parent().en_health = get_parent().en_health - Global.player_attack
