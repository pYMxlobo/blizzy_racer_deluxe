extends Area2D

var can_damage = false
var window1 = 0
var window2 = 0

var attacking = false



func screensize(sigma1, sigma2):
	DisplayServer.get_display_safe_area().size = Vector2i(sigma1, sigma2)

func random_window_pos():
	randomize()
#	window1 = randf_range(0, 0)
	var _rand = RandomNumberGenerator.new()
	var width = randi_range(10, (int(DisplayServer.screen_get_size().y) - (get_tree().root.content_scale_size.y / 2)))
	var height = randi_range(0, (int(DisplayServer.screen_get_size().x) - (get_tree().root.content_scale_size.x / 2)))
	get_window().position = Vector2(height, width)

func _on_body_shape_entered(_body_rid, body, body_shape_index, local_shape_index):
	var body_shape_owner = body.shape_find_owner(body_shape_index)
	var _body_shape_node = body.shape_owner_get_owner(body_shape_owner)
	
	var local_shape_owner = shape_find_owner(local_shape_index)
	var _local_shape_node = shape_owner_get_owner(local_shape_owner)
	if body.name == "Player":
		if Global.flash == false:
			Global.health = Global.health - (get_parent().en_attack_damage * 0.9)
			random_window_pos()
			print(Global.health)
			$DamageCooldown.start()
		else:
			$DamageCooldown.start()
#		elif Global.flash == true:
#			get_parent().en_health = get_parent().en_health - Global.player_attack

func _on_damage_cooldown_timeout():
	Global.health = Global.health - get_parent().en_attack_damage
	random_window_pos()
	print(Global.health)

func _on_body_shape_exited(_body_rid, _body, _body_shape_index, _local_shape_index):
	$DamageCooldown.stop()
