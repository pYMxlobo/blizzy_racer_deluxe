extends Area2D

var can_damage = true

func _on_body_shape_entered(_body_rid, body, body_shape_index, local_shape_index):
	var body_shape_owner = body.shape_find_owner(body_shape_index)
	var _body_shape_node = body.shape_owner_get_owner(body_shape_owner)
	
	var local_shape_owner = shape_find_owner(local_shape_index)
	var _local_shape_node = shape_owner_get_owner(local_shape_owner)
	if body.name == "Player":
		if can_damage == true:
			if Global.flash == true:
				get_parent().en_hehe = get_parent().en_hehe - (Global.player_attack * get_parent().weakness)
				print(get_parent().en_hehe)


func _on_damage_cooldown_timeout():
	can_damage = true


func _on_body_shape_exited(_body_rid, body, body_shape_index, local_shape_index):
	var body_shape_owner = body.shape_find_owner(body_shape_index)
	var _body_shape_node = body.shape_owner_get_owner(body_shape_owner)
	
	var local_shape_owner = shape_find_owner(local_shape_index)
	var _local_shape_node = shape_owner_get_owner(local_shape_owner)
	if body.name == "Player":
		if can_damage == true:
			if Global.flash == true:
				get_parent().en_hehe = get_parent().en_hehe - (Global.player_attack * get_parent().weakness)
				print(get_parent().en_hehe)
