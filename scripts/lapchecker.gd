extends Area2D




func _on_body_shape_exited(_body_rid, body, body_shape_index, local_shape_index):
	var body_shape_owner = body.shape_find_owner(body_shape_index)
	var _body_shape_node = body.shape_owner_get_owner(body_shape_owner)
	
	var local_shape_owner = shape_find_owner(local_shape_index)
	var _local_shape_node = shape_owner_get_owner(local_shape_owner)
	if body.name == "Player":
		if Global.lapcheck == true:
			Global.player_lap += 1
			Global.lapcheck = false
	else:
		Global.ai_lap += 1
	print(Global.player_lap)
	print(Global.ai_lap)
